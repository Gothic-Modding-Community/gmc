# CALL Package
This part of Ikarus makes possible to call engine functions directly from scripts.

In order to be able to invoke an engine function, you must know some of its roperties. This includes the number and types of parameters, the type of return value, address of function and calling convention.

Knowledge about engine functions can be obtained using tools like IDA, which can analyze and convert GothicMod.exe / Gothic2.exe into a more human-readable format.

!!! Info
    In fact, [machine code execution (ASM)](asm.md) is part of the CALL package, but due to its complexity, this functionality is discussed in a separate article.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1268-L1654)

## Call modes
There are two modes: 

### Disposable
The simple mode that produces a disposable call that is used only once. All parameters are hardcoded.

```dae
func int hero_GetAssessEnemy() {
    const int oCNpc__GetPerceptionFunc = 7726080; //0x75E400
    
    CALL_IntParam(_@(PERC_ASSESSENEMY));
    CALL_PutRetValTo(_@(funcID));
    CALL__thiscall(_@(hero), oCNpc__GetPerceptionFunc);

    var int funcID;
    return +funcID;
};
```

### Recyclable
The second version produces code that can be used more than once. Instead of the parameters the user specifies the address where the parameters are to be taken from. In addition to executing the code, the user will receive an address that he can use to repeat the call. This is much faster than rebuilding the call from scratch.
 
```
/* Receives a pointer. In case the pointer is non-zero,
 * the code at this position is executed and 0 is returned.
 * In case pointer is zero, the current mode is changed
 * into recyclable mode, this means that the call functions
 * expect instructions to build a recyclable call. This
 * mode will continue until CALL_End(). This allows code like this:
 ```


```dae
func int Npc_GetPercFunc(var C_Npc npc, var int type) {
    const int oCNpc__GetPerceptionFunc = 7726080; //0x75E400

    var int npcPtr; npcPtr = _@(npc);

    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(type));
        CALL_PutRetValTo(_@(funcID));
        CALL__thiscall(_@(npcPtr), oCNpc__GetPerceptionFunc);
        call = CALL_End();
    };

    var int funcID;
    return +funcID;
};
```

## Start and End

### `CALL_Open`
Initializes a Recyclable call mode.
```dae
func void CALL_Open()
```

### `CALL_Begin`
A practical wrapper for `CALL_Open`. Makes a call if it had been already created, initializes it otherwise.
```dae
func int CALL_Begin(var int ptr)
```
**Parameters**

- `#!dae var int ptr`   
    Zero if you need to create a new recyclable function to be called (usually, before first use). In this case `CALL_Open` is called and `CALL_Begin` returns `1`.

**Return Value**

The function returns `1` if the new call has been created, `0` is returned otherwise.

### `CALL_Close`
Finalizes a function call in recyclable mode, restoring the previous execution context.
```dae
func int CALL_Close()
```

### `CALL_End`
Finalizes a function call, pushes the pointer onto the stack, and runs the associated assembly code (makes an actual call).
```dae
func int CALL_End()
```

**Return Value**

The function returns a pointer that could be used to repeat the call.


!!! Tip
    `CALL_Close` only finalizes the function call, returning the pointer, while `CALL_End` additionally handles pushing the pointer onto the stack and running associated assembly code.   



## Passing parameters

Parameters must be arranged on the machine stack from right to left i.e. from the parameter on the far right to the parameter on the far left. These functions generate machine code that will place parameters on the machine stack when executed.

!!! Note
    These functions do not impose any parameters on the Machine stack. Exactly it should say: You create the machine code that will put parameters on the machine stack when it is executed. And it is only carried out in the second step with the announcement of the calling convention.

### `CALL_IntParam`
Passes an integer (`int32`) as a parameter to the called function.
```dae
func void CALL_IntParam(var int param)
```
**Parameters**

- `#!dae var int param`   
    Address of an integer to be passed

### `CALL_FloatParam`
Passes an IEEE 7554 floating-point number (`single` / `zREAL`) as a parameter to the called function.
```dae
func void CALL_FloatParam(var int param)
```
**Parameters**

- `#!dae var int param`   
    Address of a float to be passed

### `CALL_PtrParam`
Passes a pointer (`void*`) as a parameter to the called function.
```dae
func void CALL_PtrParam(var int param)
```
**Parameters**

- `#!dae var int param`   
    Pointer to be passed

### `CALL_zStringPtrParam`
Passes a string (`zString*`) as a parameter to the called function.
```dae
func void CALL_zStringPtrParam(var string param)
```
**Parameters**

- `#!dae var string param`   
    String to be passed

!!! Warning
    This function only works when writing a disposable call!

### `CALL_cStringPtrParam`
Passes a char array (`char **`) as a parameter to the called function.
```dae
func void CALL_cStringPtrParam(var string param)
```
**Parameters**

- `#!dae var string param`   
    String to be passed as character array`

!!! Warning
    This function only works when writing a disposable call!

### `CALL_StructParam`
Passes a structure (struct) as a parameter to the called function.
```dae
func void CALL_StructParam(var int ptr, var int words)
```
**Parameters**

- `#!dae var int param`   
    Pointer to the object
- `#!dae var int words`   
    Size of a structure (1 word = 32 bits)

!!! Note
    `CALL_IntParam`, `CALL_FloatParam`, and `CALL_PtrParam` are functionally identical and are differentiated for code readability.

## The call
The calling convention determines how the function's parameters are passed. IDA or another disassembler can be used to identify the convention used by a specific engine function.

The announcement of the calling convention, i.e. the call of one of the four functions below is also the time of calling the function. In particular, all parameters must already be specified at this point.

### `CALL__stdcall`
Calls a function with [`__stdcall`](https://learn.microsoft.com/en-us/cpp/cpp/stdcall?view=msvc-170) (Standard Call) calling convention.
```dae
func void CALL__stdcall(var int adr)
```
**Parameters**

- `#!dae var int adr`   
    Address of a function

### `CALL__thiscall`
Calls a function with [`__thiscall`](https://learn.microsoft.com/en-us/cpp/cpp/thiscall?view=msvc-170) calling convention. Used with a member functions.
```dae
func void CALL__thiscall(var int this, var int adr)
```
**Parameters**

- `#!dae var int this`   
    Pointer to the owner class object passed as a `this` parameter
- `#!dae var int adr`   
    Address of a function

### `CALL__cdecl`
Calls a function with [`__cdecl`](https://learn.microsoft.com/en-us/cpp/cpp/cdecl?view=msvc-170) calling convention. Used with non-Windows API and non-class functions.
```dae
func void CALL__cdecl (var int adr)
```
**Parameters**

- `#!dae var int adr`   
    Address of a function


### `CALL__fastcall`
Calls a function with [`__fastcall`](https://learn.microsoft.com/en-us/cpp/cpp/fastcall?view=msvc-170) calling convention.
```dae
func void CALL__fastcall(var int ecx, var int edx, var int adr)
```
**Parameters**

- `#!dae var int ecx`   
    First parameter of a function
- `#!dae var int edx`   
    Second parameter of a function
- `#!dae var int adr`   
    Address of a function

## Return Value
As soon as the function call has taken place, i.e. after step 2, the return value can be queried. The following functions interpret the return value (usually this is the content of EAX immediately after the call) in the manner suggested in the function name. The result is then returned in a manner usable in Daedalus.

!!! Note 
    Some return values are not stored in the EAX. In that case the call of the special function `RetValIs` is required to get the return value.

    Folowing funcitons are provided: [`CALL_RetValIsFloat`](#call_retvalisfloat), [`CALL_RetValIszString`](#call_retvaliszstring), [`CALL_RetValIsStruct`](#call_retvalisstruct).

### `CALL_PutRetValTo`
Simply places the return value to the given address (mostly the address of a daedalus integer). Must be called before [The Call](#the-call) function.
```dae
func void CALL_PutRetValTo(var int adr)
```
**Parameters**

- `#!dae var int adr`   
    Destination address of the return value


### `CALL_RetValAsInt`
Retrieves an integer returned by the called function.
```dae
func int CALL_RetValAsInt()
```
**Return value**

The function returns an integer returned by the previously called engine function.

### `CALL_RetValIsFloat`
Specifies that the return value is a float. Must be called before [The Call](#the-call) function to allow getting the return value with [`CALL_RetValAsFloat`](#call_retvalasfloat).
```dae
func void CALL_RetValIsFloat()
```

### `CALL_RetValAsFloat`
Retrieves a float returned by the called function.
```dae
func int CALL_RetValAsFloat()
```
**Return value**

The function returns a float returned by the previously called engine function.

### `CALL_RetValAsPtr`
Retrieves a pointer (`void*`) returned by the called function.
```dae
func int CALL_RetValAsPtr()
```
**Return value**

The function returns a pointer returned by the previously called engine function.

### `CALL_RetValIsStruct`
Specifies that the return value is a Structure. Must be called before [The Call](#the-call) function to allow getting the return value with [`CALL_RetValAsStructPtr`](#call_retvalasstructptr).
```dae
func void CALL_RetValIsStruct(var int size)
```
**Parameters**

- `#!dae var int size`   
    Size of the returned structure in bytes

!!! Danger
    If the return value is a structure with a size larger than 32 bit, the space for the return value has to be allocated by the caller (this is us).The address to the allocated memory is expected on the stack as an additional parameter (pushed last).

!!! Warning
    It is in your responsibility to free the structure memory, when the return value is not needed any more.


### `CALL_RetValAsStructPtr`
Retrieves a pointer to the structure returned by the called function and converts it to the instance. Can be used to make an assignment to an instance, for example an assignment to a `var zCVob` if the return value is a pointer to a `zCVob`.
```dae
func MEMINT_HelperClass CALL_RetValAsStructPtr()
```
**Return value**

The function returns an instance returned by the previously called engine function.

### `CALL_RetValIszString`
Specifies that the return value is a `zString` (20 bytes structure). Must be called before [The Call](#the-call) function to allow getting the return value with [`CALL_RetValAszStringPtr`](#call_retvalasstructptr) and [`CALL_RetValAszString`](#call_retvalaszstring).
```dae
func string CALL_RetValAszString()
```

!!! Note
    `CALL_RetValAszStringPtr` and `CALL_RetValAszString` are quite different and should not be confused. Using `CALL_RetValAszString` frees up memory that may still be needed. In a reverse with `CALL_RetValAszStringPtr` memory that is no longer needed is not freed and can cause memory leak.

### `CALL_RetValAszStringPtr`
Retrievs a `zString` pointer and converts it to the daedalus string. (don't frees the memory)
```dae
func string CALL_RetValAszStringPtr()
```
**Return value**

The function returns a daedalus string form a `zString` returned by the previously called engine function.


### `CALL_RetValAszString`
Retrievs a `zString` pointer and converts it to the daedalus string. (frees the memory)
```dae
func string CALL_RetValAszString()
```
**Return value**

The function returns a daedalus string form a `zString` returned by the previously called engine function.

??? Trivia "Function author note"
    > A `zString` is merely a special case of a structure, with the difference,
    that it is used as a primitive datatype. Nobody will be willing
    to use it as a pointer to some memory or an instance in Daedalus.
    This function copies the contents of the `zString` into a
    daedalus string and frees the `zString` afterwards.

## Examples

### Apply overlay (Disposable)
```dae
// .text:0072D2C0:int __thiscall oCNpc::ApplyOverlay(class zSTRING const &)

func void example1(){
    const int oCNpc__ApplyOverlay = 7525056; //0x72D2C0 (G2A)
    CALL_zStringPtrParam ("HUMANS_MILITIA.MDS");
    CALL__thiscall (MEM_InstToPtr (hero), oCNpc__ApplyOverlay);
    //We are not interested in the return value here.
};
```

### Get time as string (Disposable)
e.g. `"7:30"` for half past seven in the morning
```dae
// .text:00780EC0:class zSTRING __thiscall oCWorldTimer::GetTimeString(void)

func void example2(){
    const int oCWorldTimer__GetTimeString = 7868096; //780EC0 (G2A)
    CALL_RetValIszString();
    CALL__thiscall (MEM_InstToPtr (MEM_WorldTimer), oCWorldTimer__GetTimeString );
    PrintDebug (CALL_RetValAszString());
};
```

### Get the "sky time" (Disposable)
Sky time is a floating point value between 0 and 1 that jumps back from 1 to 0 at noon.
```dae
// .text:00781240:float __thiscall oCWorldTimer::GetSkyTime(void)

func int GetSkyTime() {
    const int oCWorldTimer__GetSkyTime = 7868992; //0x781240
    CALL_RetValIsFloat();
    CALL__thiscall (MEM_InstToPtr (MEM_WorldTimer),
    oCWorldTimer__GetSkyTime);

    return CALL_RetValAsFloat();
};
```

### Delete Vob (Recyclable)
Call of the `oCWorld.RemoveVob`. [`MEM_DeleteVob`](objects.md#mem_deletevob) is an ikarus built-in function.
```dae
func void MEM_DeleteVob(var int vobPtr) {
    var int world; world = MEM_Game._zCSession_world;
    
    const int call = 0;
    if (CALL_Begin(call)) {
        /* oCWorld.RemoveVob */
        CALL_IntParam(_@(vobPtr));
        CALL__thiscall(_@(world), MEMINT_SwitchG1G2(7171824, 7864512));
    
        call = CALL_End();
    };
};
```
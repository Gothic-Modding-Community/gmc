---
title: ASM
---
# Ikarus Machine Code Implementation (ASM)

Machine code refers to a program or program segment written in machine language, which can be directly executed by a processor without further translation steps. The relevant machine language for us is that belonging to the x86 processor architecture. All machine instructions, what they do, and how they are encoded in machine language can be found in the [Intel Manuals](http://www.intel.com/products/processor/manuals/index.htm).

In practice, dealing with (abstract) machine instructions and manually translating them into (concrete) machine code is rarely necessary due to its complexity.

However, machine code can be useful for performing technical tasks that cannot be expressed in Daedalus directly. For example, the CALL package use the ASM function set as a basis.

!!! Note
    The functions in this chapter have the `ASM_` prefix for Assembly (language). Assembly language is a human-readable language with one-to-one correspondences to machine language. Strictly speaking, the `ASM_` prefix is misleading here, as it pertains to machine code rather than assembly language. However, conceptually, the two are closely related.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1064-L1267)


## Opcodes

The code defines several constants that represent different machine code instructions. Each constant is assigned a hexadecimal value and corresponds to a specific machine code instruction. [Here](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1070-L1111) is a link to all instructions.


## Internal Stack

The code includes an internal stack implementation, allowing the storage of data. The stack is already used at two points:

- When calling an engine function, the address of the current run is stored in the internal stack.
- When nesting the use of the CALL package, a push and pop operation is performed to manage the context.

The internal stack is implemented using an array, and the following functions are provided:

### `ASMINT_Push`
Pushes the specified `data` onto the internal stack.
```dae
func void ASMINT_Push(var int data)
```
**Parameters**

- `#!dae var int data`   
    Data pushed onto internal stack

### `ASMINT_Pop`
Pops and returns the topmost data from the internal stack.
```dae
func int ASMINT_Pop()
```
**Return value**

The function returns a data popped form the internal stack.
 
## Functions (Core)

The ASM core functionality provides a framework for assembling machine code instructions and executing them. The following functions are included:

### `ASMINT_Init`
Initializes the ASM system by creating an internal stack and finding function addresses.
```dae
func void ASMINT_Init()
```

!!! Tip
    It's worth noting that `ASMINT_Ini` is also invoked by the `MEM_InitAll` function.

### `ASM_Open`
Changes the size of the memory allocated at the start o the dictation

The memory in which the machine code is stored is allocated at the beginning of the dictation. If this function isn't called a default size (see **Constant** below) is allocated by [`ASM`](#asm) or [`ASM_Here`](#ams_here) function. The 256 bytes is often sufficient for simple applications, but if more memory is required, this function must be called at the beginning of the dictation.
```dae
func void ASM_Open(var int space)
```
**Parameters**

- `#!dae var int space`   
    Space allocated for machine code (in bytes)

**Constant**

`ASM_StandardStreamLength` constant defines the default space available for an Assembler sequence (in bytes).

```dae 
const int ASM_StandardStreamLength = 256;
```

### `ASM`
Writes machine code instructions to the stream.

Using this function it is possible to dictate machine code little by little. The `data` bytes of the `length` (maximum 4!) are appended to the previously dictated part. This creates a program piece by piece that can be executed by the processor.
```dae
func void ASM(var int data, var int length)
```
**Parameters**

- `#!dae var int data`   
    The machine code instruction or its part
- `#!dae var int length`   
    Length of the `data` (max 4 bytes)


=== "ASM_1"
    ### `ASM_1`
    [`ASM`](#asm) with `length` parameter hardcoded to 1. Writes one byte machine code instructions to the stream.
    ```dae
    func void ASM_1(var int data) 
    ```
    **Parameters**

    - `#!dae var int data`   
        One byte machine code instruction or its part

=== "ASM_2"
    ### `ASM_2`
    [`ASM`](#asm) with `length` parameter hardcoded to 2. Writes two bytes machine code instructions to the stream.
    ```dae
    func void ASM_1(var int data) 
    ```
    **Parameters**

    - `#!dae var int data`   
        Two bytes machine code instruction or its part

=== "ASM_3"
    ### `ASM_3`
    [`ASM`](#asm) with `length` parameter hardcoded to 3. Writes three bytes machine code instructions to the stream.
    ```dae
    func void ASM_1(var int data) 
    ```
    **Parameters**

    - `#!dae var int data`   
        Three bytes machine code instruction or its part

=== "ASM_4"
    ### `ASM_4`
    [`ASM`](#asm) with `length` parameter hardcoded to 4. Writes four bytes machine code instructions to the stream.
    ```dae
    func void ASM_1(var int data) 
    ```
    **Parameters**

    - `#!dae var int data`   
        Four bytes machine code instruction or its part

### `ASM_Here`
Provides, the address of the cursor, i.e., the address of the location that will be described next by a call to [`ASM`](#asm). It is guaranteed that the location where the code is written is also the location where it will be executed.
```dae
func int ASM_Here()
```

**Return value**

The function returns an address that is the current position in the machine code stream.

### `ASM_Close`
Finalizes the stream by adding a return instruction and returns the starting address of the stream. This pointer can now be passed to at any time and any number of times to execute the machine code. 

!!! Warning
    The memory area obtained by `ASM_Close` must be released manually using [`MEM_Free`](mem_utility.md#mem_free) to avoid memory leaks. It is probably sufficient for almost all practical purposes.
```dae
func int ASM_Close()
```
**Return value**

The function returns a starting address of the stream (pointer to the stream).


### `ASM_Run`
Executes a machine code (stream) from a pointer.

!!! Note
    `ASM_Run` can also be used to call engine functions with no parameters and no relevant return value. In this case `ptr` would simply have to point to the function to be executed in the code segment. 
```dae
func void ASM_Run(var int ptr)
```
**Parameters**

- `#!dae var int ptr`   
    Pointer to the executed code (returned form [`ASM_Close`](#asm_close))

### `ASM_RunOnce`
Executes the code dictated up to that point, similar to how an external function is executed. After that the code is released, and new code can be dictated.
```dae
func void ASM_RunOnce()
```

## Example
The following function sets the NPC passed as slf as the player, as if you had pressed **O** in Marvin mode with this NPC in focus. This is so short because there is already a function for this exact purpose, it's just not normally accessible from the scripts. It is therefore sufficient to write assembly code that pushes the parameter of the function (the `this` pointer) into the appropriate register and then calls the function.
```dae
func void SetAsPlayer(var C_NPC slf) { /* Address of the function */
    const int oCNpc__SetAsPlayer = 7612064; //0x7426A0 (Gothic2.exe)

    var int slfPtr;
    slfPtr = MEM_InstToPtr (slf);

    //mov ecx slfPtr
    ASM_1(ASMINT_OP_movImToECX); /* move a value to ecx */
    ASM_4(slfPtr); /* a value */

    //call oCNpc__SetAsPlayer
    ASM_1(ASMINT_OP_call);
    ASM_4(oCNpc__SetAsPlayer - ASM_Here() - 4);

    ASM_RunOnce(); /* return will be added automatically */
};
```

!!! Note
    Call targets are specified relative to the instruction that would have been executed after the actual call instruction. Therefore, both ASM_Here() and the subtraction of 4 in the call parameter are necessary.

The above example describes, among other things, [`CALL__thiscall`](#) function form the [CALL Package](call.md) that can be also used to implement `SetAsPlayer`.
```dae
func void SetAsPlayer(var C_NPC slf) { 
    const int oCNpc__SetAsPlayer = 7612064;
    CALL__thiscall(MEM_InstToPtr(slf), oCNpc__SetAsPlayer);
};
```
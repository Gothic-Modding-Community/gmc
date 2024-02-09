---
title: Parser stuff
---
# `zCParser` related functions
This Ikarus part provides some useful functions to work with parser, its instances, symbols and stack.

!!! Danger
    Remember to always assign an instance to a correct class. If you assign an `oCNpc` pointer to `oCItem` class you won't be able to read any data from it.

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L513)

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! Warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

### `MEM_ReinitParser`
Parser operations are initialized with this function.
```dae
func void MEM_ReinitParser()
```

!!! Tip
    It's worth noting that `MEM_ReinitParser` is also invoked by the `MEM_InitAll` function.


## Pointers and instances 

### `MEM_PtrToInst`
Returns an instance pointed to by the pointer. If the pointer is null an error is thrown.
```dae
func MEMINT_HelperClass MEM_PtrToInst(var int ptr)
```
**Parameters**

- `#!dae var int ptr`  
    Pointer to return an instance from

**Shortcut**

In addition there is a function **`_^`** with the same signature and functionality as `MEM_PtrToInst`. It is used as a shortcut, since the converting pointer to instance is commonly used while working with Ikarus.

```dae
func MEMINT_HelperClass _^ (var int ptr)
```

??? abstract "Example"
    Following code
    ```dae
    var oCNpc her; her = MEM_PtrToInst(heroPtr);
    ```
    is equivalent to
    ```dae
    var oCNpc her; her = _^(heroPtr);
    ```


### `MEM_NullToInst`
Returns an instance from a null pointer.
```dae
func MEMINT_HelperClass MEM_NullToInst()
```

### `MEM_AssignInst`
Takes an instance from a pointer and assigns it to a given instance. If the pointer is null an error is thrown.
```dae
func void MEM_AssignInst(var int inst, var int ptr)
```
**Parameters**

- `#!dae var int ptr`  
    Pointer to assign an instance from
- `#!dae var int inst`  
    Instance to which the pointer will be assigned

??? abstract "Example"
    Following code
    ```dae
    var oCNpc inst;
    MEM_AssignInst (inst, ptr); 
    ```
    is equivalent to
    ```dae
    var oCNpc inst;
    inst = MEM_PtrToInst(ptr);
    ```

### `MEM_AssignInstNull`
Assigns null pointer to a given instance.
```dae
func void MEM_AssignInstNull(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Instance to which the null pointer will be assigned

### `MEM_InstToPtr`
Returns a pointer to given instance.
```dae
func int MEM_InstToPtr(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    The instance to which the pointer is returned

### `MEM_InstGetOffset`
Alias to `MEM_InstToPtr`. Returns a pointer to given instance.
```dae
func int MEM_InstGetOffset(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    The instance to which the pointer is returned

### `MEM_CpyInst`
Returns a copy of a given instance
```dae
func MEMINT_HelperClass MEM_CpyInst(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Instance to copy

??? abstract "example"
    Following code
    ```dae
    selfCopy = MEM_CpyInst (self);
    ```
    is equivalent to
    ```dae
    selfCopy = MEM_PtrToInst (MEM_InstToPtr (self));
    ```
## Call function
You don't always know at compile time when you want to call which function. For example, if you want to call the condition function of a mob that the player has in focus, you are at a loss at compile time because you have no idea which mob the player will choose. Ikarus provides a way to call functions based on their name or symbol index. In the example of the mob, the name of the condition function can simply be looked up in the mob.

!!! Note
    The functions below also work for externals without any restrictions.

### Passing Parameters
If the function to be called has parameters, these must first be placed on the data stack. The parameters must be pushed in the correct order, from left to right. 

#### `MEM_PushIntParam`
Passes an integer as a parameter to the called function.
```dae
func void MEM_PushIntParam (var int param)
```
**Parameters**

- `#!dae var int param`  
    Integer to pass as a function parameter

#### `MEM_PushInstParam`
Passes an instance as a parameter to the called function.
```dae
func void MEM_PushInstParam (var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Instance to pass as a function parameter

#### `MEM_PushStringParam`
Passes a string as a parameter to the called function.
```dae
func void MEM_PushStringParam (var string str)
```
**Parameters**

- `#!dae var string str`  
    String to pass as a function parameter

### The call

#### `MEM_Call`
Calls a function.
```dae
func void MEM_Call(var func fnc)
```
**Parameters**

- `#!dae var func fnc`  
    Function to be called

#### `MEM_CallByID`
Calls a function by its ID.
```dae
func void MEM_CallByID (var int symbID)
```
**Parameters**

- `#!dae var int symbID`  
    The ID of the function to be called

#### `MEM_CallByPtr`
Calls a function by its pointer.
```dae
func void MEM_CallByPtr(var int ptr)
```
**Parameters**

- `#!dae var int ptr`  
    The pointer of the function to be called

#### `MEM_CallByOffset`
Calls a function by its offset.
```dae
func void MEM_CallByOffset(var int offset)
```
**Parameters**

- `#!dae var int offset`  
    The offset of the function to be called

#### `MEM_CallByString`
Calls a function by its name.
```dae
func void MEM_CallByString (var string fnc)
```
**Parameters**

- `#!dae var string fnc`  
    The name of the function IN CAPITAL LETTERS.

### Return value
If a function has a return value, it should be fetched from the data stack after it is called, otherwise stack overflows can occur under unfavorable circumstances (aside from that, you may simply want the return value because it contains important information).

#### `MEM_PopIntResult`
Retrieves an integer returned by the called function.
```dae
func int MEM_PopIntResult()
```
**Return value**

The function returns an integer returned by the previously called script function.

#### `MEM_PopStringResult`
Retrieves a daedalus string returned by the called function.
```dae
func string MEM_PopStringResult()
```
**Return value**

The function returns a string returned by the previously called script function.

#### `MEM_PopInstResult`
Retrieves an instance returned by the called function.
```dae
func MEMINT_HelperClass MEM_PopInstResult()
```
**Return value**

The function returns an instance returned by the previously called script function.

## Function stuff
### `MEM_GetFuncID`
Returns the ID of the given function.
```dae
func int MEM_GetFuncID(var func fnc)
```
**Parameters**

- `#!dae var func fnc`  
    The function whose ID is returned

### `MEM_GetFuncPtr`
Returns the pointer of the given function.
```dae
func int MEM_GetFuncPtr(var func fnc)
```
**Parameters**

- `#!dae var func fnc`  
    The function whose pointer is returned

### `MEM_GetFuncOffset`
Returns the offset of the given function.
```dae
func int MEM_GetFuncOffset(var func fnc)
```
**Parameters**

- `#!dae var func fnc`  
    The function whose offset is returned

### `MEM_GetFuncIDByOffset`
[`MEM_GetFuncID`](#mem_getfuncid), but with an offset as a parameter.
```dae
func int MEM_GetFuncIDByOffset(var int offset)
```
**Parameters**

- `#!dae var int offset`  
    Offset of a function whose ID is returned

**Return value**

The function returns an ID of a function with a given offset.

### `MEM_ReplaceFunc`
Replaces the `f1` function with `f2` function so if you call the first function, the second function is called.
```dae
func void MEM_ReplaceFunc(var func f1, var func f2)
```
**Parameters**

- `#!dae var func f1`  
    Function to replace
- `#!dae var func f2`  
    Function called instead of `f1`

## Parser stack

### `MEM_GetFrameBoundary`
Returns the address/pointer to the boundary of a stack frame (ESP).
```dae
func int MEM_GetFrameBoundary()
```
### `MEM_GetCallerStackPos`
Retrieves the stack position (pop position) of the caller's caller (look at the example for better understanding).
```dae
func int MEM_GetCallerStackPos()
```
**Return value**

The function returns an integer representing the stack position of the caller's caller.

??? abstract "Example"
    After calling `B()` from within `A()`, when `MEM_GetCallerStackPos()` is invoked in function `B()`, it retrieves the stack position of the caller's caller, which is function `A()` in this case. Therefore, the variable `adr` will contain the stack position of function `A()`.
    ```dae
    func void A(){
        B();
    };

    func void B(){
        int adr; adr = MEM_GetCallerStackPos();
        // Now, 'adr' will contain the stack position of A.
    };
    ```

### `MEM_SetCallerStackPos`
Sets the stack position (pop position) of the caller's caller.
```dae
func void MEM_SetCallerStackPos(var int popPos)
```
**Parameters**

- `#!dae var int popPos`  
    An integer parameter representing the new stack position of the caller's caller

## Get address

### `MEM_GetAddress_Init`
Initializes the `MEM_GetIntAddress`, `MEM_GetFloatAddress` and `MEM_GetStringAddress` functions.
```dae
func void MEM_GetAddress_Init()
```

!!! Tip
    It's worth noting that `MEM_GetAddress_Init` is also invoked by the `MEM_InitAll` function.

### `MEM_GetIntAddress`
Returns an address of a given integer.
```dae
func int MEM_GetIntAddress(var int i)
```
**Parameters**

- `#!dae var int i`  
    Integer whose address is returned

**Shortcut**

In addition there is a function **`_@`** with the same signature and functionality as `MEM_GetIntAddress`.

```dae
func int _@(var int i)
```

### `MEM_GetFloatAddress`
Returns an address of a given daedalus float.
```dae
func int MEM_GetFloatAddress(var float f)
```
**Parameters**

- `#!dae var float f`  
    Float whose address is returned

**Shortcut**

In addition there is a function **`_@f`** with the same signature and functionality as `MEM_GetFloatAddress`.

```dae
func int _@s(var string s)
```

### `MEM_GetStringAddress`
Returns an address of a given string.
```dae
func int MEM_GetStringAddress(var string s)
```
**Parameters**

- `#!dae var string s`  
    String whose address is returned

**Shortcut**

In addition there is a function **`_@s`** with the same signature and functionality as `MEM_GetStringAddress`.

```dae
func int _@s(var string s)
```

### `STR_GetAddressInit`
Alias to [`MEM_GetAddress_Init`](#mem_getaddress_init), kept for downward compatibility.
```dae
func void STR_GetAddressInit()
```

### `STR_GetAddress`
Function similar to `MEM_GetStringAddress`. There is a guarantee, that this function works initialized i.e. invokes [`MEM_GetAddress_Init`](#mem_getaddress_init), but the first time may only return an address of a copy of the string.
```dae
func int STR_GetAddress(var string str)
```

## Static arrays
Accessing static arrays like this below is very tedious in Daedalus.
```dae
var int myStaticArray[42];
```
It is not possible to access `myStaticArray[i]` with a variable index i, but only with a constant. This changes with the following functions.

!!! Danger
    Neither function performs any kind of validity check. If the value passed is not an array or offsets are beyond the boundaries of the array passed, the behavior is undefined.

### `MEM_InitStatArrs`
Initializes static arrays read and write functions.
```dae
func void MEM_InitStatArrs()
```

### `MEM_WriteStatArr`
Changes the value at the `offset` of a static integer-array.
```dae
func void MEM_WriteStatArr (var int array, var int offset, var int value)
```
**Parameters**

- `#!dae var int array`  
    Array which will be edited
- `#!dae var int offset`  
    Array index at which value will be edited
- `#!dae var int value`  
    The new value

### `MEM_ReadStatArr`
Reads the value at the specific offset of a static integer-array.
```dae
func int MEM_ReadStatArr (var int array, var int offset)
```
**Parameters**

- `#!dae var int array`  
    Array to get a value from 
- `#!dae var int offset`  
    Array index of the value to return

**Return value**

The function returns an integer value from the `offset` of a given static array.

### `MEM_WriteStatStringArr`
Changes the value at the `offset` of a static string-array.
```dae
func void MEM_WriteStatStringArr(var string array, var int offset, var string value)
```
**Parameters**

- `#!dae var string array`  
    Array which will be edited
- `#!dae var int offset`  
    Array index at which value will be edited
- `#!dae var string value`  
    The new value

### `MEM_ReadStatStringArr`
Reads the value at the specific offset of a static string-array.
```dae
func string MEM_ReadStatStringArr(var string array, var int offset)
```
**Parameters**

- `#!dae var string array`  
    Array to get a value from 
- `#!dae var int offset`  
    Array index of the value to return

**Return value**

The function returns a string form the `offset` of a given static array.

## Parser symbol
### `MEM_SetCurrParserSymb`
Makes [`currParserSymb`](#currparsersymb) point to the symbol of the specified instance.
```dae
func void MEM_SetCurrParserSymb (var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Instance to whose symbol `currParserSymb` will be set

#### `currParserSymb`
An instance representing current parser symbol.
```dae
INSTANCE currParserSymb (zCPar_Symbol);
```

### `MEM_FindParserSymbol`
Returns the index of the parser symbol with name `inst` if such a symbol exists.
```dae
func int MEM_FindParserSymbol(var string inst)
```
**Parameters**

- `#!dae var string inst`  
    Name of the symbol to be found

**Return value**

The function returns the index of the parser symbol with name `inst` if such a symbol exists. If non exists, a warning is issued and `-1` is returned.

### `MEM_GetSymbolIndex`
Alias to [`MEM_FindParserSymbol`](#mem_findparsersymbol). Returns the index of the parser symbol with name `inst` if such a symbol exists.
```dae
func int MEM_GetSymbolIndex(var string inst)
```
**Parameters**

- `#!dae var string inst`  
    Name of the symbol to be found

**Return value**

The function returns the index of the parser symbol with name `inst` if such a symbol exists. If non exists, a warning is issued and `-1` is returned.

### `MEM_GetParserSymbol`
Looks for the parser symbol with the name `inst` and returns a pointer to the appropriate `zCPar_Symbol` structure.
```dae
func int MEM_GetParserSymbol (var string inst)
```
**Parameters**

- `#!dae var string inst`  
    Name of the symbol to be found

**Return value**

The function returns the appropriate `zCPar_Symbol` structure of the parser symbol with name `inst` if such a symbol exists. If non exists, a warning is issued and `0` is returned.

### `MEM_GetSymbol`
Alias to [`MEM_GetParserSymbol`](#mem_getparsersymbol). Looks for the parser symbol with the name `inst` and returns a pointer to the appropriate `zCPar_Symbol` structure.
```dae
func int MEM_GetSymbol(var string inst)
```
**Parameters**

- `#!dae var string inst`  
    Name of the symbol to be found

**Return value**

The function returns the appropriate `zCPar_Symbol` structure of the parser symbol with name `inst` if such a symbol exists. If non exists, a warning is issued and `0` is returned.

### `MEM_GetSymbolByIndex`
[`MEM_GetParserSymbol`](#mem_getparsersymbol), but with ID (index) as a parameter.
```dae
func int MEM_GetSymbolByIndex(var int id)
```
**Parameters**

- `#!dae var string inst`  
    ID (index) of the symbol to be found

**Return value**

The function returns the appropriate `zCPar_Symbol` structure of the parser symbol with name `inst` if such a symbol exists. If non exists, a warning is issued and `0` is returned.
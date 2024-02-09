---
title: HookEngine
description: LeGo package for hooking engine functions
---
# HookEngine
This package allows you to hook anywhere in an engine function to run your own Daedalus code.

!!! Tip
    Zerxes has provided a list of all engine functions for G2, including the number of bytes to fill in for `oldInstr`. This list can be found [here](https://forum.worldofplayers.de/forum/threads/1023720-Skriptpaket-LeGo/page14?p=17631567#post17631567). This should make it possible for everyone to use the HookEngine effectively without IDA. 

## Dependencies
N/A

## Initialization
N/A

## Implementation
[:material-github: HookEngine.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/HookEngine.d)

## Functions

### `HookEngine`
Attaches a function to an engine function address.
```dae
func void HookEngine(var int address, var int oldInstr, var string function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var string function`  
    Name of Daedalus function to be called.

### `HookEngineS`
Alias to the `HookEngine` function.
```dae
func void HookEngineS(var int address, var int oldInstr, var string function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var string function`  
    Name of Daedalus function to be called.

### `HookEngineI`
Alias to `HookEngine` with funcID.
```dae
func void HookEngineI(var int address, var int oldInstr, var int funcID)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var int funcID`  
    ID of Daedalus function to be called.

### `HookEngineF`
Alias to `HookEngine` with `func` parameter.
```dae
func void HookEngineF(var int address, var int oldInstr, var func function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var func function`  
    Daedalus function to be called.

### `IsHooked`
Checks if a hook is already present at a given address.
```dae
func var int IsHooked(var int address)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function.

**Return value**

The function returns `TRUE` if the hook already exists at the address, `FALSE` is returned otherwise.

### `IsHook`
Checks if a hook with a certain function is already present at an address.
```dae
func var int IsHook(var int address, var string function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function.
- `#!dae var string function`  
    Name of a function.

**Return value**

The function returns `TRUE` if the hook already exists at the address, `FALSE` is returned otherwise.

### `IsHookI`
Alias to `IsHook` with a funcID as parameter.
```dae
func var int IsHookI(var int address, var int funcID)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function.
- `#!dae var int funcID`  
    ID of a function.

**Return value**

The function returns `TRUE` if the hook already exists at the address, `FALSE` is returned otherwise.

### `IsHookF`
Alias to `IsHook` with a function as parameter.
```dae
func var int IsHookF(var int address, var func function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function.
- `#!dae var func function`  
    Daedalus function.

**Return value**
`func` parameter
The function returns `TRUE` if the hook already exists at the address, `FALSE` is returned otherwise.

### `RemoveHook`
Removes a function from a hook so that it is no longer called.
```dae
func void RemoveHook(var int address, var int oldInstr, var string function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var string function`  
    Name of Daedalus function that should no longer be called.

### `RemoveHookI`
Alias to `RemoveHook` with funcID.
```dae
func void RemoveHook(var int address, var int oldInstr, var int funcID)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var int funcID`  
    ID of Daedalus function that should no longer be called.

### `RemoveHookF`
Alias for `RemoveHook` with `func` parameter.
```dae
func void RemoveHook(var int address, var int oldInstr, var func function)
```
**Parameters**

- `#!dae var int address`  
    Address of an engine function to which the function should be attached.
- `#!dae var int oldInstr`  
    The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
- `#!dae var func function`  
    Daedalus function that should no longer be called.

### `ReplaceEngineFunc`
Replaces an engine function with a Daedalus function.
```dae
func void ReplaceEngineFunc(var int address, var int thiscall_numparams, var string replaceFunc)
```
**Parameters**

- `#!dae var int address`  
    Address of the engine function to be replaced.
- `#!dae var int thiscall_numparams`  
    Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
- `#!dae var string replaceFunc`  
    Name of a Daedalus function to be called instead.

### `ReplaceEngineFuncI`
Alias to `ReplaceEngineFunc` with funcID.
```dae
func void ReplaceEngineFunc(var int address, var int thiscall_numparams, var int funcID)
```
**Parameters**

- `#!dae var int address`  
    Address of the engine function to be replaced.
- `#!dae var int thiscall_numparams`  
    Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
- `#!dae var int funcID`  
    ID of a Daedalus function to be called instead.

### `ReplaceEngineFuncF`
Alias to `ReplaceEngineFunc` with func parameter.
```dae
func void ReplaceEngineFunc(var int address, var int thiscall_numparams, var func function)
```
**Parameters**

- `#!dae var int address`  
    Address of the engine function to be replaced.
- `#!dae var int thiscall_numparams`  
    Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
- `#!dae var func function`  
    Daedalus function to be called instead.

### `DisableEngineFunc`
Makes sure that an engine function is simply skipped. This is very delicate and will not always work so easily.
```dae
func void DisableEngineFunc(var int address, var int thiscall_numparams)
```
**Parameters**

- `#!dae var int address`  
    Address of the engine function to be skipped.
- `#!dae var int thiscall_numparams`  
    Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).

### `Hook_ReturnFalse`
Simple function to replace `return FALSE` in hook.
```dae
func void Hook_ReturnFalse()
```

### `Hook_ReturnTrue`
Simple function to replace `return TRUE` in hook.
```dae
func void Hook_ReturnTrue()
```

## Registers 
In addition the HookEngine package implement x86 32-bit registers that can be used to access hooked function parameters.

```dae
var int EAX;
var int ECX;
var int EDX;
var int EBX;
var int ESP;
var int EBP;
var int ESI;
var int EDI;    
```
---
title: FrameFunctions
description: LeGo package for calling script functions on every frame, or every time delay
---
# FrameFunctions

!!! info inline end
    **Dependencies:**<br/>
    - [Floats](../../ikarus/floats.md)<br/>
    - [PermMem](permmem.md)<br/>
    - [HookEngine](../tools/hook_engine.md)<br/>
    - [Timer](timer.md)<br/>
    **Implementation:**<br/>
    [:material-github: FrameFunctions.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/FrameFunctions.d)

The FrameFunctions package allows to call any number of functions called on every frame, or every specified time delay.

## Initialization
Initialize with `LeGo_FrameFunctions` flag.
```dae
LeGo_Init(LeGo_FrameFunctions);
```

## Functions

### `FF_Apply`
!!! function "`FF_Apply`"
    Adds the Daedalus function `function` to the running FrameFunctions list. `function` is called each frame.
    ```dae
    func void FF_Apply(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function

### `FF_ApplyGT`
!!! function "`FF_ApplyGT`"
    Adds the Daedalus function `function` to the running FrameFunctions list. `function` is called every frame except when the game is paused.
    ```dae
    func void FF_ApplyGT(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function

### `FF_ApplyData`
!!! function "`FF_ApplyData`"
    Adds the Daedalus function `function` to the running FrameFunctions list. The integer parameter `data` is passed to the function `function`. 
    ```dae
    func void FF_ApplyData(var func function, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function.
    - `#!dae var int data`  
        Value passed to the function as a parameter

### `FF_ApplyExt`
!!! function "`FF_ApplyExt`"
    Adds the Daedalus function `function` to the running FrameFunctions list. The function `function` is called every `delay` milliseconds, and it runs only `cycles` number of times.
    ```dae
    func void FF_ApplyExt(var func function, var int delay, var int cycles)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)

### `FF_ApplyExtGT`
!!! function "`FF_ApplyExtGT`"
    Adds the Daedalus function `function` to the running FrameFunctions list. The function `function` is called every `delay` milliseconds, and it runs only `cycles` number of times. Gets called only when the game is not paused.
    ```dae
    func void FF_ApplyExtGT(var func function, var int delay, var int cycles)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)

### `FF_ApplyExtData`
!!! function "`FF_ApplyExtData`"
    Adds the Daedalus function `function` to the running FrameFunctions list. The function `function` is called every `delay` milliseconds, and it runs only `cycles` number of times. The integer parameter `data` is passed to the function `function`. 
    ```dae
    func void FF_ApplyExtData(var func function, var int delay, var int cycles, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function.
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)
    - `#!dae var int data`  
        Value passed to the function as a parameter

### `FF_ApplyExtDataGT`
!!! function "`FF_ApplyExtDataGT`"
    Adds the Daedalus function `function` to the running FrameFunctions list. The function `function` is called every `delay` milliseconds, and it runs only `cycles` number of times. The integer parameter `data` is passed to the function `function`. Gets called only when the game is not paused.
    ```dae
    func void FF_ApplyExtData(var func function, var int delay, var int cycles, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function.
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)
    - `#!dae var int data`  
        Value passed to the function as a parameter

### `FF_ApplyOnce`
!!! function "`FF_ApplyOnce`"
    Alias to [FF_Apply](#ff_apply), which only adds the function once, even after multiple calls.
    ```dae
    func void FF_ApplyOnce(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function

### `FF_ApplyOnceGT`
!!! function "`FF_ApplyOnceGT`"
    Alias to [FF_ApplyGT](#ff_applygt), which only adds the function once, even after multiple calls. Loop doesn't run if the game is paused.
    ```dae
    func voidoften FF_ApplyOnceGT(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function.

### `FF_ApplyOnceData`
!!! function "`FF_ApplyOnceData`"
    Alias to [FF_ApplyData](#ff_applydata), which only adds the function with the specified parameter once, even after multiple calls.
    ```dae
    func void FF_ApplyOnceData(var func function, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function.
    - `#!dae var int data`  
        Value passed to the function as a parameter

### `FF_ApplyOnceExt`
!!! function "`FF_ApplyOnceExt`"
    Alias to [FF_ApplyExt](#ff_applyext), which adds the function only once, after repeated calls.
    ```dae
    func void FF_ApplyOnceExt(var func function, var int delay, var int cycles)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)

### `FF_ApplyOnceExtGT`
!!! function "`FF_ApplyOnceExtGT`"
    Alias to [FF_ApplyExtGT](#ff_applyextgt), which adds the function only once after repeated calls. Loop doesn't run if the game is paused.
    ```dae
    func void FF_ApplyOnceExtGT(var func function, var int delay, var int cycles)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)

### `FF_ApplyOnceExtData`
!!! function "`FF_ApplyOnceExtData`"
    Alias to [FF_ApplyExtData](#ff_applyextdata), which adds the function with the specified parameter only once, after repeated calls.
    ```dae
    func void FF_ApplyOnceExtData(var func function, var int delay, var int cycles, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int delay`  
        Delay between calls in milliseconds (0 = every frame)
    - `#!dae var int cycles`  
        How many times should the function be called (-1 = endless)
    - `#!dae var int data`  
        Value passed to the function as a parameter

### `FF_Active`
!!! function "`FF_Active`"
    Checks whether the `function` is active.
    ```dae
    func int FF_Active(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function

    **Return value**
    The function returns `TRUE` if the function is active, `FALSE` if it is not.

### `FF_ActiveData`
!!! function "`FF_ActiveData`"
    Checks whether the `function` with the specified `data` is active.
    ```dae
    func int FF_ActiveData(var func function, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the function
    - `#!dae var int data`   
        Value previously passed to the function

    **Return value**
    The function returns `TRUE` if the function is active, `FALSE` if it is not.

### `FF_Remove`
!!! function "`FF_Remove`"
    Stops a specific FrameFunction.
    ```dae
    func void FF_Remove(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the stopped function

### `FF_RemoveAll`
!!! function "`FF_RemoveAll`"
    Stops all instances of a specific FrameFunction.
    ```dae
    func void FF_RemoveAll(var func function)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the stopped function

### `FF_RemoveData`
!!! function "`FF_RemoveData`"
    Stops a specific FrameFunction, with the specified value (see [`FF_ApplyExtData`](#ff_applyextdata) ).
    ```dae
    func void FF_RemoveData(var func function, var int data)
    ```
    **Parameters**

    - `#!dae var func function`  
        Name of the stopped function
    - `#!dae var int data`  
        Value previously passed to the function as a parameter

## Examples

### A function called every frame
In this example function `MyFunc` will be executed on every frame.
```dae
func void Example1()
{
    FF_Apply(MyFunc);
};

func void MyFunc() {};
```
After the `Example1` function is executed the function `MyFunc` is called on every frame.

The easiest and best way to run a function from the beginning is to call [`FF-Apply`](#ff_apply) directly in the `Init_Global` (under `LeGo_Init`), there is a small problem: If the game is loaded, `Init_Global` is called a second time, the function is added to the list again and is therefore always called twice.

To avoid this effect, you should check whether the function is already active:
```dae
func void Example1()
{
    if(!FF_Active(MyFunc))
    {
        FF_Apply(MyFunc);
    };
};
```

However, since LeGo version 2.2 there is an even more pleasant method to do this:
```dae
func void Example1()
{
    FF_ApplyOnce(MyFunc);
};
```
[`FF_ApplyOnce`](#ff_applyonce) function already implements the check for function activity.

### Calling delayed function
Create a function, that is called once after 3 seconds.
```dae
func void Example2()
{
    FF_ApplyExt(MyFunc2, 3000, 1); // 3000 ms = 3 s, this function is called only once
};

func void MyFunc2() {};
```

There is also a `Once` variant of this function, that prevents adding it twice into the frame function list.
```dae
func void Example2()
{
    FF_ApplyOnceExt(MyFunc2, 3000, 1);
};
```
!!! Note
    `#!dae FF_ApplyExt(MyFunc, 0, -1)` is the same as `#!dae FF_Apply(MyFunc)`.

### FrameFunction with Timer
Since LeGo 2.2, FrameFunctions package uses the Timer package, so it is possible to pause FrameFunctions at will:
```dae
func void Example3()
{
    FF_ApplyOnceExt(MyFunc3, 4000, 2);
};

func void MyFunc3()
{
    Timer_SetPaused(!Timer_GetPaused());
};
```
This would pause the timer after 4 seconds and let it continue after 8 seconds.

!!! Warning
    Because the timer doesn't run, the frame function execution is stopped as well. **This script won't work**. If the timer is to be paused, it must be paused outside FrameFunctions.

!!! Note
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_FrameFunctions).

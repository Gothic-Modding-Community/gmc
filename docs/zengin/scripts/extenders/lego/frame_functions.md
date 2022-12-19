# FrameFunctions
This package can start without major problems and especially without a trigger any number of loops that can be called every frame or delayed.

## Dependencies

- Floats
- PermMem
- HookEngine
- Timer

## Initialization
Initialize with `LeGo_FrameFunctions` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_FrameFunctions);
```
## Implementation
[:material-github: FrameFunctions.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/FrameFunctions.d)

## Functions

### FF_Apply
Adds the script function 'function' to the list. 'function' is called each frame.
```dae
void FF_Apply(func function) {};
```

- `function` - name of the function

### FF_ApplyGT
Adds the script function 'function' to the list. 'function' is called every frame except when the game is paused.
```dae
void FF_ApplyGT(func function) {};
```

- `function` - name of the function

### FF_ApplyExt
Adds the script function to the list with advanced options.
```dae
void FF_ApplyExt(func function, int delay, int cycles) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)

### FF_ApplyExtGT
Adds the script function to the list with advanced options. Loop doesn't run if the game is paused.
```dae
void FF_ApplyExt(func function, int delay, int cycles) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)

### FF_ApplyExtData
In this form of FF-ApplyExt, the function can be given a parameter, so the function signature expects an integer as a parameter.
```dae
void FF_ApplyExtData(func function, int delay, int cycles, int data) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)
- `data` - value passed to the function as a parameter

### FF_ApplyExtDataGT
In this form of FF-ApplyExt, the function can be given a parameter, so the function signature expects an integer as a parameter. Loop doesn't run if the game is paused.
```dae
void FF_ApplyExtData(func function, int delay, int cycles, int data) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)
- `data` - value passed to the function as a parameter

### FF_ApplyOnce
Alias to FF_Apply, which only adds the function once, even after multiple calls.
```dae
void FF_ApplyOnce(func function) {};
```

- `function` - name of the function

### FF_ApplyOnceGT
Alias to FF_ApplyGT, which only adds the function once, even after multiple calls. Loop doesn't run if the game is paused.
```dae
void FF_ApplyOnceGT(func function) {};
```

- `function` - name of the function

### FF_ApplyOnceExt
Alias to FF-ApplyExt, which adds the function only once after repeated calls.
```dae
void FF_ApplyOnceExt(func function, int delay, int cycles) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)

### FF_ApplyOnceExtGT
Alias to FF-ApplyExtGT, which adds the function only once after repeated calls. Loop doesn't run if the game is paused.
```dae
void FF_ApplyOnceExtGT(func function, int delay, int cycles) {};
```

- `function` - name of the function
- `delay` - delay between calls in milliseconds. (0 = every frame)
- `cycles` - how often should the function be called (-1 = endless)

### FF_Active
Checks whether 'function' is already active.
```dae
int FF_Active(func function) {};
```

- `function` - name of the function
- `return` - does this function run? (yes/no)

### FF_Remove
Removes a script function from the list.
```dae
void FF_Remove(func function) {};
```

- `function` - name of the function

### FF_RemoveData
Removes a script function with the specified value from the list (see `FF-ApplyExtData()` ).
```dae
void FF_RemoveData(func function, int data) {};
```

- `function` - name of the function
- `data` - value previously passed to the function as a parameter

## Examples

### A function called every frame
A specific function should be called (without a trigger) every frame:
```dae
func void Example1() {
    FF_Apply(MyFunc);
};

func void MyFunc() {
};
```
After Example1 is called this function comes to each frame.

The easiest method to run a function from the beginning is to call FF-Apply directly in the Init-Globals (under LeGo-Init), only a small problem opens up: If a game state is loaded, Init-Globals is called a second time, the function is double in the list, and is therefore always called twice.

To avoid this effect, you should check whether the function is already active:
```dae
func void Example1() {
    if(!FF_Active(MyFunc)) {
        FF_Apply(MyFunc);
    };
```
That is already all.

However, since LeGo 2.2 there is an even more pleasant method to implement this:
```dae
func void Example1() {
    FF_ApplyOnce(MyFunc);
};
```

Ultimately, here is also a query if function is applied , but you only have to write one line.

### Calling delayed function
Now we do it according to the same principle, only now a function should be executed once after three seconds:
```dae
func void Example2() {
    FF_ApplyExt(MyFunc2, 3000, 1);
};

func void MyFunc2() {
};
```
Thanks to the new FF-ApplyExt (from LeGo 2.9), this is quite simple. 3000 are our three seconds (3000ms), the 1 is a number of implementations.

Of course, there is also an once-output for FF-ApplyExt:
```dae
func void Example2() {
    FF_ApplyOnceExt(MyFunc2, 3000, 1);
};
```
!!! Note
    FF_ApplyExt(MyFunc, 0, -1) entspricht FF_Apply(MyFunc).

### FrameFunction with Timer
Since LeGo 2.2, FrameFunctions uses the Timer package, so it's possible to pause FrameFunctions at will:
```dae
func void Example3() {
    FF_ApplyOnceExt(MyFunc3, 4000, 2);
};

func void MyFunc3() {
    Timer_SetPaused(!Timer_GetPaused());
};
```
This would pause the timer after 4 seconds and let it continue after 8 seconds.

!!! Warning
    Because the stopwatch doesn't keep LeGo running while it's stopped, this script won't work. If the stopwatch is to be paused, it must do so outside of FrameFunctions.

[//]: <> (I am not sure what it mean. @auronen you must check this before merging)

!!! Note
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_FrameFunctions)
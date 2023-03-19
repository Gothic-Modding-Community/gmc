# HookDaedalus
This package allows hooking daedalus functions. The principle is similar [HookEngine](hook_engine.md). We have a function (hooked function) into which we would like to hook another function (hook function).

!!! Tip
    Having to hook a Daedalus function should be pretty rare, because you can simply adjust the corresponding function. However, it may become necessary in some contexts.

## Dependencies
N/A

## Initialization
N/A

## Implementation
[:material-github: HookDaedalus.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/HookDaedalus.d)

## Functions

### `HookDaedalusFunc`
Hooks the function.
```dae
func void HookDaedalusFunc(var func hooked, var func hook)
```
**Parameters**

- `#!dae var func hooked`  
    Hooked function
- `#!dae var func hook`  
    Hook function

### `HookDaedalusFuncI`
`HookDaedalusFunc` but with functoin ID.
```dae
func void HookDaedalusFuncI(var int hookedID, var int hookID)
```
**Parameters**

- `#!dae var int hookedID`  
    ID of hooked function
- `#!dae var int hookID`  
    ID of hook function

### `HookDaedalusFuncS`
`HookDaedalusFunc` but with function name.
```dae
func void HookDaedalusFuncS(var string hookedName, var string hookName)
```
**Parameters**

- `#!dae var string hookedName`  
    Name of hooked function
- `#!dae var string hookName`  
    Name of hook function

### `IsHookD`
Checks whether a function is already hooked. Each function can be hooked any number of times, but each function can only hook one other.
```dae
func int IsHookD(var int funcID)
```
**Parameters**

- `#!dae var int funcID`
    Symbol index of a hook function

**Return vlaue**
The function returns `TRUE` if the function is already hooking another, `FALSE` is returned otherwise.

### `ContinueCall`
Continues the program run with the original function.
```dae
func void ContinueCall()
```

### `PassArgumentI`
Passes an integer as an argument to the original function. Must be called before `ContinueCall`.
```dae
func void PassArgumentI(var int i)
```
**Parameters**

- `#!dae var int i`
    Argument to forward

### `PassArgumentS`
Passes a sting as an argument to the original function. Must be called before `ContinueCall`.
```dae
func void PassArgumentS(var string s)
```
**Parameters**

- `#!dae var string s`
    Argument to forward

### `PassArgumentN`
Passes an instance as an argument to the original function. Must be called before `ContinueCall`.
```dae
func void PassArgumentN(var instance n)
```
**Parameters**

- `#!dae var instance n`
    Argument to forward

## Examples

### Hook before function
We have a hook:
```dae
HookDaedalusFunc(hooked, hook);
```
The functions can look like that:
```dae
func void hooked() {
    Print("Orginal function");
};

func void hook() {
    Print("Our hook");
    ContinueCall();
};
```
The results should look like that
```dae
Our hook
Orginal function
```

### Hook after function
We have the same hook:
```dae
HookDaedalusFunc(hooked, hook);
```
The functions are also similar, but the `ContinueCall();` is called first:
```dae
func void hooked() {
    Print("Orginal function");
};

func void hook() {
    ContinueCall();
    Print("Our hook");
};
```
The results should look like that:
```dae
Orginal function
Our hook
```

### Arguments and return values
If a function to be hooked expects parameters or returns a value, our hooking function should conform to that.
```dae
func int hooked(var int i) {
     Print("Orginal function");
     return i+1;
};

func int hook(var int i) {
     Print("Our hook");
     PassArgumentI(i);
     ContinueCall();
};
```
In this case, we may not return the value at the end of the hook because the returned value will just stay on the stack. However, we shouldn't give up on calling PassArgumentI(i) to ensure that i is still on top of the stack when the program continues with hooked.

### Manipulation of arguments and return values
We can also manipulate arguments and return values with our hook.
```dae
func int hook(var int i) {
    Print("Our hook");
    PassArgumentI(i+1);     // add 1
    ContinueCall();
    i = MEM_PopIntResult();
    i *= 2;                 // Multiply by 2
    return i;
};
```

### Multiple hooks
A function can be hooked any number of times, but each function can only hook one. New hooks are always inserted after the previous one. The following example illustrates this quite well.
```dae
HookDaedalusFunc(a, b); // B hooks A
HookDaedalusFunc(a, c); // C hooks A to B
HookDaedalusFunc(a, d); // D hooks A to C

HookDaedalusFunc(c, b); // Ignored because B is already hooking a function

var int i; i = a(1);


// Hooked function
func int a(var int i) {
    MEM_Info(ConcatStrings("---  A: ", IntToString(i)));
    return i+1;
};

// First hook function:
// Replaces `a` because the program run is not continued with ContinueCall
func int b(var int i) {
    MEM_Info(ConcatStrings("  -- B: ", IntToString(i)));
    return i;
};

// Second hook function:
// Increments the argument before ContinueCall and then decrements the return value
func int c(var int i) {
    MEM_Info(ConcatStrings(" -> C: ", IntToString(i)));
    passArgumentI(i+1);
    ContinueCall();

    i = MEM_PopIntResult();
    i -= 1;
    MEM_Info(ConcatStrings(" <- C: ", IntToString(i)));
    return i;
};

// Third hook function:
// Increments the argument before ContinueCall and then decrements the return value
func int d(var int i) {
    MEM_Info(ConcatStrings("-> D: ", IntToString(i)));
    passArgumentI(i+1);
    ContinueCall();

    i = MEM_PopIntResult();
    i -= 1;
    MEM_Info(ConcatStrings("<- D: ", IntToString(i)));
    return i;
};

// Output:
// -> D: 1
//  -> C: 2
//   -- B: 3
//  <- C: 2
// <- D: 1
```
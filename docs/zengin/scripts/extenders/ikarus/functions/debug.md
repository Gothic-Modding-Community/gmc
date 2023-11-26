# Debug
A set of debugging and error-handling functions for mod development with Ikarus.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L135-L327)

## Functions

### `MEM_CheckVersion`
Checks if the version of Ikarus is the specified version or newer.
```dae
func int MEM_CheckVersion(var int base, var int major, var int minor)
```
**Parameters**

- `#!dae var int base`  
    Base version number
- `#!dae var int major`  
    Major revision number
- `#!dae var int minor`  
    Minor revision number

**Return value**

The function returns `TRUE` if the version of Ikarus is the specified version or newer, `FALSE` is returned otherwise.


### `MEM_SetShowDebug`
Sets the variable that is also toggled by the `toggle debug` command. As a result, messages outputted by `PrintDebug` are directed to the [zSpy](../../../../tools/zSpy.md)
```dae
func void MEM_SetShowDebug(var int on)
```
**Parameters**

- `#!dae var int on`   
	Specifies whether to turn on (`TRUE`) or off (`FALSE`) debug information.

### `MEM_SendToSpy`
Sends a message to the debugging console.
```dae
func void MEM_SendToSpy(var int errorType, var string text)
```
**Parameters**

- `#!dae var int errorType`  
    Type of error (e.g., `zERR_TYPE_FAULT`, `zERR_TYPE_WARN`, `zERR_TYPE_INFO`)
- `#!dae var string text`  
    The message to be sent.

### `MEM_ErrorBox`
Displays an error message in a message box.
```dae
func void MEM_ErrorBox(var string text)
```
**Parameters**

- `#!dae var string text`  
    The error message to be displayed.

### `MEM_PrintStackTrace`
Prints the stack trace.
```dae
func void MEM_PrintStackTrace()
```

### `MEM_Error`
Handles a fatal error, displaying the error message and printing the stack trace.
```dae
func void MEM_Error(var string error)
```
**Parameters**

- `#!dae var string error`  
    The error message.

### `MEM_Warn`
Handles a warning, displaying the warning message and printing the stack trace.
```dae
func void MEM_Warn(var string warn)
```
**Parameters**

- `#!dae var string warn`  
    The warning message.

### `MEM_Info`
Handles an information message, printing it if enabled in the settings.
```dae
func void MEM_Info(var string info)
```
**Parameters**

- `#!dae var string info`  
    The information message.

### `MEM_AssertFail`
Handles an assertion failure, reporting the error message as a fatal error.
```dae
func void MEM_AssertFail(var string assertFailText)
```
**Parameters**

- `#!dae var string assertFailText`  
    The assertion failure message.

### `MEM_Debug`
Freely conigurable debug chanell. See how to setup it in the [Constants](../constants.md#mem_debug) article.
```dae
func void MEM_Debug(var string message)
```
**Parameters**

- `#!dae var string message`  
    The debug message.

### `MEMINT_SwitchG1G2`
Switches between values based on the game version. Used mainly to change addresses in multi-platform hooks or function calls.
```dae
func int MEMINT_SwitchG1G2(var int g1Val, var int g2Val)
```
**Parameters**

- `#!dae var int g1Val` 
    The value to return if the game version is Gothic 1.
- `#!dae var int g2Val`  
    The value to return if the game version is Gothic 2.

**Return value**

The function returns an appropriate value based on the game version.
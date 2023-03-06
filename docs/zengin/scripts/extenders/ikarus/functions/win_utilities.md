# Windows Utilities
This part of Ikarus implement some WinAPI functions that can be used directly from Gothic scripts.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
func void MEM_InitAll () {};
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1839)

## Functions

### `LoadLibrary`
Loads the specified module into the address space of the calling process. Full documentation [here](https://learn.microsoft.com/pl-pl/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya?redirectedfrom=MSDN)
```dae
func int LoadLibrary (var string lpFileName)
```
**Parameters**

- `#!dae var string lpFileName`  
    Name of loaded module

**Return value**

The function returns a handle of the module.

### `GetProcAddress`
Retrieves the address from the specified dynamic-link library. Full documentation [here](https://learn.microsoft.com/pl-pl/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress?redirectedfrom=MSDN)
```dae
func int GetProcAddress (var int hModule, var string lpProcName)
```
**Parameters**

- `#!dae var int hModule`  
    A handle to the DLL module that contains the function or variable. Can be obtained using the LoadLibrary function
- `#!ade var string lpProcName`  
    The function or variable name.

**Return value**
The function returns address of the function or variable.

### `FindKernelDllFunction`
Uses `GetProcAddress` to find function into `KERNEL32.DLL` file.
```dae
func int FindKernelDllFunction (var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the looked function.

**Return value**

The function returns address of the function.

### `VirtualProtect`
Changes the protection on a region of committed pages in the virtual address space of the calling process. Full documentation [here](https://learn.microsoft.com/pl-pl/windows/win32/api/memoryapi/nf-memoryapi-virtualprotect?redirectedfrom=MSDN)
```dae
func int VirtualProtect (var int lpAddress, var int dwSize, var int flNewProtect) {};
```
**Parameters**

- `#!dae var int lpAddress`  
    The address of the starting page of the region of pages whose access protection attributes are to be changed.
- `#!dae var int dwSize`  
    The size of the region whose access protection attributes are to be changed, in bytes.
- `#!dae var int flNewProtect`  
    The memory protection option. All options can be found [here](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1908).

**Return value**

The function returns `lpflOldProtectPtr` - a pointer to a variable that receives the previous access protection value.

Author's comment:
> I made `lpflOldProtectPtr` the return value and ignored the return Value of VirtualProtect.

### `MemoryProtectionOverride`
Alais to `VirtualProtect` but with predefinied `PAGE_EXECUTE_READWRITE` protection option
```dae
func void MemoryProtectionOverride (var int address, var int size)
```
**Parameters**

- `#!dae var int address`  
    The address of the starting page of the region of pages whose access protection attributes are to be changed.
- `#!dae var int size`  
    The size of the region whose access protection attributes are to be changed, in bytes.

### `MEM_MessageBox`
Calls the WinAPI MessageBox function.
```dae
func int MEM_MessageBox (var string txt, var string caption, var int type)
```
**Parameters**

- `#!dae var string txt`  
    Conntent of the MessageBox.
- `#!dae var string caption`  
    Header of MessageBox.
- `#!dae var int type`  
    Type of MessageBox. All types listed [here](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1957).

### `MEM_InfoBox`
Alias to `MEM_MessageBox` with "Information:" header and `MB_OK | MB_ICONINFORMATION` type.
```dae
func void MEM_InfoBox (var string txt)
```
**Parameters**

- `#!dae var string txt`  
    Conntent of the InfoBox.

## Examples

### Sleep
Following function calls a `Sleep` function form `KERNEL32.DLL`.
A documentation of this function can be found [here](http://msdn.microsoft.com/en-us/library/ms686298%28v=vs.85%29.aspx).
```dae
func void Sleep(var int ms) {
    var int adr;
    adr = GetProcAddress (LoadLibrary ("KERNEL32.DLL"), "Sleep");
    
    CALL_IntParam(ms);
    CALL__stdcall(adr); //0x007B47E6
};
```
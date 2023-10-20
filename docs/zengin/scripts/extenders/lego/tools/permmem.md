# PermMem
PermMem is a powerful package that allows classes (or instances) to be used permanently even after loading or restarting by saving them to the ASCII `.ZEN` archive in the savegame directory. PermMem manages handles that are used to access instances, and provides various functions to manipulate these handles and instances.

## Dependencies

- [Saves](../applications/saves.md)
- [Locals](locals.md)

## Initialization
Initialize with `LeGo_PermMem` flag.
```dae
LeGo_Init(LeGo_PermMem);
```

## Implementation
[:material-github: PermMem.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/PermMem.d)

## Functions

### `new`
Creates a handle to a new instance of `inst`.
```dae
func int new(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    A valid instance. Used as "constructor" 

**Return value**

The function returns a new, valid PermMem handle.

### `create`
Similar to `new`, but here a pointer is returned directly and not a handle. Caution! Not managed by PermMem!
```dae
func int create(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    A valid instance. Used as "constructor" 

**Return value**

The function returns a pointer to the new instance.

### `wrap`
"Wraps" a handle "around" a pointer so that the pointer can be used with any function that expects handles.
Only conditionally managed by PermMem. 
```dae
func int wrap(var int inst, var int ptr)
```
**Parameters**

- `#!dae var int inst`  
    A valid instance. Determines the type of the handle
- `#!dae var int ptr`  
    Pointer to wrap 

**Return value**

The function returns a handle with `ptr` as content.

### `clear`
Cleans the handle. After that it is invalid. 
```dae
func void clear(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `release`
Frees the handle. The reserved memory is not deleted, the handle becomes invalid. 
```dae
func void release(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `delete`
Cleans the handle just like `clear`, only the destructor is also called. 
```dae
func void delete(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `free`
Similar to `delete`, only here a pointer is destroyed and not a handle. Caution! Not managed by PermMem!
```dae
func void free(var int ptr, var int inst)
```
**Parameters**

- `#!dae var int ptr`  
    The pointer to be cleaned
- `#!dae var int inst`  
    Instance used in [`create`](#create) function.

### `get`
Returns the instance of the handle. 
```dae
func instance get(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `getPtr`
Returns a pointer to instance of handle. 
```dae
func int getPtr(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `setPtr`
Sets the pointer of a handle. 
```dae
func void setPtr(var int hndl, var int ptr)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle
- `#!dae var int ptr`  
    New pointer for handle

### `getInst`
Returns the instance used to create the given handle in [`new`](#new) function.
```dae
func int getInst(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Valid PermMem handle

### `numHandles`
Returns the number of handles managed by PermMem.
```dae
func int numHandles()
```

### `sizeof`
Returns Size of the instance's class in bytes 
```dae
func int sizeof(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Any instance

### `Hlp_IsValidHandle`
Indicates whether the handle exists and is managed by PermMem. 
```dae
func int Hlp_IsValidHandle(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    PermMem's handle

**Return value**

The function returns `TRUE` if the handle is valid (managed by PermMem), `FALSE` is returned otherwise.

??? abstract "Example"
    The example function that use `Hlp_IsValidHandle` is [`Bar_SetMax`](../applications/bars.md#bar_setmax) form LeGo [Bars](../applications/bars.md) package. The function first checks if the handle is valid, then gets the instance and changes its parameters.

    ```dae
    func void Bar_SetMax(var int bar, var int max) 
    {
        if(!Hlp_IsValidHandle(bar)) { return; };
        var _bar b; b = get(bar);
        b.valMax = max;
    };
    ```

### `foreachHndl`
Executes a function for each handle of an instance. 
```dae
func void foreachHndl(var int inst, var func fnc)
```
**Parameters**

- `#!dae var int inst`  
    The function is called for this instance 
- `#!dae var int inst`  
    This function is called. The signature is `function(int handle)`

### `hasHndl`
Checks if PermMem has a handle of this instance. 
```dae
func int hasHndl(var int inst)
```
**Parameters**

- `#!dae var int inst`  
    Instance to be checked 

**Return value**

The function returns `TRUE` if the PermMem has a handle of this instance, `FALSE` is returned otherwise.

### `MEM_ReadStringArray`
Function moved to PermMem form [Ikarus](../../ikarus/functions/mem_access.md#mem_readstringarray). Reads string from the array at the `arrayAddress`. 
```dae
func string MEM_ReadStringArray(var int arrayAddress, var int index)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)

**Return value**

The function returns string from the array if the address is correct.


### `PM_Exists`
Checks if the specified field already exists in the archive. (used with archiver/unarchiver)
```dae
func int PM_Exists(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the field

**Return value**
The function returns `TRUE` if the field exists in the archive, `FALSE` is returned otherwise. 

## Archiver

### `PM_SaveInt`
Saves an integer to the archive.
```dae
func void PM_SaveInt (var string name, var int val)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int val`   
    Value of the saved integer

### `PM_SaveFloat`
Saves a daedalus float to the archive.
```dae
func void PM_SaveFloat (var string name, var int flt)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int flt`   
    Value of the saved float

### `PM_SaveString`
Saves a string to the archive.
```dae
func void PM_SaveString (var string name, var string val)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var string val`   
    Saved string

### `PM_SaveFuncID`
Saves a function ID to the archive.
```dae
func void PM_SaveFuncID(var string name, var int fnc)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int fnc`   
    Saved function ID

### `PM_SaveFuncOffset`
Saves a function offset to the archive.
```dae
func void PM_SaveFuncOffset(var string name, var int fnc)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int fnc`   
    Saved function offset

### `PM_SaveFuncPtr`
Saves a function pointer to the archive.
```dae
func void PM_SaveFuncPtr(var string name, var int fnc)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int fnc`   
    Saved function pointer

### `PM_SaveClassPtr`
Saves a pointer of a class to the archive.
```dae
func void PM_SaveClassPtr(var string name, var int ptr, var string className)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int ptr`  
    Saved pointer
- `#!dae var string className`  
    Name of the class of stored pointer

### `PM_SaveClass`
Saves a class like `PM_SaveClassPtr`.
```dae
func void PM_SaveClass(var string name, var int ptr, var string className)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int ptr`  
    Saved class pointer
- `#!dae var string className`  
    Name of the class of stored pointer

### `PM_SaveIntArray`
Saves an array of integers.
```dae
func void PM_SaveIntArray(var string name, var int ptr, var int elements)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int ptr`  
    Pointer to the array
- `#!dae var int elements`  
    Number of elements in array

### `PM_SaveStringArray`
Saves an array of integers.
```dae
func void PM_SaveStringArray(var string name, var int ptr, var int elements)
```
**Parameters**

- `#!dae var string name`  
    Name of the field in saved archive
- `#!dae var int ptr`  
    Pointer to the array
- `#!dae var int elements`  
    Number of elements in array

## Unarchiver

### `PM_Load`
Universal function to load integers, floats, class pointers and int arrays.
```dae
func int PM_Load(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

**Return value**
The function returns the data existing in the archive at the given field.

### `PM_LoadInt`
Returns an integer stored in the archive.
```dae
func int PM_LoadInt(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadFloat`
Returns a daedalus float stored in the archive.
```dae
func int PM_LoadFloat(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadString`
Returns a string stored in the archive.
```dae
func string PM_LoadString(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadFuncID`
Returns a function ID stored in the archive.
```dae
func int PM_LoadFuncID(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadFuncOffset`
Returns a function offset stored in the archive.
```dae
func int PM_LoadFuncOffset(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadFuncPtr`
Returns a function pointer stored in the archive.
```dae
func int PM_LoadFuncPtr(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadClassPtr`
Returns a class pointer stored in the archive.
```dae
func int PM_LoadClassPtr(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadClass`
Loads a pointer to the class from the archive to `destPtr`.
```dae
func void PM_LoadClass(var string name, var int destPtr)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field
- `#!dae var int destPtr`  
    Destination pointer, the address to where it will deserialize the saved data

### `PM_LoadArray`
Returns a pointer to array stored in the archive.
```dae
func int PM_LoadArray(var string name)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field

### `PM_LoadArrayToPtr`
Loads a pointer to array from the archive to `destPtr`.
```dae
func void PM_LoadArrayToPtr(var string name, var int destPtr)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field
- `#!dae var int destPtr`  
    Destination pointer, the address to where it will deserialize the saved data

### `PM_LoadToPtr`
Universal function to load array or class pointer from the archive to `destPtr`.
```dae
func void PM_LoadToPtr(var string name, var int destPtr)
```
**Parameters**

- `#!dae var string name`  
    Name of the loaded field
- `#!dae var int destPtr`  
    Destination pointer, the address to where it will deserialize the saved data
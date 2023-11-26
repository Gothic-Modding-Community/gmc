---
title: Hashtables
description: LeGo package implementing Hashtable data structure to gothic scripts
---
# Hashtables
Hashtables package is an implementation of hashtables in Gothic. Currently (version 2.8.0) only integers are supported as keys. The Hashtables grow automatically.

    
## Dependencies

- [PermMem](permmem.md)

## Initialization
Initialize with `LeGo_PermMem` flag.
```dae
LeGo_Init(LeGo_PermMem);
```

## Implementation
[:material-github: Hashtable.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Hashtable.d)


## Functions

### `HT_CreateSized`
Generates a hashtable of the specified size.
```dae
func int HT_CreateSized(var int size)
```
**Parameters**

- `#!dae var int size`  
    Size of the hashtable to be created

**Return value**

The function returns a handle to the created hashtable.

### `HT_Create`
Generates a standard size hashtable.
```dae
func int HT_Create()
```
**Return value**

The function returns a handle to the created hashtable.

### `HT_Insert`
Inserts a value into the Hashtable.
```dae
func void HT_Insert(var int handle, var int val, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int val`  
    The value to be inserted
- `#!dae var int key`  
    The key associated with the value

### `HT_Resize`
Changes the size of the hashtable (usually not necessary as it happens automatically).
```dae
func void HT_Resize(var int handle, var int size)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int size`  
    The new size of the hashtable

### `HT_Get`
Reads a value from the hashtable.
```dae
func int HT_Get(var int handle, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int key`  
    The key whose value is to be read

**Return value**

The function returns the value associated with the key.

### `HT_Has`
Checks if the key already exist in hashtable.
```dae
func int HT_Has(var int handle, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int key`  
    The key to be checked 
**Return value**

The function returns `TRUE` if the key exist, `FALSE` is returned otherwise.

### `HT_Remove`
Removes a key from the hashtable.
```dae
func void HT_Remove(var int handle, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int key`  
    The key to be removed

### `HT_Change`
Changes the value of a key already existing in the hashtable.
```dae
func void HT_Change(var int handle, var int val, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int val`  
    The new value
- `#!dae var int key`  
    The key whose value is to be changed


### `HT_InsertOrChange`
Inserts a value into the Hashtable, or changes the value if the key already exist into hashtable.
```dae
func void HT_InsertOrChange(var int handle, var int val, var int key)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var int val`  
    The new value
- `#!dae var int key`  
    The key whose value is to be changed or associated with the value.
### `HT_GetNumber`
Returns the number of entries in a hashtable.
```dae
func int HT_GetNumber(var int handle)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable

**Return value**

The function returns the number of entries in the hashtable.

### `HT_ForEach`
Performs a function for each value pair in the hashtable.
```dae
func void HT_ForEach(var int handle, var func fnc)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a hashtable
- `#!dae var func fnc`  
    A function with signature void `(int key, int val)`

### `HT_Destroy`
Deletes the hashtable.
```dae
func void HT_Destroy(var int handle)
```
**Parameters**

- `#!dae var int handle`  
    The handle of the hashtable to be deleted

## Examples

### Simple operations
```dae
func void PrintKeyValuePair(var int key, var int val)
{
    Print(ConcatStrings(ConcatStrings("Key: ", IntToString(key)), ConcatStrings(", Value: ", IntToString(val))));
};

func void exapmle()
{
    // Create a new hashtable
    var int hashtableHandle; hashtableHandle = HT_Create();

    // Insert values into the hashtable
    HT_Insert(hashtableHandle, 42, 1);
    HT_Insert(hashtableHandle, 23, 2);
    HT_Insert(hashtableHandle, 56, 3);

    // Get a value from the hashtable
    var int value; value = HT_Get(hashtableHandle, 2);
    Print(ConcatStrings("Value associated with key 2: ", IntToString(value)));

    // Check if a key exists in the hashtable
    if (HT_Has(hashtableHandle, 3))
    {
        Print("Key 3 exists in the hashtable.");
    }
    else
    {
        Print("Key 3 does not exist in the hashtable.");
    };

    // Remove a key from the hashtable
    HT_Remove(hashtableHandle, 1);

    // Change the value associated with a key
    HT_Change(hashtableHandle, 99, 3);

    // Insert a value or change it if the key exists
    HT_InsertOrChange(hashtableHandle, 123, 4);

    // Get the number of entries in the hashtable
    var int numEntries; numEntries = HT_GetNumber(hashtableHandle);
    Print(ConcatStrings("Number of entries in the hashtable: ", IntToString(numEntries)));

    
	// Iterate through the hashtable and print key-value pairs
    // Function from top of the example is used here
    HT_ForEach(hashtableHandle, PrintKeyValuePair);

    // Destroy the hashtable
    HT_Destroy(hashtableHandle);
};
```
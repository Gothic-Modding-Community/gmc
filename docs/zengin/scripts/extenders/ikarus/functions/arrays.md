# Arrays (zCArray)
Set of function for working with ZenGin's `zCArray` data structure.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L2017-L2338)

## Functions

### `MEM_ArrayCreate`
Creates an empty `zCArray` (allocates memory) and returns a pointer to it.
```dae
func int MEM_ArrayCreate()
```
**Return value**

The function returns a pointer to the created `zCArray`.

### `MEM_ArrayFree`
Frees the memory allocated for a `zCArray` and its data.
```dae
func void MEM_ArrayFree(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray` to be freed

### `MEM_ArrayClear`
Clears the data of a `zCArray`, freeing the memory used by its elements. The array becomes empty.
```dae
func void MEM_ArrayClear (var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray` to be cleared

### `MEM_ArraySize`
Returns the size (number of elements) of an array.
```dae
func int MEM_ArraySize(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

**Return value**

The function returns a number of a `zCArray` elements.

### `MEM_ArrayWrite`
Writes a value at a specific position in the `zCArray`.
```dae
func void MEM_ArrayWrite(var int zCArray_ptr, var int pos, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int pos`   
    Position in the array where the value will be written
- `#!dae var int value`   
    Value to be written

### `MEM_ArrayRead`
Reads the value at a specific position in the `zCArray`.
```dae
func int MEM_ArrayRead(var int zCArray_ptr, var int pos)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int pos`   
    Position in the array from which the value will be read

**Return value**

The function returns the value at a specific position in the `zCArray`.

### `MEM_ArrayInsert`
Appends a value to the end of the `zCArray`. The array is automatically resized if it is too small.
```dae
func void MEM_ArrayInsert (var int zCArray_ptr, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int value`   
    Value to be inserted

### `MEM_ArrayPush`
Alias for [`MEM_ArrayInsert`](#mem_arrayinsert), inserts a value at the end of the `zCArray`.
```dae
func void MEM_ArrayPush (var int zCArray_ptr, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int value`   
    Value to be inserted

### `MEM_ArrayPop`
Removes and returns the last element from the `zCArray`.
```dae
func int MEM_ArrayPop(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

**Return value**

The function returns the element removed from the end of an array.

### `MEM_ArrayTop`
Returns the last element of the `zCArray` without removing it.
```dae
func int MEM_ArrayTop(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

**Return value**

The function returns the last element of an array.

### `MEM_ArrayIndexOf`
Searches the `zCArray` for the first occurrence of a `value` and returns its index.
```dae
func int MEM_ArrayIndexOf(var int zCArray_ptr, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int value`   
    Value to search for

**Return value**

The function returns the index of a first occurrence of a `value`. If not found `-1` is returned.

### `MEM_ArrayRemoveIndex`
Removes the element at a specific index from the `zCArray`.
```dae
func void MEM_ArrayRemoveIndex (var int zCArray_ptr, var int index)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int index`   
    Index of the element to be removed

### `MEM_ArrayRemoveValue`
Removes all occurrences of a value from the `zCArray`.
```dae
func void MEM_ArrayRemoveValue (var int zCArray_ptr, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int value`   
    Value to be removed

### `MEM_ArrayRemoveValueOnce`
Removes the first occurrence of a value from the `zCArray`. If value is not found, a warning is issued.
```dae
func void MEM_ArrayRemoveValueOnce (var int zCArray_ptr, var int value)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`
- `#!dae var int value`   
    Value to be removed

### `MEM_ArraySort`
Sorts the elements of the `zCArray` in ascending order.
```dae
func void MEM_ArraySort(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

### `MEM_ArrayUnique`
Removes duplicate elements from the `zCArray`.
```dae
func void MEM_ArrayUnique(var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

### `MEM_ArrayToString`
Converts the `zCArray` to a string representation.
```dae
func string MEM_ArrayToString (var int zCArray_ptr)
```
**Parameters**

- `#!dae var int zCArray_ptr`   
    Pointer to the `zCArray`

**Return value**

The function returns a string representation of a given array.
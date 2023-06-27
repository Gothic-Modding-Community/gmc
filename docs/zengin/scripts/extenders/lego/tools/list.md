# List
The List package is a collection of functions designed to simplify the handling of `zCList` and `zCListSort` lists in daedalus. It offers a range of functions for creating, manipulating, and querying lists.

## Dependencies
N/A

## Initialization
N/A

## Implementation
[:material-github: List.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/List.d)

## Functions
!!! Note
    All functions come with an additional "S" at the end for objects of type `zCListSort`. (Example: List_Node S .) Unlike most LeGo packages, pointers are used here, not handles! 

### `List_Create`
Creates a list with an initial value.
```dae
func int List_Create(var int data)
```
**Parameters**

- `#!dae var int data`  
    The value of the first list element.

**Return value**

The function returns a pointer to the created list.

### `List_Add`
Appends a value to the end of the list.
```dae
func void List_Add(var int list, var int data)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int data`  
    The value to be appended.

### `List_AddFront`
Adds a value before the first element of the list.
```dae
func void List_AddFront(var int list, var int data)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int data`  
    The value to be appended.

### `List_AddOffset`
Inserts a value between two list elements.
```dae
func void List_AddOffset(var int list, var int offset, var int data)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int offset`  
    The number of the list element after which the value is inserted.
- `#!dae var int data`  
    The value to be appended.

### `List_Set`
Sets a list element to a specific value.
```dae
func void List_Set(var int node, var int data)
```
**Parameters**

- `#!dae var int node`  
    Pointer to a list element.
- `#!dae var int data`  
    The value to be written into the list element.

### `List_Get`
Retrieves the value of a list element.
```dae
func int List_Get(var int list, var int nr)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int nr`  
    The number of the list element.

**Return value**

The function returns the value of the specified list element.

### `List_Node`
Returns a pointer to a list element.
```dae
func int List_Node(var int list, var int nr)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int nr`  
    The number of a list element.

**Return value**

The function returns a pointer to the specified list element.

### `List_Length`
Returns the length of the list (number of all elements).
```dae
func int List_Length(var int list)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.

**Return value**

The function returns the number of elements in the list.

### `List_HasLength`
Checks if the list has the specified length.
```dae
func int List_HasLength(var int list, var int length)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int length`  
    The desired length.

**Return value**

The function returns a boolean value indicating whether the list has the specified length or not.

### `List_End`
Returns the last list element of the list.
```dae
func int List_End(var int list)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.

**Return value**

The function returns a pointer to the last list element.

### `List_Concat`
Concatenates two lists.
```dae
func void List_Concat(var int list, var int list2)
```
**Parameters**

- `#!dae var int list`  
    The first list.
- `#!dae var int list2`  
    The second list. Its beginning is appended to the end of the first list.

### `List_Contains`
Returns the last list element with a specific value.
```dae
func int List_Contains(var int list, var int data)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int data`  
    The value to search for.

**Return value**

The function returns the number of the last list element with the value `data`.

### `List_For`
Calls a function for each list element, passing a pointer to the list element as a parameter.
```dae
func void List_For(var int list, var string function)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var string function`  
    Name of a function to be called for each list element (`void handler(var int node)`).

### `List_ForF`
Similar to `List_For`, but with a function parameter instead of a string.
```dae
func void ListForF(var int list, var func function)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var func function`  
    The function to be called for each list element (`void handler(var int node)`).

### `List_ForI`
Similar to `List_For`, but with a function parameter instead of a string.
```dae
func void List_ForI(var int list, var int funcID)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int funcID`  
    ID of a function to be called for each list element (`void handler(var int node)`).

### `List_Delete`
Deletes a list element. All subsequent elements shift position.
```dae
func void List_Delete(var int list, var int nr)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.
- `#!dae var int nr`  
    The number of the list element to be deleted.


### `List_Destroy`
Destroys the entire list.
```dae
func void List_Destroy(var int list)
```
**Parameters**

- `#!dae var int list`  
    The list to be destroyed.

### `List_ToArray`
Returns a pointer to a memory area containing all values of the list.
```dae
func int List_ToArray(var int list)
```
**Parameters**

- `#!dae var int list`  
    The list to be used.

**Return value**

The function returns a memory area containing all the values of the list.

### `List_MoveDown`
Moves the specified list node down by one position in the list.
```dae
func void List_MoveDown(var int list, var int node)
```
**Parameters**

- `#!dae var int list`  
    The list in which the node is located.
- `#!dae var int node`  
    The node to be moved down.

### `List_MoveUp`
Moves the specified list node up by one position in the list.
```dae
func void List_MoveUp(var int list, var int node)
```
**Parameters**

- `#!dae var int list`  
    The list in which the node is located.
- `#!dae var int node`  
    The node to be moved up.

### `List_InsertSorted`
Inserts a value into a sorted list while preserving the sort order.

```dae
func void List_InsertSorted(var int list, var int data, var func compare)
```
**Parameters:**

- `#!dae var int list`  
    The list to insert the value into.
- `#!dae var int data`  
    The value to be inserted.
- `#!dae var func compare`  
    A comparison function used to determine the sort order.

## Comparison Functions

The following comparison functions can be used as the `compare` parameter in the `List_InsertSorted` function:

#### `List_CmpAscending`
Compares two integer values in ascending order.
```dae
func int List_CmpAscending(var int data1, var int data2)
```
**Parameters:**

- `#!dae var int data1`  
    The first integer value.
- `#!dae var int data2`  
    The second integer value.

**Return Value:**

The function returns `TRUE` if `data1` is greater than `data2`, `FALSE` is returned otherwise.

#### `List_CmpDescending`
Compares two integer values in descending order.
```dae
func int List_CmpDescending(var int data1, var int data2)
```
**Parameters:**

- `#!dae var int data1`  
    The first integer value.
- `#!dae var int data2`  
    The second integer value.

**Return Value:**

The function returns `TRUE` if `data1` is less than `data2`, `FALSE` is returned otherwise.

#### `List_CmpAscendingUnsigned`
Compares two unsigned integer values in ascending order.
```dae
func int List_CmpAscendingUnsigned(var int data1, var int data2)
```
**Parameters:**

- `#!dae var int data1`  
    The first unsigned integer value.
- `#!dae var int data2`  
    The second unsigned integer value.

**Return Value:**

The function returns `TRUE` if `data1` is greater than `data2`, `FALSE` is returned otherwise.

#### `List_CmpDescendingUnsigned`
Compares two unsigned integer values in descending order.
```dae
func int List_CmpDescendingUnsigned(var int data1, var int data2)
```
**Parameters:**

- `#!dae var int data1`  
    The first unsigned integer value.
- `#!dae var int data2`  
    The second unsigned integer value.

**Return Value:**

The function returns `TRUE` if `data1` is less than `data2`, `FALSE` is returned otherwise.
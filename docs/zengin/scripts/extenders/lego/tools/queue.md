# Queue
This package is an implementation of the Queue data structure and a queue for function calls.

## Dependencies

- [PermMem](permmem.md)

## Initialization
N/A

## Implementation
[:material-github: Queue.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Queue.d)

## Queue

### `Q_Create` 
Creates a new queue and returns a handle to it.
```dae
func int Q_Create()
```
**Return value**

The function returns a handle to a queue.

### `Q_Enqueue`
Appends an integer to the back of the queue
```dae
func void Q_Enqueue(var int queue, var int value)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue
- `#!dae var int value`  
    The value to be appended to the queue

### `Q_IsEmpty`
Checks if the queue is empty.
```dae
func int Q_IsEmpty(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue

**Return value**

The function returns `TRUE` if the queue is empty, `FALSE` is returned otherwise.

### `Q_Advance`
Removes the oldest value from the queue and returns it.
```dae
func int Q_Advance(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue

**Return value**

The function returns the oldest value in the queue.

### `Q_Peek`
Returns the oldest value in the queue without removing it.
```dae
func int Q_Peek(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue

**Return value**

The function returns the oldest value in the queue.

### `Q_For`
Function with the `funcID` is called with every element of the list as parameter.  
The list element is passed to the function as a `zCList` pointer.
```dae
func void Q_For(var int queue, var int funcID)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue
- `#!dae var int funcID`  
    ID of function that is executed for all values in the queue (signature: `void (zCList*)`)

### `Q_ForF`
Like `Q_For`, but with function as a parameter instead of a function ID.
```dae
func void Q_ForF(var int queue, var func f)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a queue
- `#!dae var func f`  
    This function is executed for all values in the queue (signature: void (zCList*))

## CallbackQueue

### `CQ_Create`
Creates a new callback queue and returns a handle to it.
```dae
func int CQ_Create()
```
**Return value**

The function returns a handle to a callback queue.

### `CQ_EnqueueNoData`
Appends a function to the callback queue.
```dae
func void CQ_EnqueueNoData(var int queue, var func function)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue
- `#!dae var func function`  
    A function with no return value, expecting no parameter

### `CQ_EnqueueData`
Appends a function together with a value to the callback queue.
```dae
func void CQ_EnqueueData(var int queue, var func function, var int data)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue
- `#!dae var func function`  
    A function with no return value, expecting an integer as a parameter.
- `#!dae var int data`  
    When calling `function`, this value is passed as a parameter

### `CQ_Enqueue`
Appends a function together with an optional value to the callback queue.
This function should not usually be used. Use `CQ_EnqueueData` and `CQ_EnqueueNoData` instead.
```dae
func void CQ_Enqueue(var int queue, var int funcID, var int data, var int hasData)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue
- `#!dae var int funcID`  
    The function ID of a function to be appended to the callback queue.
- `#!dae var int data`  
    If hasData is not 0, this value is passed to the associated function.
- `#!dae var int hasData`  
    Must be 0 if the function does not expect an integer as a parameter, otherwise not 0.

### `CQ_IsEmpty`
Checks if no function is in the callback queue.
```dae
func int CQ_IsEmpty(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue

**Return value**

The function returns `TRUE` if the callback queue is empty, `FALSE` is returned otherwise.

### `CQ_Advance`
Executes the foremost function of the callback queue and removes it from the callback queue.
```dae
func void CQ_Advance(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue

### `CQ_Exhaust`
Executes all functions contained in the callback queue.
```dae
func void CQ_Exhaust(var int queue)
```
**Parameters**

- `#!dae var int queue`  
    Handle of a callback queue

[//]: # (//TODO check if there are missing functions by Emu)

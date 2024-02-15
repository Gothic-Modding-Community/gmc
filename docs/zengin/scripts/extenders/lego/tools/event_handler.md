---
title: EventHandler
description: LeGo package for creating new script events and triggering them
---
# EventHandler

!!! info inline end
    **Dependencies:**<br/>
    - [PermMem](permmem.md)<br/>
    **Implementation:**<br/>
    [:material-github: EventHandler.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/EventHandler.d)

This package allows to create new events and trigger them at desired times. The [Gamestate](../applications/gamestate.md) package already uses it.

!!! Warning  
    The EventHandler requires some basic understanding of the PermMem. The documentation can be found [here](https://lego.worldofplayers.de/?PermMem).

## Initialization
Initialize with `LeGo_EventHandler` flag.
```dae
LeGo_Init(LeGo_EventHandler);
```

## Functions

### `Event_Create`
!!! function "`Event_Create`"
    Creates a new event and returns a handle to it.
    ```dae
    func int Event_Create()
    ```
    **Return value**

    The function returns a new PermMem handle to an event.

### `Event_Delete`
!!! function "`Event_Delete`"
    Alias to PermMem `delete`. Cleans up the handle.
    ```dae
    func void Event_Delete(var int event)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`

### `Event_Empty`
!!! function "`Event_Empty`"
    Checks whether the event is "empty", i.e. nothing will happen after its execution.
    ```dae
    func int Event_Empty(var int event)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`

    **Return value**

    The function returns `TRUE` if event is empty, `FALSE` is returned otherwise.

### `Event_Has`
!!! function "`Event_Has`"
    Checks if `function` is added to the event.
    ```dae
    func int Event_Has(var int event, var func function)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`
    - `#!dae var func function`  
        Checked function

    **Return value**

    The function returns `TRUE` if function is added, `FALSE` is returned otherwise.

### `Event_Add`
!!! function "`Event_Add`"
    Adds an event handler function. The handler is called after running `Event_Execute`.
    ```dae
    func void Event_Add(var int event, var func function)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`
    - `#!dae var func function`  
        Function to be added

### `Event_AddOnce`
!!! function "`Event_AddOnce`"
    `Event_Add` but checks if the handler function is already added, to prevent duplicates.
    ```dae
    func void Event_AddOnce(var int event, var func function)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`
    - `#!dae var func function`  
        Function to be added

### `Event_Remove`
!!! function "`Event_Remove`"
    Removes the event handler `function` from the event.
    ```dae
    func void Event_Remove(var int event, var func function)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`
    - `#!dae var func function`  
        Function to be removed

### `Event_Execute`
!!! function "`Event_Execute`"
    Core of the package. Calls all functions registered via `Event_Add` and `Event_AddOnce`.
    ```dae
    func void Event_Execute(var int event, var int data)
    ```
    **Parameters**

    - `#!dae var int event`  
        Handle returned from `Event_Create`
    - `#!dae var int data`  
        Int parameter passed to all executed functions

## Ptr functions

!!! Tip
    The pointer functions are used internally by the previous functions. If you created an event with `Event_Create` use functions without `Ptr` in the name, but if you created event with `EventPtr_Create` use only `Ptr` functions. The normal user will probably never need the pointer versions, however the choice, which one to use is yours. 

### `EventPtr_Create`
!!! function "`EventPtr_Create`"
    Creates a new event and returns a pointer to it.
    ```dae
    func int EventPtr_Create()
    ```
    **Return value**

    The function returns a new PermMem pointer to an event.

### `EventPtr_Delete`
!!! function "`EventPtr_Delete`"
    Alias to PermMem `free`. Cleans up the pointer.
    ```dae
    func void EventPtr_Delete(var int eventPtr)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`

### `EventPtr_Empty`
!!! function "`EventPtr_Empty`"
    Checks whether the event is "empty", i.e. nothing will happen after its execution.
    ```dae
    func int EventPtr_Empty(var int eventPtr)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`

    **Return value**

    The function returns `TRUE` if empty, `FALSE` is returned otherwise.

### `EventPtr_Has`
!!! function "`EventPtr_Has`"
    Checks if `function` is added to an event.
    ```dae
    func int EventPtr_Has(var int eventPtr, var func function)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var func function`  
        Checked function

    **Return value**

    The function returns `TRUE` if function is added, `FALSE` is returned otherwise.

### `EventPtr_HasI`
!!! function "`EventPtr_HasI`"
    `EventPtr_Has` but with function ID instead of pointer. Used mainly internally.
    ```dae
    func int EventPtr_HasI(var int eventPtr, var int id)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var int id`  
        ID of checked function

    **Return value**

    The function returns `TRUE` if function is added, `FALSE` is returned otherwise.

### `EventPtr_Add`
!!! function "`EventPtr_Add`"
    Adds an event handler function. The handler is called after running `EventPtr_Execute`. 
    ```dae
    func void EventPtr_Add(var int eventPtr, var func function)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var func function`  
        Function to be added

### `EventPtr_AddI`
!!! function "`EventPtr_AddI`"
    `EventPtr_Add` but with function ID instead of pointer. Used mainly internally.
    ```dae
    func void EventPtr_AddI(var int eventPtr, var int id)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var int id`  
        ID of function to be added

### `EventPtr_AddOnce`
!!! function "`EventPtr_AddOnce`"
    `Event_Add` but checks if function is already added, to prevent duplicates.
    ```dae
    func void EventPtr_AddOnce(var int eventPtr, var func function)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var func function`  
        Function to be added

### `EventPtr_AddOnceI`
!!! function "`EventPtr_AddOnceI`"
    `EventPtr_AddI` but checks if function is already added, to prevent duplicates.
    ```dae
    func void EventPtr_AddOnceI(var int eventPtr, var int id)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var int id`  
        ID of function to be added

### `EventPtr_Remove`
!!! function "`EventPtr_Remove`"
    Removes a function from the event's call list.
    ```dae
    func void EventPtr_Remove(var int eventPtr, var func function)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var func function`  
        Function to be removed

### `EventPtr_RemoveI`
!!! function "`EventPtr_RemoveI`"
    `EventPtr_Remove` but with function ID instead of pointer. Used mainly internally.
    ```dae
    func void EventPtr_RemoveI(var int eventPtr, var int id)
    ```
    **Parameters**

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var int id`  
        ID of function to be removed

### `EventPtr_Execute`
!!! function "`EventPtr_Execute`"
    Core of the package. Calls all functions registered via `EventPtr_Add` and `EventPtr_AddOnce`.
    ```dae
    func void EventPtr_Execute(var int eventPtr, var int data)
    ```

    - `#!dae var int eventPtr`  
        Pointer returned from `EventPtr_Create`
    - `#!dae var int data`  
        Int parameter passed to all executed functions

## Examples

!!! Note
    This article has no built-in examples, but the best way to understand how EventHandler works is reading [source code](https://github.com/Lehona/LeGo/blob/dev/Gamestate.d) of the [Gamestate](../applications/gamestate.md) package.

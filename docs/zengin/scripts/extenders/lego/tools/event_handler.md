# EventHandler
This package is able to create new events and fire them at desired times. The [Gamestate](../applications/gamestate.md) package already makes use of it.

!!! Warning
    The Event Handler requires some basic understanding of the PermMem. The documentation can be found [here](https://lego.worldofplayers.de/?PermMem).

## Dependencies

- PermMem

## Initialization
Initialize with `LeGo_EventHandler` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_EventHandler);
```

## Implementation
[:material-github: EventHandler.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/EventHandler.d)

## Functions

### Event_Create
Creates a new event and returns a handle to it.
```dae
func int Event_Create() {};
```

- `return` - New PermMem handle to an event.

### Event_Delete
Alias to PermMem `delete`. Cleans up the handle.
```dae
func void Event_Delete(var int event) {};
```

- `event` - handle returned from `Event_Create`

### Event_Empty
Checks whether the event is "empty", i.e. nothing will happen after its execution.
```dae
func int Event_Empty(var int event) {};
```

- `event` - handle returned from `Event_Create`
- `return` - `TRUE` if empty, `FALSE` otherwise

### Event_Has
Checks if `function` is added to event - will execute after calling `Event_Execute`.
```dae
func int Event_Has(var int event, var func function) {};
```

- `event` - handle returned from `Event_Create`
- `function` - checked function
- `return` - `TRUE` if function is added, `FALSE` otherwise

### Event_Add
Adds a function called after executing the event (`Event_Execute`).
```dae
func void Event_Add(var int event, var func function) {};
```

- `event` - handle returned from `Event_Create`
- `function` - function to be added

### Event_AddOnce
`Event_Add` but checks if function is already added, to prevent duplicates.
```dae
func void Event_AddOnce(var int event, var func function) {};
```

- `event` - handle returned from `Event_Create`
- `function` - function to be added

### Event_Remove
Removes a function from the event's call list.
```dae
func void Event_Remove(var int event, var func function) {};
```

- `event` - handle returned from `Event_Create`
- `function` - function to be removed

### Event_Execute
Core of the package. Calls all functions registered via `Event_Add` and `Event_AddOnce`.
```dae
func void Event_Execute(var int event, var int data) {};
```

- `event` - handle returned from `Event_Create`
- `data` - int parameter passed to all executed functions

## Ptr functions
!!! Tip
    The function division may be a bit confuseing, but there is a simple rule. If you created event with `Event_Create` use functions without `Ptr` in name, but if you created event with `EventPtr_Create` use only `Ptr` functions. Choice what functions will you use is yours, but the normal user probably will never need the pointer versions.

### EventPtr_Create
Creates a new event and returns a pointer to it.
```dae
func int EventPtr_Create() {};
```

- `return` - New PermMem pointer to an event

### EventPtr_Delete
Alias to PermMem `free`. Cleans up the pointer.
```dae
func void EventPtr_Delete(var int eventPtr) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`

### EventPtr_Empty
Checks whether the event is "empty", i.e. nothing will happen after its execution.
```dae
func int EventPtr_Empty(var int eventPtr) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `return` - `TRUE` if empty, `FALSE` otherwise

### EventPtr_Has
Checks if `function` is added to event - will execute after calling `Event_Execute`.
```dae
func int EventPtr_Has(var int eventPtr, var func function) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `function` - checked function
- `return` - `TRUE` if function is added, `FALSE` otherwise

### EventPtr_HasI
`EventPtr_Has` but with function ID instead of pointer. Used mainly internally.
```dae
func int EventPtr_HasI(var int eventPtr, var int id) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `id` - ID of checked function
- `return` - `TRUE` if function is added, `FALSE` otherwise

### EventPtr_Add
Adds a function called after executing the event (`EventPtr_Execute`).
```dae
func void EventPtr_Add(var int eventPtr, var func function) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `function` - function to be added

### EventPtr_AddI
`EventPtr_Add` but with function ID instead of pointer. Used mainly internally.
```dae
func void EventPtr_AddI(var int eventPtr, var int id) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `id` - ID of function to be added

### EventPtr_AddOnce
`Event_Add` but checks if function is already added, to prevent duplicates.
```dae
func void EventPtr_AddOnce(var int eventPtr, var func function) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `function` - function to be added

### EventPtr_AddOnceI
`EventPtr_AddI` but checks if function is already added, to prevent duplicates.
```dae
func void EventPtr_AddOnceI(var int eventPtr, var int id) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `id` - ID of function to be added

### EventPtr_Remove
Removes a function from the event's call list.
```dae
func void EventPtr_Remove(var int eventPtr, var func function) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `function` - function to be removed

### EventPtr_RemoveI
`EventPtr_Remove` but with function ID instead of pointer. Used mainly internally.
```dae
func void EventPtr_RemoveI(var int eventPtr, var int id) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `id` - ID of function to be removed

### EventPtr_Execute
Core of the package. Calls all functions registered via `EventPtr_Add` and `EventPtr_AddOnce`.
```dae
func void EventPtr_Execute(var int eventPtr, var int data) {};
```

- `eventPtr` - pointer returned from `EventPtr_Create`
- `data` - int parameter passed to all executed functions

## Examples

!!! Note
    This article has no built-in examples but the best way to understand how EventHandler works is reading [source code](https://github.com/Lehona/LeGo/blob/dev/Gamestate.d) and [documeatation](../applications/gamestate.md) of Gamestate package.
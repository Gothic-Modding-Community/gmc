# Render
With this package items can be rendered on the screen. Since items are rendered independently of the normal views, textures that are 'below' the items must also be managed by this package, this behaviour is managed by the priority system. The view with the highest priority is always rendered first, so it is at the bottom. In theory, any .3DS model can be rendered if you just create a suitable item script.
## Dependencies

- List
- View
- [PermMem](../tools/permmem.md)

## Initialization
Initialize with `LeGo_Render` flag.
```dae
LeGo_Init(LeGo_Render);
```

!!! Warning
    This package is still experimental and not included in `LeGo_All` initialization flag.

## Implementation
[:material-github: Render.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Render.d)

## Functions

### `Render_AddItemPrio`
Generates the render of an item, with a manually specified priority.
```dae
func int Render_AddItemPrio(var int itemInst, var int x1, var int y1, var int x2, var int y2, var int priority)
```
**Parameters**

- `#!dae var int itemInst`  
    The instance of the item to render
- `#!dae var int x1` `#!dae var int y1`  
    The top left coordinate of the view
- `#!dae var int x2` `#!dae var int y2`  
    The bottom right coordinate of the view
- `#!dae var int priority`  
    The priority of this render object

**Return value**

The function returns a handle of the render object.

### `Render_AddItem`
Generates the render of an item, with priority set to `0`.
```dae
func int Render_AddItem(var int itemInst, var int x1, var int y1, var int x2, var int y2)
```
**Parameters**

- `#!dae var int itemInst`  
    The instance of the item to render
- `#!dae var int x1` `#!dae var int y1`  
    The top left coordinate of the view
- `#!dae var int x2` `#!dae var int y2`  
    The bottom right coordinate of the view

**Return value**

The function returns a handle of the render object.

### `Render_AddViewPrio`
Generates the render of a View, with a manually specified priority.
```dae
func int Render_AddViewPrio(var int view, var int priority)
```
**Parameters**

- `#!dae var int view`  
    A handle to a View
- `#!dae var int priority`  
    The priority of this render object

**Return value**

The function returns a handle of the render object.

### `Render_AddView`
Generates the render of a View, with priority set to `0`.
```dae
func int Render_AddView(var int view)
```
**Parameters**

- `#!dae var int view`  
    A handle to a View

**Return value**

The function returns a handle of the render object.

### `Render_OpenView`
Opens a render object. Only open render objects are displayed.
```dae
func void Render_OpenView(var int handle)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a render object

### `Render_CloseView`
Closes a render object. Only open render objects are displayed.
```dae
func void Render_CloseView(var int handle)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a render object

### `Render_Remove`
Deletes a render object. The associated view is deleted automatically.
```dae
func void Render_Remove(var int handle)
```
**Parameters**

- `#!dae var int handle`  
    Handle of a render object

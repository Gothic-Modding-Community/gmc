# View
This package can create textures on the screen and work with them in an extended manner.

## Dependencies
- [PermMem](permmem.md)
- [Interface](interface.md)

## Initialization
Initialize with `LeGo_View` flag.
```dae
LeGo_Init(LeGo_View);
```

## Implementation
[:material-github: View.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/View.d)

## Functions

### `View_Create`
Creates a `zCView` with virtual coordinates.
```dae
func int View_Create(var int x1, var int y1, var int x2, var int y2) 
```
**Parameters**

- `#!dae var int x1`/`#!dae var int y1`   
    Top-left corner coordinates (virtual)
- `#!dae var int x2`/`#!dae var int y2`   
    Bottom-right corner coordinates (virtual)

**Return value**

The function returns a [PermMem](permmem.md) handle to a `zCView`.

### `View_CreatePxl`
Alias for [`View_Create`](#view_create) using pixel coordinates.
```dae
func int View_CreatePxl(var int x1, var int y1, var int x2, var int y2) 
```
**Parameters**

- `#!dae var int x1`/`#!dae var int y1`   
    Top-left corner coordinates (pixel)
- `#!dae var int x2`/`#!dae var int y2`   
    Bottom-right corner coordinates (pixel)

**Return value**

The function returns a [PermMem](permmem.md) handle to a `zCView`.

### `View_CreateCenter`
Creates a `zCView` with virtual coordinates centered.
```dae
func int View_CreateCenter(var int x, var int y, var int width, var int height)
```
**Parameters**

- `#!dae var int x`   
    Horizontal position
- `#!dae var int y`   
    Vertical position
- `#!dae var int width`   
    Width of the view
- `#!dae var int height`   
    Height of the view

**Return value**

The function returns a [PermMem](permmem.md) handle to a `zCView`.

### `View_CreateCenterPxl`
Alias for `View_CreateCenter` using pixel coordinates.
```dae
func int View_CreateCenterPxl(var int x, var int y, var int width, var int height)
```
**Parameters**

- `#!dae var int x`   
    Horizontal position
- `#!dae var int y`   
    Vertical position
- `#!dae var int width`   
    Width of the view
- `#!dae var int height`   
    Height of the view

**Return value**

The function returns a [PermMem](permmem.md) handle to a `zCView`.

### `View_Get`
Alias for [`get`](permmem.md#get) form [PermMem](permmem.md).
```dae
zCView View_Get(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_GetPtr`
Alias for [`getPtr`](permmem.md#getptr) form [PermMem](permmem.md).
```dae
func int View_GetPtr(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_Render`
Renders a `zCView`. Should be used sparingly, as it works only in specific cases.
```dae
func void View_Render(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_SetTexture`
Assigns a texture to a view. The key function of this package.
```dae
func void View_SetTexture(var int hndl, var string texture)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var string texture`   
    Filename of a texture

### `View_GetTexture`
Gets the name of a previously assigned texture.
```dae
func string View_GetTexture(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

**Return value**

The function returns the previously assigned texture.

### `View_SetColor`
Sets the color of a view.
```dae
func void View_SetColor(var int hndl, var int color)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int color`   
    zColor, can be created with RGBA

### `View_GetColor`
Gets the color of a view.
```dae
func int View_GetColor(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

**Return value**

The function returns the full zColor.

### `View_Open`
Opens a view. It will be displayed on the screen.
```dae
func void View_Open(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_Close`
Closes a view. It disappears from the screen but can still be used.
```dae
func void View_Close(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_Delete`
Alias for `delete`.
```dae
`zCView` View_Delete(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)

### `View_Resize`
Scales a view to a virtual size. The top-left position of the view remains fixed.
```dae
func void View_Resize(var int hndl, var int width, var int height)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int width`   
    New width of the view
- `#!dae var int height`   
    New height of the view

### `View_ResizePxl`
Alias for [`View_Resize`](#view_resize) using pixel coordinates.
```dae
func void View_ResizePxl(var int hndl, var int width, var int height)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int width`   
    New width of the view
- `#!dae var int height`   
    New height of the view

### `View_Move`
Moves the view by virtual units.
```dae
func void View_Move(var int hndl, var int x, var int y)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int x`   
    Shift left/right
- `#!dae var int y`   
    Shift up/down

### `View_MovePxl`
Alias for [`View_Move`](#view_move) using pixel coordinates.
```dae
func void View_MovePxl(var int hndl, var int x, var int y)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int x`   
    Shift left/right
- `#!dae var int y`   
    Shift up/down

### `View_MoveTo`
Moves the top-left corner of the view to a virtual position.
```dae
func void View_MoveTo(var int hndl, var int x, var int y)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int x`   
    New horizontal position (-1 for no change)
- `#!dae var int y`   
    New vertical position (-1 for no change)

### `View_MoveToPxl`
Alias for [`View_MoveTo`](#view_moveto) using pixel coordinates.
```dae
func void View_MoveToPxl(var int hndl, var int x, var int y)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int x`   
    New horizontal position (-1 for no change)
- `#!dae var int y`   
    New vertical position (-1 for no change)

### `View_AddText`
Adds a text line to the view. The position is virtual and relative to the view's position. If the view is moved, the text moves as well.
```dae
func void View_AddText(var int hndl, var int x, var int y, var string text, var string font)
```
**Parameters**

- `#!dae var int hndl`   
    Handle created with [`View_Create`](#view_get)
- `#!dae var int x`   
    Horizontal position
- `#!dae var int y`   
    Vertical position
- `#!dae var string text`   
    Added text
- `#!dae var string font`   
    Used Font

### `View_DeleteText`
Removes all text added with [`View_AddText`](#view_addtext).
```dae
func void View_DeleteText(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
      Handle created with [`View_Create`](#view_get)

### `View_Top`
Places the view above all others.
```dae
func void View_Top(var int hndl)
```
**Parameters**

- `#!dae var int hndl`   
      Handle created with [`View_Create`](#view_get)
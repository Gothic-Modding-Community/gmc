---
title: View
description: LeGo package for `zCView` handling in daedalus
---
# View

!!! info inline end
    **Dependencies:**<br/>
    - [PermMem](permmem.md)<br/>
    - [Interface](interface.md)<br/>
    **Implementation:**<br/>
    [:material-github: View.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/View.d)

This package can create textures on the screen and work with them in an extended manner.

## Initialization
Initialize with `LeGo_View` flag.
```dae
LeGo_Init(LeGo_View);
```

## Functions

### `View_Create`
!!! function "`View_Create`"
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
!!! function "`View_CreatePxl`"
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
!!! function "`View_CreateCenter`"
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
!!! function "`View_CreateCenterPxl`"
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
!!! function "`View_Get`"
    Alias for [`get`](permmem.md#get) form [PermMem](permmem.md).
    ```dae
    zCView View_Get(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_GetPtr`
!!! function "`View_GetPtr`"
    Alias for [`getPtr`](permmem.md#getptr) form [PermMem](permmem.md).
    ```dae
    func int View_GetPtr(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_Render`
!!! function "`View_Render`"
    Renders a `zCView`. Should be used sparingly, as it works only in specific cases.
    ```dae
    func void View_Render(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_SetTexture`
!!! function "`View_SetTexture`"
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
!!! function "`View_GetTexture`"
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
!!! function "`View_SetColor`"
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
!!! function "`View_GetColor`"
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
!!! function "`View_Open`"
    Opens a view. It will be displayed on the screen.
    ```dae
    func void View_Open(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_Close`
!!! function "`View_Close`"
    Closes a view. It disappears from the screen but can still be used.
    ```dae
    func void View_Close(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_Delete`
!!! function "`View_Delete`"
    Alias for `delete`.
    ```dae
    `zCView` View_Delete(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
        Handle created with [`View_Create`](#view_get)

### `View_Resize`
!!! function "`View_Resize`"
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
!!! function "`View_ResizePxl`"
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
!!! function "`View_Move`"
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
!!! function "`View_MovePxl`"
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
!!! function "`View_MoveTo`"
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
!!! function "`View_MoveToPxl`"
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
!!! function "`View_AddText`"
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
!!! function "`View_DeleteText`"
    Removes all text added with [`View_AddText`](#view_addtext).
    ```dae
    func void View_DeleteText(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
          Handle created with [`View_Create`](#view_get)

### `View_Top`
!!! function "`View_Top`"
    Places the view above all others.
    ```dae
    func void View_Top(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`   
          Handle created with [`View_Create`](#view_get)

## Examples

### Display a texture on the screen
Here a texture should be displayed over the entire screen:
```dae
func void Example1() {
    var int View; 
    View = View_Create(0, 0, PS_VMax, PS_VMax); // Virtual coordinates
    View_SetTexture(View, "MyTexture.tga"); // Assign a texture to the view
    // display the view on the screen:
    View_Open(View);
};
```

This would mean that the texture would be permanently visible on the screen (even after loading/saving/restarting).
If we want it to disappear we have to use either [`View_Delete`](#view_delete) or [`View_Close`](#view_close).

### Display a texture with pixel coordinates
Now a texture should be displayed at the top right and be 256 x 256 pixels in size:
```dae
func void Example2() {
    Print_GetScreenSize();
    var int View;
    View = View_CreatePxl(Print_Screen[PS_X] - 256, 0, Print_Screen[PS_X], 256); // Pixel coordinates
    View_SetTexture(View, "MYTEXTURE.TGA");
    View_Open(View);
};
```

To get the size of the screen we use the [interface](interface.md) package.
# Buttons
This package extends the handling of the mouse and allows creating rectangular buttons, which react to mouse (hover) entry and exit as well as a mouse click.

## Dependencies

- [PermMem](../tools/permmem.md)
- View

## Initialization
Initialize with `LeGo_Buttons` flag.
```dae
LeGo_Init(LeGo_Buttons);
```

## Implementation
[:material-github: Buffs.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Buttons.d)

## Functions

### `Button_Create`
Creates a button. It is initially hidden (not visible and does not react to the mouse). The three callback functions have the following signature `void f(int handle)`.
```dae
func int Button_Create(var int posx, var int posy, var int width, var int height, var string tex, var func on_enter, var func on_leave, var func on_click)
```
**Parameters**

- `#!dae var int posx`  
    The horizontal position of the button in virtual coordinates
- `#!dae var int posy`  
    The vertical position of the button in virtual coordinates
- `#!dae var int width`  
    Width of the button in virtual coordinates
- `#!dae var int height`  
    Height of the button in virtual coordinates
- `#!dae var string tex`  
    Name of the button texture
- `#!dae var func on_enter`  
    This function is called when the mouse enters the button
- `#!dae var func on_leave`  
    This function is called when the mouse leaves the button
- `#!dae var func on_click`  
    This function is called when the user performs a mouse click on the button (left mouse button)

**Return value**

The function returns a handle to created button.

### `Button_CreatePxl`
`Button_Create` with pixels instead of virtual coordinates.
```dae
func int Button_CreatePxl(var int posx, var int posy, var int width, var int height, var string tex, var func on_enter, var func on_leave, var func on_click)
```
**Parameters**

- `#!dae var int posx`  
    The horizontal position of the button in pixels
- `#!dae var int posy`  
    The vertical position of the button in pixels
- `#!dae var int width`  
    Width of the button in pixels
- `#!dae var int height`  
    Height of the button in pixels
- `#!dae var string tex`  
    Name of the button texture
- `#!dae var func on_enter`  
    This function is called when the mouse enters the button
- `#!dae var func on_leave`  
    This function is called when the mouse leaves the button
- `#!dae var func on_click`  
    This function is called when the user performs a mouse click on the button (left mouse button)

**Return value**

The function returns a handle to created button.

### `Button_Delete`
Completely deletes a button.
```dae
func void Button_Delete(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

### `Button_Show`
Shows the button and makes it respond to the mouse.
```dae
func void Button_Show(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

### `Button_Hide`
Hides the button and disables it, so it is no longer responding to the mouse.
```dae
func void Button_Hide(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

### `Button_SetTexture`
Sets the texture of the button.
```dae
func void Button_SetTexture(var int hndl, var string tex)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var string tex`  
    Name of the new texture

### `Button_SetCaption`
Displays a centred text on the button.
```dae
func void Button_SetCaption(var int hndl, var string caption, var string font)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var string caption`  
    The text to be displayed
- `#!dae var string font`  
    The font in which the text should be displayed

### `Button_CreateMouseover`
Attaches a mouseover box to the cursor.
```dae
func void Button_CreateMouseover(var string text, var string font)
```
**Parameters**

- `#!dae var string text`  
    The text in the mouseover box
- `#!dae var string font`  
    The font of the text

### `Button_DeleteMouseover`
Deletes the mouseover box.
```dae
func void Button_DeleteMouseover()
```

### `Button_Activate`
Activates the button, so it reacts to the mouse. Does not change the visibility.
```dae
func void Button_Activate(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

### `Button_Deactivate`
Disables the button, so it no longer reacts to the mouse.
```dae
func void Button_Deactivate(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

### `Button_SetUserData`
Sets the user data of the button, an integer, to give the button individual information.
```dae
func void Button_SetUserData(var int hndl, var int data)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var int data`  
    Individual integer of the button (part of the internal `_Button` class)


### `Button_GetUserData`
Gets the user data of the button.
```dae
func int Button_GetUserData(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the user data of the button.


### `Button_GetState`
Gets the status of the button as a bit field. See [User Constants](../various/userconstants.md#buttons).
```dae
func int Button_GetState(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the status of the button.


### `Button_Move`
Moves the button by the given value in pixels. `posx = posx + nposx`
```dae
func void Button_Move(var int hndl, var int nposx, var int nposy)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var int nposx`  
    X-axis shift in pixels
- `#!dae var int nposy`  
    Y-axis shift in pixels

### `Button_MoveVrt`
Moves the button by the given value in virtual coordinates. `posx = posx + nposx`
```dae
func void Button_Move(var int hndl, var int nposx, var int nposy)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var int nposx`  
    X-axis shift in virtual coordinates
- `#!dae var int nposy`  
    Y-axis shift in virtual coordinates

### `Button_MoveTo`
Moves a button to the given position in pixels. `posx = nposx`
```dae
func void Button_MoveVrt(var int hndl, var int nposx, var int nposy)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var int nposx`  
    New horizontal position in pixels
- `#!dae var int nposy`  
    New vertical position in pixels

### `Button_MoveToVrt`
Moves a button to the given position in virtual coordinates. `posx = nvposx`
```dae
func void Button_MoveVrt(var int hndl, var int nvposx, var int nvposy)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`
- `#!dae var int nvposx`  
    New horizontal position in virtual coordinates
- `#!dae var int nvposy`  
    New vertical position in virtual coordinates

### `Button_GetViewHandle`
Returns the button's `zCView` as a handle.
```dae
func int Button_GetViewHandle(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the button's `zCView` as a handle.

### `Button_GetViewPtr`
Returns the button's `zCView` as a pointer.
```dae
func int Button_GetViewPtr(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the button's `zCView` as a pointer.

### `Button_GetView`
Returns the button's `zCView` as an object.
```dae
func zCView Button_GetView(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the button's `zCView` as an object.

### `Button_GetCaptionPtr`
Returns the pointer to the text of the button.
```dae
func int Button_GetCaptionPtr(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle returned from `Button_Create`

**Return value**

The function returns the pointer to the text of the button.
---
title: Cursor
description: LeGo package implementing in-game mouse cursor support
---
# Cursor

!!! info inline end
    **Dependencies:**<br/>
    - [Floats](../../ikarus/floats.md)<br/>
    - [FrameFunctions](../tools/frame_functions.md)<br/>
    - [View](../tools/view.md)<br/>
    **Implementation:**<br/>
    [:material-github: Cursor.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Cursor.d)

This package implements Gothic in-game mouse cursor support. To visually display the cursor there is a `Cursor.tga` file in the resources, but the texture can be changed in [user constants](../userconstants.md#cursor_1).

!!! Warning
    The cursor only works if the mouse is activated in the Gothic settings. It can be done directly from the scripts. See the [Ini file access](../../ikarus/functions/ini_access.md).

## Initialization
Initialize with `LeGo_Cursor` flag.
```dae
LeGo_Init(LeGo_Cursor);
```

## Variables

- `#!dae var int Cursor_X`  
    Always contains the X coordinate of the mouse cursor.
- `#!dae var int Cursor_Y`  
    Always contains the Y coordinate of the mouse cursor.
- `#!dae var float Cursor_RelX`  
    Always contains the relative X coordinate of the mouse cursor as an Ikarus float.
- `#!dae var float Cursor_RelY`  
    Always contains the relative Y coordinate of the mouse cursor as an Ikarus float.
- `#!dae var int Cursor_Wheel`  
    Variable containing the value of the mouse wheel.
- `#!dae var int Cursor_Left`  
    Variable that always contains the KeyState of the left mouse button.
- `#!dae var int Cursor_Mid`  
    Variable that always contains the KeyState of the middle mouse button.
- `#!dae var int Cursor_Right`  
    Variable that always contains the KeyState of the right mouse button.
- `#!dae var int Cursor_Event`  
    An event handler that can send information about the mouse cursor. It can be used with all functions of the [EventHandler](../tools/event_handler.md) package.
- `#!dae var int Cursor_NoEngine`  
    Variable that can prevent the engine from working. If is set to `TRUE` the engine no longer reacts to mouse movements.


## Functions

### `Cursor_Hide`
!!! function "`Cursor_Hide`"
    Hides the displayed mouse cursor.
    ```dae
    func void Cursor_Hide()
    ```

### `Cursor_Show`
!!! function "`Cursor_Show`"
    Shows the mouse cursor.
    ```dae
    func void Cursor_Show()
    ```

### `SetMouseEnabled`
!!! function "`SetMouseEnabled`"
    Can manually enable or disable the mouse.
    ```dae
    func void SetMouseEnabled(var int enabled)
    ```
    **Parameters**

    - `#!dae var int enabled`  
        `TRUE` - Mouse activated

## Examples

### Click a button
We use a View to display a button to be clicked. The [FrameFunctions](../tools/frame_functions.md) take care of the loop to check whether a click was made.
```dae
var int Button;
func void Example1()
{
    // We show the cursor and at the same time a button to be clicked:
    Cursor_Show();

    // New View:
    Button = View_CreatePxl(5, 5, 125, 50);
    View_SetTexture(Button, "BUTTONTEX.TGA");
    View_Open(Button);

    // Optionally, mouse can be switched off for the engine:
    Cursor_NoEngine = true; // -> The engine then no longer reacts to movements, so the camera does not move either

    // Enable loop function:
    FF_ApplyOnce(Button_Click);
};

func void Button_Click()
{
    if(Cursor_Left != KEY_PRESSED) { return; }; // Exit the function if the left mouse button was not pressed

    if(Cursor_X >= 5 && Cursor_X <= 125
    && Cursor_Y >= 5 && Cursor_Y <= 50) // Simply take over the coordinates of the view
    { 
        // Here the button was clicked.
        // Remove button and end loop:
        View_Close(Button);
        View_Delete(Button);
        Button = 0;

        // Allow the engine to continue working:
        Cursor_NoEngine = false;

        FF_Remove(Button_Click);

        // Hide the mouse:
        Cursor_Hide();
    };
};
```

This also can be done by the Buttons package instead of [View](../tools/view.md).

### Event handler
Since LeGo 2.2 there is also an event handler (`#!dae var int Cursor_Event`) in the cursor package. This example briefly explains how it works:
```dae
func void Example2()
{
    // We register MyCursorListener as the handler/listener of the Cursor_Event:
    Event_Add(Cursor_Event, MyCursorListener);

    // From now on, MyCursorListener will be called whenever the cursor has something to report.
};

func void MyCursorListener(var int state)
{
    // The rest is self-explanatory:

    if(state == CUR_WheelUp)
    {
        PrintS("Wheel up!");
    };
    if(state == CUR_WheelDown)
    {
        PrintS("Wheel down!");
    };
    if(state == CUR_LeftClick)
    {
        PrintS("Leftclick!");
    };
    if(state == CUR_RightClick)
    {
        PrintS("Rightclick!");
    };
    if(state == CUR_MidClick)
    {
        PrintS("Wheelclick!");
    };
};
```
Constants used in the example can be found in the [user constants](../userconstants.md#cursor).

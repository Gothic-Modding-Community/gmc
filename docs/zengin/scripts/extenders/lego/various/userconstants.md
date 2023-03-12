# User constants
All constants that the user can either use or even change freely are defined in [Userconst.d](https://github.com/Lehona/LeGo/blob/dev/Userconst.d) file.

## Read only
These constants may only be used, not changed.

### Anim8
These constants are used by [Anim8](../applications/anim8.md#anim8_1) and [Anim8q](../applications/anim8.md#anim8q).

- `#!dae const int A8_Constant`  
    Constant movement speed
- `#!dae const int A8_SlowEnd`  
    Evenly decelerated movement
- `#!dae const int A8_SlowStart`  
    Evenly accelerated movement
- `#!dae const int A8_Wait`  
    Do nothing. The target value is ignored here

### Buttons
The following bit masks can be applied to the status of a button:

- `#!dae const int BUTTON_ACTIVE`  
    The button is active, it reacts to the mouse
- `#!dae const int BUTTON_ENTERED`  
    The mouse is "within" the button

### Interface
**Dimensions**

- `#!dae const int PS_X` and `#!dae const int PS_Y`  
    Use with `Print_Screen` or `Print_ToVirtual` functions
- `#!dae const int PS_VMax`  
    Highest possible value of a virtual coordinate

**Colors**

16 basic colors that can be used as `zColor` parameters

- `#!dae const int COL_Aqua`
- `#!dae const int COL_Black`
- `#!dae const int COL_Blue`
- `#!dae const int COL_Fuchsia`
- `#!dae const int COL_Gray`
- `#!dae const int COL_Green`
- `#!dae const int COL_Lime`
- `#!dae const int COL_Maroon`
- `#!dae const int COL_Navy`
- `#!dae const int COL_Olive`
- `#!dae const int COL_Purple`
- `#!dae const int COL_Red`
- `#!dae const int COL_Silver`
- `#!dae const int COL_Teal`
- `#!dae const int COL_White`
- `#!dae const int COL_Yellow`

### Gamestate
[Gamestate](../applications/gamestate.md) can assume these values:

- `#!dae const int Gamestate_NewGame`  
    New game started
- `#!dae const int Gamestate_Loaded`  
    A game has been loaded
- `#!dae const int Gamestate_WorldChange`  
    The world has changed
- `#!dae const int Gamestate_Saving`  
    The game is saved

### Cursor
These constants are sent with Cursor_Event:

- `#!dae const int CUR_LeftClick`  
    The left mouse button was pressed
- `#!dae const int CUR_RightClick`  
    The right mouse button was pressed
- `#!dae const int CUR_MidClick`  
    The middle mouse button was pressed
- `#!dae const int CUR_WheelUp`  
    Mouse wheel up
- `#!dae const int CUR_WheelDown`  
    Mouse wheel down

## Modifiable
These constants are often used by packages and may be changed freely.

### Bloodsplats

- `#!dae const int BLOODSPLAT_NUM`  
    Maximum number on screen
- `#!dae const int BLOODSPLAT_TEX`  
    Highest Texture ID (`"BLOODSPLAT" + texID + ".TGA"`)
- `const int BLOODSPLAT_DAM`  
    Texture size damage multiplier (`damage * 2`^`Bloodsplat_Dam`^)

### Cursor

- `#!dae const string Cursor_Texture`  
    This texture is used to display the cursor (default: "CURSOR.TGA")

### Interface

- `#!dae const string Print_LineSeperator`  
    Text boxes can be printed in multiple lines. This character separates the lines from each other.

### PrintS
All position and size information is completely virtual:

- `#!dae const int PF_PrintX`  
    Start position on the X axis
- `#!dae const int PF_PrintY`  
    Start position on the Y axis
- `#!dae const int PF_TextHeight`  
    Space between individual lines

The times are given in ms:

- `#!dae const int PF_FadeInTime`  
    Time to fade in the text
- `#!dae const int PF_FadeOutTime`  
    Time to fade out the text
- `#!dae const int PF_MoveYTime`  
    Time needed to "slip down"
- `#!dae const int PF_WaitTime`  
    Time during which the print is fully visible

The font can be modified:

- `#!dae const string PF_Font`  
    Default: "FONT_OLD_10_WHITE.TGA"

### Talents

- `#!dae const int AIV_TALENT`  
    Used AIVar

### Dialoggestures

- `#!dae const string DIAG_Prefix`  
    Animation prefix ("DG_")
- `#!dae const string DIAG_Suffix`  
    Animation suffix ("_")

# User constants
All constants that the user can either use or even change freely are defined in [Userconst.d](https://github.com/Lehona/LeGo/blob/dev/Userconst.d) file.

## Read only
These constants may only be used, not changed.

### Anim8
These constants are used by [Anim8](../applications/anim8.md#anim8_1) and [Anim8q](../applications/anim8.md#anim8q).

- `A8_Constant` - Constant movement speed
- `A8_SlowEnd` - Evenly decelerated movement
- `A8_SlowStart` - Evenly accelerated movement
- `A8_Wait` - Do nothing. The target value is ignored here

### Buttons
The following bit masks can be applied to the status of a button:

- `int BUTTON_ACTIVE` - The button is active, it reacts to the mouse
- `int BUTTON_ENTERED` - The mouse is "within" the button

### Interface
Dimensions:

- `PS_X`, `PS_Y` - Use with `Print_Screen` or `Print_ToVirtual` functions
- `PS_VMax` - Highest possible value of a virtual coordinate

16 basic colors that can be used as `zColor` parameters:

- `COL_Aqua`
- `COL_Black`
- `COL_Blue`
- `COL_Fuchsia`
- `COL_Gray`
- `COL_Green`
- `COL_Lime`
- `COL_Maroon`
- `COL_Navy`
- `COL_Olive`
- `COL_Purple`
- `COL_Red`
- `COL_Silver`
- `COL_Teal`
- `COL_White`
- `COL_Yellow`

### Gamestate
[Gamestate](../applications/gamestate.md) can assume these values:

- `Gamestate_NewGame` - New game started
- `Gamestate_Loaded` - A game has been loaded
- `Gamestate_WorldChange` - The world has changed
- `Gamestate_Saving` - The game is saved

### Cursor
These constants are sent with Cursor_Event:

- `CUR_LeftClick` - The left mouse button was pressed
- `CUR_RightClick` - The right mouse button was pressed
- `CUR_MidClick` - The middle mouse button was pressed
- `CUR_WheelUp` - Mouse wheel up
- `CUR_WheelDown` - Mouse wheel down

## Modifiable
These constants are often used by packages and may be changed freely.

### Bloodsplats
This constant is only used in [Bloodsplats_Rage](../applications/bloodsplats.md#bloodsplats_rage):

- `Bloodsplat_Num` - Maximum number on screen

- `Bloodsplat_Tex` - Highest Texture ID (`"BLOODSPLAT" + texID + ".TGA"`)
- `Bloodsplat_Dam` - Texture size damage multiplier (`damage * 2`^`Bloodsplat_Dam`^)

### Cursor

- `Cursor_Texture` - This texture is used to display the cursor (default: "CURSOR.TGA")

### Interface

- `Print_LineSeparator` - Text boxes can be printed in multiple lines. This character separates the lines from each other.

### PrintS
All position and size information is completely virtual:

- `PF_PrintX` - Start position on the X axis
- `PF_PrintY` - Start position on the Y axis
- `PF_TextHeight` - Space between individual lines

The times are given in ms:

- `PF_FadeInTime` - Time to fade in the text
- `PF_FadeOutTime` - Time to fade out the text
- `PF_MoveYTime` - Time needed to "slip down"
- `PF_WaitTime` - Time during which the print is fully visible

Finally, the font can be modified:

- `PF_Font` - Default: "FONT_OLD_10_WHITE.TGA"

### Names

- `AIV_Name` - Used AIVar (default:89)

### Dialoggestures

- `DIAG_Prefix` - Animation prefix ("DG_")
- `DIAG_Suffix` - Animation suffix ("_")

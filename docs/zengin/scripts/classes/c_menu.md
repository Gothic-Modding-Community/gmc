---
title: C_MENU
---

# C_MENU Daedalus class

Class `C_MENU` is responsible for the behavior and properties of the game menus (options, save etc.)[^1].

## Definition
Class definition as it is defined in [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d) script file. 

```dae
class C_Menu 
{
    var string backPic;        // Menu background image
    var string backWorld;      // Background ZEN-world of the game menu (Not used)
    var int    posx;           // The top left point of the menu on the screen horizontally (X-axis)
    var int    posy;           // The top left point of the menu on the screen vertically (Y-axis)
    var int    dimx;           // Menu width in virtual coordinates
    var int    dimy;           // Menu height in virtual coordinates
    var int    alpha;          // Menu transparency
    var string musicTheme;     // Music track of the menu
    var int    eventTimerMSec; // trigger time for the EVENT_TIMER event
    var string items[150];     // Menu items
    var int    flags;          // Menu flags
    var int    defaultOutGame; // Menu item highlighted by default when the game is not running
    var int    defaultInGame;  // Menu item highlighted by default when the game is running
};
```

## Members

### `string` backPic {: .typed .string}
`backPic` is just a name of background image of the menu in `.tga` format.

### `string` backWorld {: .typed .string}
!!! Danger "Deprecated setting"
    The background world of the game menu in `.ZEN` format.

### `int` posx {: .typed .int}
The horizontal position of the top left point of the menu on the screen, in virtual coordinates. 

### `int` posy {: .typed .int}
The vertical position of the top left point of the menu on the screen, in virtual coordinates. 

### `int` dimx {: .typed .int}
Menu width in virtual coordinates.

### `int` dimy {: .typed .int}
Menu height in virtual coordinates.

### `int` alpha {: .typed .int}
Menu transparency. Accepts values ​​from 0 to 255. Without the `backPic` property specified, the value of this parameter is ignored. 

!!! Note
    Texture transparency can only be adjusted if the texture has an alpha channel.

### `string` musicTheme {: .typed .string}
Music theme of the menu.
```dae
instance MENU_MAIN(C_MENU_DEF)
{
    ...
    musictheme = "SYS_Menu";
    ...
};
```
All instances of musical themes are stored in a file [`Scripts/System/Music/MusicInst.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/Music/MusicInst.d)

### `int` eventTimerMSec {: .typed .int}
Defines the trigger time for the event `EVENT_TIMER` in seconds.

The list of constants for all menu events is described in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L51)

```dae
const int EVENT_UNDEF       = 0;    // Undefined
const int EVENT_EXECUTE     = 1;    // Process start event
const int EVENT_CHANGED     = 2;    // Menu parameter change event
const int EVENT_LEAVE       = 3;    // Menu item focus loss event
const int EVENT_TIMER       = 4;    // Timer fire event
const int EVENT_CLOSE       = 5;    // Menu close event
const int EVENT_INIT        = 6;    // Initialization event
const int EVENT_SEL_PREV    = 7;    // Select event of the previous menu item
const int EVENT_SEL_NEXT    = 8;    // Select event of the next menu item
```

### `string` items {: .typed .string}
An array of items belonging to this menu. It is possible to use up to 150 items in one menu. The same elements can be used for different menus. The element instance is specified as the value. 

```dae
// Menu
instance MENU_MAIN(C_MENU_DEF)
{
    ...
    items[0]        = "MENUITEM_MAIN_HEADLINE";         
    items[1]        = "MENUITEM_MAIN_HEADLINE2";
    items[2]        = "MENUITEM_MAIN_NEWGAME";
    ...
};
 
// Menu elements: labels, checkboxes, sliders, etc.
 
instance MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF)
{
    ...
};
 
instance MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF)
{
    ...
};
 
instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF)
{
    ...
};
```

### `int` flags {: .typed .int}
Menu flags. 

The list of flag constants can be found in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L43)


```dae
const int MENU_OVERTOP          = 1;    // Show menu over previous menu or in game
const int MENU_EXCLUSIVE        = 2;    // Close all previous menus. Only the active menu is displayed
const int MENU_NOANI            = 4;    // No animation
const int MENU_DONTSCALE_DIM    = 8;    // Don't Scale Menu Sizes
const int MENU_DONTSCALE_POS    = 16;   // Empty flag
const int MENU_ALIGN_CENTER     = 32;   // Center Align Menu
const int MENU_SHOW_INFO        = 64;   // Display information at the bottom of the description menu from menu items text[1]
```

- **MENU_OVERTOP** - Flag to display the menu over the previous menu. It is not advisable to use with a transparent menu.
- **MENU_EXCLUSIVE** - Hide all menus except the active one. When closed, the previous menu is restored.
- **MENU_NOANI** - Animation of minimizing and maximizing windows. The game is mainly used for dialogue windows. You can't enable or disable the animation of dialog windows through scripts. This is done using the `animatedWindows` setting in the Gothic.ini file.
- **MENU_DONTSCALE_DIM** - Scale the menu to fit 640x480 resolution.
- **MENU_DONTSCALE_POS** - Empty flag. Not used.
- **MENU_ALIGN_CENTER** - Align the menu to the center of the screen.
- **MENU_SHOW_INFO** - Display information at the bottom of menu description from menu item `text[1]`.

### `int` defaultOutGame {: .typed .int}
The menu item that is highlighted by default when the game is not running.

A value of -1 enables automatic selection of the first selectable element.

Items with the `~IT_SELECTABLE` flag are not selected.

### `int` defaultInGame {: .typed .int}
Menu item highlighted by default when the game is running.

A value of -1 enables automatic selection of the first selectable element.

Items with the `~IT_SELECTABLE` flag are not selected.

[^1]: Heavily inspired by the amazing documentation site [Gothic library](http://gothic-library.ucoz.org/publ/class_c_menu/1-1-0-36).
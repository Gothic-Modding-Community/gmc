---
title: C_MENU_ITEM
---

# C_MENU_ITEM Daedalus class

!!! example "Acknowledgment"
    Heavily inspired by the amazing documentation site [Gothic library](http://www.gothic-library.ru)

Class `C_Menu_Item` describes the elements of the game menu (sliders, checkboxes, buttons, etc.) .
## Class definition
Class definition as it is defined in [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d) script file. 

??? "C_Menu_Item Daedalus class"
    ```dae
    CONST INT MAX_USERSTRINGS		= 10;
    CONST INT MAX_ITEMS				= 150;
    CONST INT MAX_EVENTS			= 10;
    CONST INT MAX_SEL_ACTIONS		= 5;
    CONST INT MAX_USERVARS			= 4;

    class C_Menu_Item
    {
        var     string  fontName;                       // Font of the menu item.
        var     string  text[MAX_USERSTRINGS];          // Text of the interface element.
        var     string  backPic;                        // Background image of menu items.
        var     string  alphaMode;                      // Transparency blending mode of menu items.
        var     int     alpha;                          // Transparency of the menu item.
        var     int     type;                           // Type of the interface element.
        var     int     onSelAction[MAX_SEL_ACTIONS];   // Array of commands executed when selecting the menu item.
        var     string  onSelAction_S[MAX_SEL_ACTIONS]; // Arguments for commands specified in the onSelAction property.
        var     string  onChgSetOption;                 // Gothic.ini file parameter modified by this menu item.
        var     string  onChgSetOptionSection;          // Section of the Gothic.ini file where the modified parameter is located.
        var     func    onEventAction[MAX_EVENTS];      // Call the required function by a constant identifier.
        var     int     posx;                           // Top-left point of the menu item on the screen horizontally (X-axis).
        var     int     posy;                           // Top-left point of the menu item on the screen vertically (Y-axis).
        var     int     dimx;                           // Width of the menu item in virtual coordinates.
        var     int     dimy;                           // Height of the menu item in virtual coordinates.
        var     float   sizeStartScale;                 // Initial size of the item. Not used.
        var     int     flags;                          // Flags of the menu item.
        var     float   openDelayTime;                  // Delay before opening the item. Not used.
        var     float   openDuration;                   // Opening time. Not used.
        var     float   userFloat[MAX_USERVARS];        // Digital settings of menu items.
        var     string  userString[MAX_USERVARS];       // String settings of menu items.
        var     int     frameSizeX;                     // Text offset inside the frame on the X-axis.
        var     int     frameSizeY;                     // Text offset inside the frame on the Y-axis.
        var     string  hideIfOptionSectionSet;         // Section of Gothic.ini file where the option determining the display of this menu item is located.
        var     string  hideIfOptionSet;                // Gothic.ini file parameter determining the display of this menu item.
        var     int     hideOnValue;                    // Value of the Gothic.ini file parameter at which this interface element is not displayed.
    }; 
    ```

## Class members

| Property                        | Type   | Description                                                             |
|---------------------------------|--------|-------------------------------------------------------------------------|
| [fontName](#fontname)           | string | Font of the menu item.                                                  |
| [text](#text)                   | string | Text of the interface element.                                          |
| [backPic](#backpic)             | string | Background image of menu items.                                         |
| [alphaMode](#alphamode)         | string | Transparency blending mode of menu items.                               |
| [alpha](#alpha)                 | int    | Transparency of the menu item.                                          |
| [type](#type)                   | int    | Type of the interface element.                                          |
| [onSelAction](#onselaction)     | int    | Array of commands executed when selecting the menu item.               |
| [onSelAction_S](#onselaction_s) | string | Arguments for commands specified in the onSelAction property.           |
| [onChgSetOption](#onchgsetoption) | string | Gothic.ini file parameter modified by this menu item.                    |
| [onChgSetOptionSection](#onchgsetoptionsection) | string | Section of the Gothic.ini file where the modified parameter is located. |
| [onEventAction](#oneventaction) | Func   | Call the required function by a constant identifier.                   |
| [posx](#posx)                   | int    | Top-left point of the menu item on the screen horizontally (X-axis).   |
| [posy](#posy)                   | int    | Top-left point of the menu item on the screen vertically (Y-axis).     |
| [dimx](#dimx)                   | int    | Width of the menu item in virtual coordinates.                          |
| [dimy](#dimy)                   | int    | Height of the menu item in virtual coordinates.                         |
| [sizeStartScale](#sizestartscale) | float | Initial size of the item. Not used.                                    |
| [flags](#flags)                 | int    | Flags of the menu item.                                                 |
| [openDelayTime](#opendelaytime) | float | Delay before opening the item. Not used.                                |
| [openDuration](#openduration)   | float | Opening time. Not used.                                                 |
| [userFloat](#userfloat)         | float | Digital settings of menu items.                                         |
| [userString](#userstring)       | string | String settings of menu items.                                          |
| [frameSizeX](#framesizex)       | int    | Text offset inside the frame on the X-axis.                             |
| [frameSizeY](#framesizey)       | int    | Text offset inside the frame on the Y-axis.                             |
| [hideIfOptionSectionSet](#hideifoptionsectionset) | string | Section of Gothic.ini file where the option determining the display of this menu item is located. |
| [hideIfOptionSet](#hideifoptionset) | string | Gothic.ini file parameter determining the display of this menu item.    |
| [hideOnValue](#hideonvalue)     | int    | Value of the Gothic.ini file parameter at which this interface element is not displayed. |

## Class member overview

Description of the class member variables.

### fontName
`*.TGA` file defining the font of the displayed text of the menu item.

To create a color change effect, two fonts are needed:

  - The first font is specified in the `fontName` field and is used by default.
  - The second font with the suffix `_Hi` is used to replace the text on the active (selected) element.

This creates a highlighting effect.

### text
Text inside a menu item. 

Used to determine possible values ​​for game settings. See [onChgSetOptionSection](#onchgsetoptionsection). 

Also used to display hints about the item at the bottom of the menu when the `MENU_SHOW_INFO` [flag](#flags) is set.

```dae
// Text displayed in the element
 
text[0] = "New Game";
 
// Text in the interface element responsible for game settings
// One of the presented options is displayed
 
text[0] = "off|on";
 
// Tooltip for the selected element
// Index 1 is used for tooltips, not 0
 
text[1] = "Start a new adventure";
```
    
### backPic
Background image of the menu item in `*.TGA` format.

```dae
instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF)
{
    backpic = "Inv_Slot_Highlighted.tga";
}
```

### alphaMode
Texture transparency blending mode. Used in conjunction with the [alpha](#alpha) property. This parameter's value is ignored if the [backPic](#backpic) property is not specified.

**Supported modes:**

- `MAT_DEFAULT`   
    Uses the standard texture. If the material has an alpha channel, it will be transparent; otherwise, it will be opaque.

- `NONE`  
    Transparency is not used unless the texture itself is transparent.

- `BLEND`   
    Blends the alpha channel of the texture with the background.

- `ADD`  
    Adds the alpha channel of the texture to the background.

- `SUB`   
    Subtracts the alpha channel of the texture from the background.

- `MUL` and `MUL2`   
    Multiplies the alpha channel of the texture by the background.

### alpha
Menu element transparency. Accepts values ​​from 0 to 255. Without specifying the [backPic](#backpic) property, the value of this parameter is ignored. 

The alpha channel rendering mode is determined using the [alphaMode](#alphamode) property.

### type
Interface element type. Some interface elements have their own settings determined by the [userFloat](#userfloat) and [userString](#userstring) properties.

Constants for menu item types are described in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L18-L25).

```dae
CONST INT MENU_ITEM_UNDEF		= 0; // Undefined
CONST INT MENU_ITEM_TEXT		= 1; // Text
CONST INT MENU_ITEM_SLIDER		= 2; // Slider
CONST INT MENU_ITEM_INPUT		= 3; // Input field
CONST INT MENU_ITEM_CURSOR		= 4; 
CONST INT MENU_ITEM_CHOICEBOX	= 5; // Checkbox
CONST INT MENU_ITEM_BUTTON		= 6; // Button
CONST INT MENU_ITEM_LISTBOX		= 7; // Frame
```

- `MENU_ITEM_UNDEF`   
    Undefined element type. Not used in scripts.

- `MENU_ITEM_TEXT`    
    Menu item type "Text". Text can be multiline by setting the `IT_MULTILINE` [flag](#flags).

- `MENU_ITEM_SLIDER`   
    Menu item type "Slider". Additional settings are provided for the slider.
    - [`userFloat[0]`](#userfloat) property determines the number of divisions for the slider.
    - [`userFloat[1]`](#userfloat) property determines the width of the slider.
    - [`userString[0]`](#userstring) property determines the background image for the slider thumb.

    ```dae
    INSTANCE MENUITEM_AUDIO_MUSICVOL_SLIDER(C_MENU_ITEM_DEF)
    {
        backPic		= MENU_SLIDER_BACK_PIC;
        type		= MENU_ITEM_SLIDER;        // Type: Slider
        // [...]
        onChgSetOption	= "musicVolume";       // INI file parameter
        onChgSetOptionSection = "SOUND";       // INI file section
        userFloat[0]	= 15;                  // Number of slider positions
        userString[0]	= MENU_SLIDER_POS_PIC; // Background image of the slider
        // [...]
    };
    ```

- `MENU_ITEM_INPUT`   
    This type of element is intended for entering control keys during configuration, as well as for entering the name of the save in the corresponding menu.

- `MENU_ITEM_CURSOR`   
    Deprecated element type. Not used in scripts.

- `MENU_ITEM_CHOICEBOX`   
    "SELECT" type allowing the selection of one of the available values.

- `MENU_ITEM_BUTTON`   
    Button. Not used in scripts.
    - The [`userString[0]`](#userstring) property determines which image will be used for the disabled button. The [backPic](#backpic) property is responsible for the background image of the enabled button.

- `MENU_ITEM_LISTBOX`   
    Menu item type used in the "Quest Log" menu.
    - The [`userString[0]`](#userstring) property determines which task list will be displayed in this element.

    ```dae
    userstring[0] = "CURRENTMISSIONS";
    userstring[0] = "OLDMISSIONS";
    userstring[0] = "FAILEDMISSIONS";
    userstring[0] = "LOG";
    ```

### onSelAction
Array of commands executed when selecting the menu item.

Each command receives parameters in the [`onSelAction_S`](#onselaction_s) property.

Constants are described in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L8-L15).

```dae
CONST INT SEL_ACTION_UNDEF			= 0; // No action. Used when setting game parameters, calling functions...
CONST INT SEL_ACTION_BACK			= 1; // Return to the previous menu or game
CONST INT SEL_ACTION_STARTMENU		= 2; // Open a menu
CONST INT SEL_ACTION_STARTITEM		= 3; // Special command for save slots
CONST INT SEL_ACTION_CLOSE			= 4; // Close menu or game
CONST INT SEL_ACTION_CONCOMMANDS	= 5; // Execute console command
CONST INT SEL_ACTION_PLAY_SOUND		= 6; // Play sound from C_SFX instance
CONST INT SEL_ACTION_EXECCOMMANDS	= 7; // Execute command specified in the onSelAction_S field using RUN or EFFECT commands
```

### onSelAction_S
Arguments for commands specified in the [`onSelAction`](#onselaction) property. 

Below are commands and their arguments:

- `SEL_ACTION_UNDEF`   
    This command has no arguments and is mostly used in options and for calling script functions.

    ```dae
    instance MENUITEM_MAIN_CREDITS(C_MENU_ITEM_DEF)
    {
        text[0]             = "Credits";
        // [...]
        onselaction[0]      = SEL_ACTION_UNDEF;
        oneventaction[1]    = showcredits;
    };
    
    func int showcredits()
    {
        PlayVideo("credits.bik");
        PlayVideo("credits2.bik");
        return 1;
    };
    ```

- `SEL_ACTION_BACK`   
    This command has no arguments. It returns to the previous menu or the game.

    ```dae
    instance MENUITEM_MAIN_RESUME(C_MENU_ITEM_DEF)
    {
        text[0]		=	"Resume";
	    text[1]		=   "Resume the current game";
        // [...]
        onselaction[0]  = SEL_ACTION_BACK;
    };
    ```

- `SEL_ACTION_STARTMENU`   
    The argument for this command is the menu instance. The specified menu will be displayed.

    ```dae
    instance MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF)
    {
        text[0]		= "Quit Game";
	    text[1]		= "Leave the world of Gothic II";
        onselaction[0]      = SEL_ACTION_STARTMENU;
        onselaction_s[0]    = "MENU_LEAVE_GAME";
        // [...]
    };
    
    instance MENU_LEAVE_GAME(C_MENU_DEF)
    {
        // [...]
    };
    ```

- `SEL_ACTION_STARTITEM`   
    The argument is an interface element serving as a slot for saving the game.

    ```dae
    INSTANCE MENUITEM_SAVE_SLOT1(C_MENU_ITEM_DEF)
    {
        // [...]
        onSelAction[0]	=	SEL_ACTION_STARTITEM;
        onSelAction_S[0]=	"MENUITEM_SAVE_SLOT1";
        onSelAction[1]	= 	SEL_ACTION_CLOSE;
        onSelAction_S[1]=	"SAVEGAME_SAVE";
    };
    ```

- `SEL_ACTION_CLOSE`   
    The closing menu command supports the following arguments:

    - `NEW_GAME`    
        Start a new game.

        ```dae
        instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF) 
        {
            // [...]
            text[0]		= "New Game";
            text[1]		= "Start a new adventure";
            onSelAction[0]	= SEL_ACTION_CLOSE;
            onSelAction_S[0]= "NEW_GAME";
        };
        ```
    
    - `LEAVE_GAME`   
        Exit the game.

        ```dae
        INSTANCE MENUITEM_LEAVE_GAME_YES(C_MENU_ITEM_DEF)
        {
            // [...]
            text[0]		= "Yes.";
            text[1]		= "Yes, I'll be back!";
            onSelAction[0]	= SEL_ACTION_CLOSE;
            onSelAction_S[0]= "LEAVE_GAME";
        };
        ```

    - `SAVEGAME_SAVE`   
        Save the game to the selected slot and return to the game.

        ```dae
        INSTANCE MENUITEM_SAVE_SLOT1(C_MENU_ITEM_DEF)
        {
            // [...]
            onSelAction[0]	=	SEL_ACTION_STARTITEM;
            onSelAction_S[0]=	"MENUITEM_SAVE_SLOT1";
            onSelAction[1]	= 	SEL_ACTION_CLOSE;
            onSelAction_S[1]=	"SAVEGAME_SAVE";
        };
        ```

    - `SAVEGAME_LOAD`   
        Load the game from the selected slot and return to the game.

        ```dae
        INSTANCE MENUITEM_LOAD_SLOT1(C_MENU_ITEM_DEF)
        {
            // [...]
            onSelAction[0]	= 	SEL_ACTION_CLOSE;
            onSelAction_S[0]=	"SAVEGAME_LOAD";
        };
        ```

- `SEL_ACTION_CONCOMMANDS`   
    The argument is a console commands.

    ```dae
    INSTANCE MENUITEM_EXAMPLE_1(C_MENU_ITEM_DEF)
    {
        // [...]
        onSelAction[1]	= 	SEL_ACTION_CONCOMMANDS;
        onSelAction_S[1]=	"goto pos 0 0 0";
    };
    ```

- `SEL_ACTION_PLAY_SOUND`   
    The argument is an C_SFX class instance.

    ```dae
    INSTANCE MENUITEM_EXAMPLE_1(C_MENU_ITEM_DEF)
    {
        // [...]
        onSelAction[1]	= 	SEL_ACTION_PLAY_SOUND;
        onSelAction_S[1]=	"LevelUp";
    };
    ```

- `SEL_ACTION_EXECCOMMANDS`   
    There are two supported executable commands: `RUN` and `EFFECTS`.

    - `RUN`   
        Indicates the instance of the menu element that is used to select the key.

        ```dae
        INSTANCE MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
        {
            // [...]
            text[0]			=	"Forward";
            text[1]			=   "press DEL key to empty slot and RETURN to define";
            onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
            onSelAction_S[0]=	"RUN MENU_ITEM_INP_UP";
        };

        INSTANCE MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
        {
            // [...]
            text[1] 	=   "Please press the desired key for this action.";
            type		= 	MENU_ITEM_INPUT;
            onChgSetOption 			= "keyUp";
            onChgSetOptionSection 	= "KEYS";
        };
        ``` 

    - `EFFECTS` 
        Specifies the menu item instance to which the focus switches.

        ```dae
        INSTANCE MENU_ITEM_SEL_MISSIONS_ACT(C_MENU_ITEM_DEF)
        {
            text[0]		=	"Current\nQuests";
            // [...]
            onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
            onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_ACT";	
        };

        instance MENU_ITEM_LIST_MISSIONS_ACT(C_MENU_ITEM_DEF)
        {
            type		= 	MENU_ITEM_LISTBOX;	
            text[0]		= 	"Act Missions";
            // [...]
            userString[0]	=	"CURRENTMISSIONS";	
        };
        ```

    There are also two commands, `SETDEFAULT` and `SETALTERNATIVE`, which set control settings. The first restores default settings, and the second uses alternative character control settings.

### onChgSetOption

Parameter of the `Gothic.ini` file that will be modified by this menu item. 

```dae
instance MENUITEM_GAME_FIGHTFOCUS_CHOICE(C_MENU_ITEM_DEF)
{
    text[0]		= 	"none|box|lighten|both";
    // [...]
	onChgSetOption		   = "highlightMeleeFocus"; // INI parameter
	onChgSetOptionSection  = "GAME"; // INI section
    // [...]
};
```

The `text[0]` property of such an element usually specifies possible values of the modified parameter. Values are listed using the `|` symbol.

Make sure that the number of parameter options in the menu corresponds to the number of options in the `Gothic.ini` file.

```ini
highlightMeleeFocus=2
; ... here you can turn on an optional focus highlight effect during fighting
```

### onChgSetOptionSection
The section of the Gothic.ini file in which the parameter being changed is located.

See [onChgSetOption](#onchgsetoption) above.

### onEventAction
Allows a user to call a function on a specified event.

The list of constants is described in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L51-L59).

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

For example, you can use the function associated with the constant `EVENT_EXECUTE` to call a script function.

```dae
instance MENUITEM_MAIN_INTRO(C_MENU_ITEM_DEF) 
{
	text[0]		= "Play Intro";
	text[1]		= "Play introduction sequence";
    // [...]
	onEventAction[EVENT_EXECUTE] = ShowIntro;
};

func int ShowIntro()
{
	PlayVideo("intro.bik");
	return 1;
};
```

### posx
The horizontal position of the top left point of the menu on the screen, measured in virtual coordinates.

!!! Example "Virtual coordinates"
    Virtual coordinates divide the menu into 8192 parts (`0 - 8191`) horizontally and vertically. The position of the menu item is calculated based on these values.

### posy
The vertical position of the top left point of the menu on the screen, measured in virtual coordinates.

### dimx
The width of the menu item in virtual coordinates.

!!! Tip
    To automatically determine the width, enter `-1`. In this case, the width is calculated based on the text contained in the element.

### dimy

The height of the menu item in virtual coordinates.

!!! Tip
    To automatically determine the element's height, enter a value of `-1`. In this case, the height is calculated taking into account the text contained in the element. 

### sizeStartScale

!!! Warning "Deprecated setting"
    Size of the menu item at the beginning.


### flags
Flags of the menu item.

Constants for all flags are described in the file [`Scripts/System/_intern/Menu.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Menu.d#L27-L41).

```dae
const int IT_CHROMAKEYED            = 1;
const int IT_TRANSPARENT            = 2;
const int IT_SELECTABLE             = 4;        // Element can be selected
const int IT_MOVEABLE               = 8;
const int IT_TXT_CENTER             = 16;       // Align text to center
const int IT_DISABLED               = 32;       // Interactive item
const int IT_FADE                   = 64;
const int IT_EFFECTS_NEXT           = 128;      // Flag for influencing an adjacent menu item
const int IT_ONLY_OUT_GAME          = 256;      // Element available only outside the game
const int IT_ONLY_IN_GAME           = 512;      // Element available only in-game
const int IT_PERF_OPTION            = 1 << 10;  // Option responsible for performance
const int IT_MULTILINE              = 1 << 11;  // Multi-line text element
const int IT_NEEDS_APPLY            = 1 << 12;  // Need to apply a settings. Used when changing screen resolution
const int IT_NEEDS_RESTART          = 1 << 13;  // The game need to be restarted
const int IT_EXTENDED_MENU          = 1 << 14;  // Advanced menu flag
```

- `IT_CHROMAKEYED`   
    Empty flag. Not used.

- `IT_TRANSPARENT`   
    Empty flag. Not used.

- `IT_SELECTABLE`   
    Items marked with this flag can be selected.

- `IT_MOVEABLE`   
    Empty flag. Not used. 
    
    ??? Example "Intended use"
        In early engine versions, the initial position of the element could be specified using the `startPosX` and `startPosY` properties. The element moved from these coordinates to the desired position.

        At the beginning of the video below, it can be seen that the elements slides into the screen. That was probably done using this flag and mentioned parameters.

        ![type:video](https://www.youtube.com/embed/mfJag6fkfH8)

- `IT_TXT_CENTER`   
    Aligns the text in the element to the center.

- `IT_DISABLED`   
    The menu item becomes inactive.

    ```dae
    instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF)
    {
        text[0]		= "New Game";
	    text[1]		= "Start a new adventure";
        flags       = flags | IT_TXT_CENTER | IT_DISABLED;
        // [...]
    };
    ```

- `IT_FADE`   
    Empty flag. Not used.

- `IT_EFFECTS_NEXT`   
    This flag affects the next neighboring element, i.e., the element specified in the [`items`](./c_menu.md#items) list of the [`C_MENU`](./c_menu.md) class.

    ```dae
    instance MENU_OPT_GAME(C_MENU_DEF)
    {
        // [...]
        items[1] = "MENUITEM_GAME_SUB_TITLES";
        items[2] = "MENUITEM_GAME_SUB_TITLES_CHOICE";
        // [...]
    };
    ```
    
    In this case, the element affecting (MENUITEM_GAME_SUB_TITLES_CHOICE) is usually made non-selectable.

    ```dae
    instance MENUITEM_GAME_SUB_TITLES(C_MENU_ITEM_DEF)
    {
        // [...]
        text[0]     = "Subtitles";
        text[1]     = "Subtitles on/off";
        flags       = flags | IT_EFFECTS_NEXT;
        // [...]
    };
    
    instance MENUITEM_GAME_SUB_TITLES_CHOICE(C_MENU_ITEM_DEF)
    {
        // [...]
        text[0]     = "no|yes";
        flags       = flags & ~IT_SELECTABLE;
        // [...]
    };
    ```
    
    This flag is mainly used for options and for managing checkboxes, sliders, and enumerations.

- `IT_ONLY_OUT_GAME`   
    This flag determines that the menu item is only available before starting the game. Once you start the game, the menu item becomes unavailable.

- `IT_ONLY_IN_GAME`   
    This flag determines that the menu item is only available in the running game. Until the game is started, the element remains unavailable.

- `IT_PERF_OPTION`   
    A special flag for options. Settings affecting the game's performance are marked with this flag.

- `IT_MULTILINE`   
    Flag for multiline text. The text of such elements can be moved to a new line using the newline escape sequence `\n`.

- `IT_NEEDS_APPLY`   
    Flag indicating the need to apply settings. Used when changing the game resolution.

- `IT_NEEDS_RESTART`   
    Flag indicating that the game needs to be restarted for the settings to take effect.

- `IT_EXTENDED_MENU`   
    Flag indicating that this element is part of the "Extended Menu." It is displayed only if the `extendedMenu` parameter in the `Gothic.ini` file is set to `1`.

### openDelayTime

!!! Warning "Deprecated setting"
    Delay before opening a menu item.

### openDuration

!!! Warning "Deprecated setting"
    The time the menu item was opened.

### userFloat

Numerical settings of the interface element. Depending on the interface element, the purpose of the property changes. See [type](#type). 

### userString

String settings of the interface element. The purpose of the property changes depending on the interface element. See [type](#type)`.

### frameSizeX

Indentation of text inside the frame along the X axis. This applies the padding to both sides of the frame. Measured in virtual coordinates from 0 to 4095.

Frames are a special tool designed to work with the log of tasks and quests.

Used for elements of [type](#type) `MENU_ITEM_LISTBOX`. 

```dae
instance MENU_ITEM_LIST_MISSIONS_ACT(C_MENU_ITEM_DEF)
{
    backpic         = "NW_Misc_CaveWall_01.tga";
    type            = MENU_ITEM_LISTBOX;
    text[0]         = "Act Missions";
    // [...]
    userstring[0]   = "CURRENTMISSIONS";
    framesizex      = 2000;
    framesizey      = 2000;
};
```

As a result, we get the following frame (Source: [Gothic-Library](http://www.gothic-library.ru/publ/class_c_menu_item/1-1-0-37#frameSizeX)):

![](../../../assets/images/c_menu_item_farmesize.png)

And the width and height of the frame are set, as for all elements, by the [dimx](#dimx) and [dimy](#dimy) properties.

### frameSizeY

Indentation of text inside the frame along the Y axis. In this case, the indentation is applied at the top and bottom of the frame. Measured in virtual coordinates from 0 to 4095.

See [frameSizeX](#framesizex) above.


### hideIfOptionSectionSet
The section of the `Gothic.ini` file with the option which value of determines the display of this menu item. 

This property works together with the [`hideIfOptionSet`](#hideifoptionset) and [`hideOnValue`](#hideonvalue) properties.

In the example below, the interface element will not be displayed until the `useGothic1Controls` parameter in the GAME section is set to 1, i.e., enabled.

```dae
instance MENU_ITEM_NEXTMENU(C_MENU_ITEM_DEF)
{
    text[0]		= "More keys...";
	text[1]		= "Configure further control keys";
    // [...]
    hideifoptionsectionset  = "GAME";
    hideifoptionset         = "useGothic1Controls";
    hideonvalue             = 1;
};
```

!!! Tip
    `Gothic.ini` settings can also be changed through the main menu. See [`onChgSetOption`](#onchgsetoption) and [`onChgSetOptionSection`](#onchgsetoptionsection).

### hideIfOptionSet
The `Gothic.ini` file parameter, the value of which determines the display of this menu item. 

See [hideIfOptionSectionSet](#hideifoptionsectionset).

### hideOnValue
The value of the `Gothic.ini` file parameter at which this interface element is not displayed.

See [hideIfOptionSectionSet](#hideifoptionsectionset).

## Predefined instances
There are a lot of predefined class instances in the menu `C_MENU_ITEM` performing a strictly defined function. They cannot be renamed, but they can be configured to a certain extent.

| Instance                              | Description                                                |
|---------------------------------------|------------------------------------------------------------|
| MENUITEM_LOADSAVE_THUMBPIC            | Save picture in the Save/Load menu.                         |
| MENUITEM_LOADSAVE_LEVELNAME_VALUE     | The name of the level of the selected Save/Load menu item. |
| MENUITEM_LOADSAVE_DATETIME_VALUE      | The date the selected Save/Load menu item was saved.       |
| MENUITEM_LOADSAVE_GAMETIME_VALUE      | Game time for saving the selected Save/Load menu item.     |
| MENUITEM_LOADSAVE_PLAYTIME_VALUE      | Total play time of the selected Save/Load menu item.       |
| MENUITEM_SAVE_SLOT1 - MENUITEM_SAVE_SLOT20  | Save menu slots.                                    |
| MENUITEM_LOAD_SLOT1 - MENUITEM_LOAD_SLOT20  | Load menu slots.                               |
| MENU_ITEM_LIST_MISSIONS_ACT           | Frame with a list of current tasks in the journal.         |
| MENU_ITEM_LIST_MISSIONS_FAILED        | Frame with a list of failed tasks in the log.               |
| MENU_ITEM_LIST_MISSIONS_OLD           | Frame with a list of old tasks in the journal.             |
| MENU_ITEM_LIST_LOG                    | Frame of general information in the task log.              |
| MENU_ITEM_CONTENT_VIEWER              | Job log window.                                            |
| MENU_ITEM_DAY                         | Current day in the quest log window.                       |
| MENU_ITEM_TIME                        | Current time in the task log window.                       |
| MENU_ITEM_PLAYERGUILD                 | Character's guild in the statistics window.                |
| MENU_ITEM_TALENT_0_TITLE - MENU_ITEM_TALENT_16_TITLE | The name of the character's talent. Array indexes are used `TXT_TALENTS` from the `Text.d` file. There may be more elements, depending on the talents realized in the game. |
| MENU_ITEM_TALENT_0_SKILL - MENU_ITEM_TALENT_16_SKILL | Character's talent level. Array indexes are used `TXT_TALENTS_SKILLS` from the `Text.d` file.  |
| MENU_ITEM_EXP                         | The character's current experience value in the statistics window. |
| MENU_ITEM_LEVEL                       | Current character level in the statistics window.           |
| MENU_ITEM_LEVEL_NEXT                  | The amount of experience required to obtain the next level in the statistics window. |
| MENU_ITEM_LEARN                       | The number of available training points in the statistics window. |
| MENU_ITEM_ATTRIBUTE_1 - MENU_ITEM_ATTRIBUTE_4 | Character attributes in the statistics window.         |
| MENU_ITEM_ARMOR_1 - MENU_ITEM_ARMOR_4  | Character protection in the statistics window.             |

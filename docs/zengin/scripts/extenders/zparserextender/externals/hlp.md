# HLP - help functions
Helper functions generally used for safety checks, to get specific information from the engine or to interface with the configuration `.ini` files.

## Hlp_HasFocusVob
Returns `TRUE`, if a specified NPC has a Vob in focus

```dae
func int Hlp_HasFocusVob( var C_NPC npc ) {};
```

- `npc` - NPC
- `return` - `TRUE` if npc has a focus Vob, `FALSE` if it does not

## Hlp_GetFocusVob
Returns NPC's focus Vob

```dae
func instance Hlp_GetFocusVob( var C_NPC npc ) {};
```

- `npc` - NPC
- `return` - focus vob

## Hlp_GetFocusVobName
Returns the name of NPC's focus vob

```dae
func string Hlp_GetFocusVobName( var C_NPC npc ) {};
```

- `npc` - NPC
- `return` - focus vob name

## Hlp_GetStringLength
Returns the length of a specified string

```dae
func int Hlp_GetStringLength( var string str ) {};
```

- `return` - length of `str`

## IsNAN
Checks whether floating point number is valid

```dae
func int IsNAN( var float value ) {};
```

- `return` - `TRUE` if `value` is NaN, `FALSE` if `value` is a valid floating point number

## Hlp_KeyToggled
Checks whether `key` is toggled

```dae
func int Hlp_KeyToggled( var int key ) {};
```

- `key` - key code
- `return` - `TRUE` if key is toggled, `FALSE` if key is not toggled

## Hlp_KeyPressed
Checks whether `key` is pressed

```dae
func int Hlp_KeyPressed( var int key ) {};
```

- `key` - key code
- `return` - `TRUE` if key is pressed, `FALSE` if key is not pressed

## Hlp_LogicalKeyToggled
Checks whether logical `key` is toggled

```dae
func int Hlp_LogicalKeyToggled( var int key ) {};
```

- `key` - key code
- `return` - `TRUE` if key is toggled, `FALSE` if key is not toggled

## Hlp_GameOnPause
Checks whether the game is paused

```dae
func int Hlp_GameOnPause() {};
```

- `return` - `TRUE` if the game is paused, `FALSE` if the game is not paused

## Hlp_MessageBox
Opens a message box with a specified message

```dae
func void Hlp_MessageBox( var string message ) {};
```

- `message` - message to be printed

## Hlp_PrintConsole
Prints a message to the Union debug console

```dae
func void Hlp_PrintConsole(var string message) {};
```

- `message` - message to be printed

## Hlp_OptionIsExists
Checks whether the `entry` in `section` in `.ini` file `optName` exists

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func int Hlp_OptionIsExists(var string optName, var string section, var string entry) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[GAME]`
- `entry` - one setting entry like `playLogoVideos`
- `return` - `TRUE` if the option exists, `FALSE` if the option does not exist

## Hlp_ReadOptionInt
Read an integer value from specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func int Hlp_ReadOptionInt(var string optName, var string section, var string entry, var int default) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[GAME]`
- `entry` - one setting entry like `playLogoVideos`
- `default` - default value - if the value is empty
- `return` - the option value

## Hlp_ReadOptionFloat
Read a floating point value from specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func float Hlp_ReadOptionFloat(var string optName, var string section, var string entry, var float default) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[INTERFACE]`
- `entry` - one setting entry like `scale`
- `default` - default value - if the value is empty
- `return` - the option value

## Hlp_ReadOptionString
Read a string value from specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func string Hlp_ReadOptionString(var string optName, var string section, var string entry, var string default) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[INTERFACE]`
- `entry` - one setting entry like `scale`
- `default` - default value - if the value is empty
- `return` - the option value

## Hlp_WriteOptionInt
Writes an integer value to specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func void Hlp_WriteOptionInt(var string optName, var string section, var string entry, var int value) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[INTERFACE]`
- `entry` - one setting entry like `scale`
- `value` - value to be written

## Hlp_WriteOptionFloat
Writes a floating point value to specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func void Hlp_WriteOptionFloat(var string optName, var string section, var string entry, var float value) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[INTERFACE]`
- `entry` - one setting entry like `scale`
- `value` - value to be written

## Hlp_WriteOptionString
Writes a string value to specified `.ini` file, section and entry.

`optName` values

- `#!dae "Gothic"`
- `#!dae "Mod"`
- `#!dae "SystemPack"`

```dae
func void Hlp_WriteOptionString(var string optName, var string section, var string entry, var string value) {};
```

- `optName` - the `.ini` file
- `section` - settings section like `[INTERFACE]`
- `entry` - one setting entry like `scale`
- `value` - value to be written

## Hlp_GetSteamPersonalName
Returns the name of the current Steam user
Returns empty string when not run with Steam

```dae
func string Hlp_GetSteamPersonalName() {};
```

- `return` - string containing the Steam username, or an empty string

## Hlp_DoEvent
Calls every event function with the name `funcName`.

```dae
func void Hlp_DoEvent(var string funcName) {};
```

- `funcName` - name of the [event](../syntax_extensions/events.md) function to be called (all of them).

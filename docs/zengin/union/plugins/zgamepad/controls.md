---
title: Controls customization
---
# Gamepad controls
The zGamePad plugin comes with a default control scheme, but it is possible to create your own. The plugin will search for any file with the `.gamepad.overlay` extension placed in `Gothic/System` directory or in any of the loaded `.mod` and `.vdf` archives.

## Control file syntax
Gamepad controls are set using the `.gamepad` configuration file. This file encodes the controls for different actions in the game and the hint string in multiple languages.

!!! Warning
    The `.gamepad` file must be encoded in Unicode or UTF-8 to accommodate the multilingual hint strings.

### Regions
The format supports code blocks specified by the `#region` and `#endregion` keywords. These regions do not have any syntactical meaning, they only offer a convenient way to collapse sections of the code in editors with the syntax highlighting capabilities such as Notepad++

```title="Regions"
#region strings
    // TODO
#endregion

#region fight scheme
    // TODO
#endregion
```

### Comments
Comments are useful for quick information or just to disable some old code that might come in handy later. The `.gamepad` file syntax supports C++ line comments using two forward slashes `//`.

!!! warning
    Comments can only be used at the start of any given line!

```title="Comments"
// this is a comment
KeyRecord // this is NOT a comment
```

### Strings
Strings are used for interactive hints. They should be defined at the top of the file. To define a string, use the keyword `String`. Strings have the following format:
```title="Multilang string syntax"
String [id]
    [langTag] [text]
    [langTag] [text]
    [langTag] [text]
```
#### Example
```
String interact
    Rus "Взаимодействовать"
    Eng "Interact"
    Pol "Interakcja"
    Deu "Interagieren"

String remove_weapon
    Rus "Убрать оружие"
    Eng "Remove weapon"
    Pol "Chowanie broni"
    Deu "Waffe entfernen"
```
The string `name` must be unique and is used to reference the string while defining hints.
The language tag matches the language in `SystemPack.ini`. If the file does not contain the user's language, English will be taken by default. If there is no English, then the first one.

### Control bindings
A binding is a description of an event that includes emulation object and conditions. Hints are part of the binding.  
The general structure of the bind starts with the keyword `KeyRecord` and has the following format:
```title="Control binding"
KeyRecord [modifier]
    Id          [key name]
    Combination [gamepad keys]
    Emulation   [engine logical and absolute keys]
    Condition   [engine logical, absolute keys or logical functions]
    Help        [name of the hint string]
```

- `Id` - unique identifier used by other users to override this control binding
- `[modifier]` - can be empty or take the value of `Toggled` If the value is empty, the control binding will work as long as the player holds down the specified button or button combination.    
    If the value is `Toggled`, the control binding will work only when the player toggles the button or button combination. (One press to start sneaking, another press to stop sneaking)
- `Combination` - these are the gamepad buttons that the player must press or hold to activate the control binding.
- `Emulation` - specify which buttons will be emulated. You can specify absolute buttons, or that are defined in the game settings (logical).
- `Condition` - specify the condition under which the control binding can be activated. To invert condition, use the operator `!` before the operand (!Cond_IsOverlayTop, !JOY_B)
- `Help` - name of the text string with a hint which will be displayed when the Conditions are met.


- `[gamepad keys]` - [Gamepad key list](keys_gamepad.md)
- `[engine logical keys]` - [Engine logical key list](keys_engine_logical.md)
- `[engine absolute keys]` - [Engine absolute key list](keys_engine_absolute.md)
- `[logical functions]` - [Logical function list](logical_functions.md)

!!! Tip  
    All operators are optional! This means that if a binding should only show a hint, it doesn't have to contain Combination.

#### Example
```title="Control binding examples"
KeyRecord
    Id          StopUsingPicklock
    Combination JOY_B
    Emulation   KEY_DOWN
    Condition   Cond_InterfaceIsOpen, Cond_UsesPicklock, !JOY_B

KeyRecord Toggled
    Id          ReturnToHumanForm
    Combination JOY_A
    Emulation   KEY_RETURN
    Condition   Cond_InTransformation
    Help        end_transform

KeyRecord
    Id          QuickRingSelectSlot
    Combination JOY_RSTICK_FULL
    Condition   !Cond_InventoryIsOpen, Cond_IsOverlayTop
    Help        focus_item

```

### Controls override
If you want to change or remove bindings from another controls file, use the `KeyDisable` keyword.    
[Default controls file](https://github.com/Gratt-5r2/zGamePad/blob/master/Utils/controls.gamepad)

```title="Controls override syntax"
KeyDisable [fileName].[Id]
```
Where `fileName` is the name of the controls file without extension and `id` is a key of the binding.

#### Example
``` title="Controls override example"
// remove key from the main controls file
KeyDisable Controls.ArrowDown

// create new key based on the same buttons
KeyRecord Toggled
    Id          ArrowDownNew
    Combination JOY_DOWN
    Emulation   GAME_DOWN
```

[//]: #  (## Customization example)
[//]: #  (!!! Info  )
[//]: #  (    Real life example of gamepad controls customization for modification with different features.)


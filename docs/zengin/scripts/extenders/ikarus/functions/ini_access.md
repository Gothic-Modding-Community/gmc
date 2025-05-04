---
title: Ini File Access
---
# Configuration file access
This part of Ikarus gives you access to `Gothic.ini` and loaded mod configuration files.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L4293)

## Read functions

### `MEM_GetCommandLine`
!!! function "`MEM_GetCommandLine`"
    Returns the contents of the command line passed to Gothic.
    ```dae
    func string MEM_GetCommandLine()
    ```
    **Return value**

    The function returns contents of the command line passed to Gothic. This could, for example, look like this:

    `"-TIME:7:35 -GAME:TEST_IKARUS.INI -ZREPARSE -ZWINDOW -ZLOG:5,S -DEVMODE -ZMAXFRAMERATE:30"`

### `MEM_GetGothOpt`
!!! function "`MEM_GetGothOpt`"
    Searches the `Gothic.ini` for an option.
    ```dae
    func string MEM_GetGothOpt(var string sectionname, var string optionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[GAME]`
    - `#!dae var string optionname`  
        One setting entry like `playLogoVideos`

    **Return value**

    The function returns an option value as a string or empty string if option was not found.

### `MEM_GetModOpt`
!!! function "`MEM_GetModOpt`"
    Searches the loaded mod ini file for option.
    ```dae
    func void MEM_GetModOpt(var string sectionname, var string optionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[INFO]`
    - `#!dae var string optionname`  
        One setting entry like `Title`

    **Return value**

    The function returns an option value as a string or empty string if option was not found.

### `MEM_GothOptSectionExists`
!!! function "`MEM_GothOptSectionExists`"
    Checks whether a section exists in `Gothic.ini`
    ```dae
    func int MEM_GothOptSectionExists(var string sectionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[GAME]`

    **Return value**

    The function returns `TRUE` if section exists `FALSE` is returned otherwise.

### `MEM_ModOptSectionExists`
!!! function "`MEM_ModOptSectionExists`"
    Checks whether a section exists in loaded mod ini file
    ```dae
    func int MEM_ModOptSectionExists(var string sectionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[INFO]`

    **Return value**

    The function returns `TRUE` if section exists `FALSE` is returned otherwise.

### `MEM_GothOptExists`
!!! function "`MEM_GothOptExists`"
    Checks whether an option exists in `Gothic.ini`
    ```dae
    func int MEM_GothOptExists(var string sectionname, var string optionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[GAME]`
    - `#!dae var string optionname`  
        One setting entry like `playLogoVideos`

    **Return value**

    The function returns `TRUE` if option in a section exist `FALSE` is returned otherwise.

### `MEM_ModOptExists`
!!! function "`MEM_ModOptExists`"
    Checks whether an option exists in loaded mod ini file
    ```dae
    func int MEM_ModOptExists(var string sectionname, var string optionname)
    ```
    **Parameters**

    - `#!dae var string sectionname`  
        Settings section like `[INFO]`
    - `#!dae var string optionname`  
        One setting entry like `Title`

    **Return value**

    The function returns `TRUE` if option in a section exist `FALSE` is returned otherwise.

## Write functions
!!! Warning
    Mod configuration is never saved to disk, therefore no separate functions exist for writing to it.

### `MEM_SetGothOpt`
!!! function "`MEM_SetGothOpt`"
    The option `option` in the section `section` is set to the `value`. If the section and/or option does not exist, it will be created.
    ```dae
    func void MEM_SetGothOpt(var string section, var string option, var string value)
    ```
    **Parameters**

    - `#!dae var string section`  
        The section where the option should be located
    - `#!dae var string option`  
        Option to write/overwrite
    - `#!dae var string value`  
        Value to set the option to

### `MEM_ApplyGothOpt`
!!! function "`MEM_ApplyGothOpt`"
    Applies the changes and saves the ini to disk
    ```dae
    func void MEM_ApplyGothOpt()
    ```

    !!! Tip
        If you introduce new options, it is best to follow certain practices. It is a good practice to name your options in a clear manner and place them in a section named the same as your mod. Do not place your mod options into the `[GAME]` or `[PERFORMANCE]` sections.

## Key functions
The `Gothic.ini` contains the assignment of physical keys (e.g. "W") to logical keys (e.g. "keyUp").

### `MEM_GetKey`
!!! function "`MEM_GetKey`"
    Returns the primary key assigned to logical key.
    ```dae
    func int MEM_GetKey(var string name)
    ```
    **Parameters**

    - `#!dae var string name`  
        Name of the logical key

    **Return value**

    The function returns key assigned to logical key

### `MEM_GetSecondaryKey`
!!! function "`MEM_GetSecondaryKey`"
    Returns a secondary key assigned to logical key.
    ```dae
    func int MEM_GetSecondaryKey(var string name)
    ```
    **Parameters**

    - `#!dae var string name`  
        Name of the logical key

    **Return value**

    The function returns key assigned to logical key

### `MEM_SetKeys`
!!! function "`MEM_SetKeys`"
    Sets keyboard keys of the logical key.
    ```dae
    func void MEM_SetKeys(var string name, var int primary, var int secondary)
    ```
    **Parameters**

    - `#!dae var string name`  
        Name of the logical key
    - `#!dae var int primary`  
        Primary key to be assigned, can be taken from [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d) file.
    - `#!dae var int secondary`  
        Secondary key to be assigned, can be taken from [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d) file.

### `MEM_SetKey`
!!! function "`MEM_SetKey`"
    Sets the primary keyboard key of the logical key.
    ```dae
    func void MEM_SetKey(var string name, var int key)
    ```
    **Parameters**

    - `#!dae var string name`  
        Name of the logical key
    - `#!dae var int key`  
        Primary key to be assigned, can be taken from [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d) file.

### `MEM_SetSecondaryKey`
!!! function "`MEM_SetSecondaryKey`"
    Sets the secondary keyboard key of the logical key.
    ```dae
    func void MEM_SetSecondaryKey(var string name, var int key)
    ```
    **Parameters**

    - `#!dae var string name`  
        Name of the logical key
    - `#!dae var int key`  
        Secondary key to be assigned, can be taken from [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d) file.

# Confguratio file access
This part of Ikarus gives you access to `Gothic.ini` and loaded mod configuration files.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
func void MEM_InitAll () {};
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d)

## Read functions

### MEM_GetGothOpt
Searches the `Gothic.ini` for an option.
```dae
func string MEM_GetGothOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the option section
- `optionname` - name of the option
- `return` - the option value as a string, of it was not found, empty string is returned

### MEM_GetModOpt
Searches the loaded mod ini file for option.
```dae
func void MEM_GetModOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the option section
- `optionname` - name of the option
- `return` - the option value as a string, of it was not found, empty string is returned

### MEM_GothOptSectionExists
Checks whether a section exists in `Gothic.ini`
```dae
func int MEM_GothOptSectionExists(var string sectionname) {};
```

- `sectionname` - name of the searched section
- `return` - `TRUE` if section exist `FALSE` otherwise

### MEM_ModOptSectionExists
Checks whether a section exists in loaded mod ini file
```dae
func int MEM_ModOptSectionExists(var string sectionname) {};
```

- `sectionname` - name of the searched section
- `return` - `TRUE` if section exist `FALSE` otherwise

### MEM_GothOptExists
Gives an information if option exist in `Gothic.ini`
```dae
func int MEM_GothOptExists(var string sectionname,
var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - `TRUE` if option in a section exist `FALSE` otherwise

### MEM_ModOptExists
Gives an information if option exist in loaded mod ini file
```dae
func int MEM_ModOptExists(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - `TRUE` if option in a section exist `FALSE` otherwise

## Write functions
!!! Warning
    Mod configuration is never saved to disk, therefore there are no separate functions for writing to it

### MEM_SetGothOpt
The option `option` in the section `section` is set to the `value`. If the section and/or option does not exist, it will be created.
```dae
func void MEM_SetGothOpt(var string section, var string option, var string value) {};
```

- `section` - the section where the option is located
- `option` - option to write/overwrite
- `value` - value to set the option to

### MEM_ApplyGothOpt
Applies the changes and saves the ini to disk
```dae
func void MEM_ApplyGothOpt() {};
```

!!! Tip
    If you introduce new options, it is best to follow certain practices. It is a good practice to name your options clearly an place them in a section named the same as your mod. Do not place your mod options into the `[GAME]` or `[PERFORMANCE]` sections.


## Key functions
The `Gothic.ini` contains the assignment of physical keys (e.g. "W") to logical keys (e.g. "keyUp").

### MEM_GetKey
Returns a first key assigned to logical key.
```dae
func int MEM_GetKey (var string name) {};
```

- `name` - name of the logical key
- `return` - key assigned to logical key

### MEM_GetSecondaryKey
Returns a secondary key assigned to logical key.
```dae
func int MEM_GetSecondaryKey(var string name) {};
```

- `name` - name of the logical key
- `return` - key assigned to logical key

### MEM_SetKeys
Sets a logical key to the keys on keyboard.
```dae
func void MEM_SetKeys(var string name, var int primary, var int secondary) {};
```

- `name` - name of the logical key
- `primary` - primary key to be assigned, can be taken from Ikarus_Const_G1/G2 file.
- `secondary` - secondary key to be assigned, can be taken from Ikarus_Const_G1/G2 file.

### MEM_SetKey
Sets a logical key to the key on keyboard.
```dae
func void MEM_SetKey(var string name, var int key) {};
```

- `name` - name of the logical key
- `key` - primary key to be assigned, can be taken from Ikarus_Const_G1/G2 file.

### MEM_SetSecondaryKey
Sets a logical key to the keys on keyboard.
```dae
func void MEM_SetSecondaryKey(var string name, var int key) {};
```

- `name` - name of the logical key
- `key` - secondary key to be assigned, can be taken from Ikarus_Const_G1/G2 file.

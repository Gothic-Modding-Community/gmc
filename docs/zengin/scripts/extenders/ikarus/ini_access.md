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
Gives an information if option exist in `Mod.ini`
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



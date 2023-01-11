# ini access
This part of Ikarus gives you an access to `Gothic.ini` and `Mod.ini`

## Initialization
The best way to initialize all ikarus functions is to call `MEM_InitAll` in `Init_Global`

```dae
func void MEM_InitAll () {};
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d)

## Read functions

### MEM_GetGothOpt
Searches the `Gothic.ini` for option.
```dae
func void MEM_GetGothOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - the value of option if such a section with such an option exists, otherwise an empty string

### MEM_GetModOpt
Searches the `Mod.ini` for option.
```dae
func void MEM_GetModOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - the value of option if such a section with such an option exists, otherwise an empty string

### MEM_GothOptSectionExists
Gives an information if section exist in `Gothic.ini`
```dae
func int MEM_GothOptSectionExists(var string sectionname) {};
```

- `sectionname` - name of the searched section
- `return` - `1` if section exist `0` otherwise

### MEM_ModOptSectionExists
Gives an information if section exist in `Mod.ini`
```dae
func int MEM_ModOptSectionExists(var string sectionname) {};
```

- `sectionname` - name of the searched section
- `return` - `1` if section exist `0` otherwise

### MEM_GothOptExists
Gives an information if option exist in `Gothic.ini`
```dae
func int MEM_GothOptExists(var string sectionname,
var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - `1` if option in a section exist `0` otherwise

### MEM_ModOptExists
Gives an information if option exist in `Mod.ini`
```dae
func int MEM_ModOptExists(var string sectionname, var string optionname) {};
```

- `sectionname` - name of the searched section
- `optionname` - name of the searched option
- `return` - `1` if option in a section exist `0` otherwise

## Write functions
!!! Mod configuration is never saved to disk, therefore there are no separate functions for writing in it

### MEM_SetGothOpt
The option `option` in the section `section` is set to the `value`. If the section and/or option does not exist, both
in case of doubt.
```dae
func void MEM_SetGothOpt(var string section, var string option, var string value) {};
```

- `section` - the section where is located `option`
- `option` - option to write/overwrite
- `value` - string to write in `option`

!!! If the section or option doesn't exist the function create it

### MEM_ApplyGothOpt
Applies the changes and saves the ini to disk
```dae
func void MEM_ApplyGothOpt() {};
```

!!! Tip
    If you introduce new options, the good style requires you to do this in a separate section and the options are understandable. As a norm, I suggest that a mod with name "myMod" introduces new properties only in the "myMod" or "MOD-mymod"  section (and not in the section "GAME" or "PERFORMANCE").



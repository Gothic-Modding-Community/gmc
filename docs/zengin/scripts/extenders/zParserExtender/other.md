# Other functions of the extender
## ini parameters
The choice of ini file depends on how the game was launched. If it was launched from Gothic.exe, then the parameters will be read from `SystemPack.ini`. If it was launched through GothicStarter.exe, then they will be read from the ini of the mod.
  
```ini
[zParserExtender]
LoadScript(obsolete) =
;specifies a parser-script format script to run the scripts. The parameter is currently invalid.
  
MergeMode = True
;specifies whether injections will produce hooks.
  
CompileDat = False
;Determines if a copy of DAT file which has been modified by injection will be created.
  
CompileOU = False
;determines if a copy of an injection-modified OU file will be created.
  
NativeWhile = False
;Determines if a WHILE loop will be compiled. Defaults to False (for Ninja compatibility).
  
MessagesLevel = 1
;sets the output level. The higher the level, the more information will be printed to the debug console.
  
StringIndexingMode = -1
;defines string indexing mode (see string indexing). Default value is -1.
;Default   = -1 - The default mode for the moment is Repair mode.
;Disabled  =  0 - Do nothing with the indices.
;TopSymbol =  1 - The plugin finds the uppermost unnamed string and sets a counter for it.
;Repair    =  2 - The plugin goes through the whole string table and, if the indexing order is broken, puts the correct names. The counter is set on the basis of the search.
```

## MARVIN console commands
zParserExtender adds console commands that save copies of the `.dat` files with the injected code.

!!! warning
    If the mod uses Ikarus, the `CompileDat` option (in the `.ini` file) should be used, since a fatal error may occur whe using the command.

```dae
Parser SaveDat OU        - exports OU.Edited.bin
Parser SaveDat Game      - exports Gothic.Edited.dat
Parser SaveDat SFX       - exports SFX.Edited.dat
Parser SaveDat PFX       - exports ParticleFX.Edited.dat
Parser SaveDat VFX       - exports VisualFX.Edited.dat
Parser SaveDat Camera    - exports Camera.Edited.dat
Parser SaveDat Menu      - exports Menu.Edited.dat
Parser SaveDat Music     - exports Music.Edited.dat
Parser Export Stringlist - exports the full string table to Scripts\Exports\StringList.d
```

## Launch options
Command line parameters can be passed to the game's exe via the command line or using GothicStarter_Mod.

```dae
-zReparse_OU     - parses and creates OU.bin
-zReparse_Game   - parses and creates Gothic.dat
-zReparse_SFX    - parses and creates SFX.dat
-zReparse_PFX    - parses and creates ParticleFX.dat
-zReparse_VFX    - parses and creates VisualFX.dat
-zReparse_Camera - parses and creates Camera.dat
-zReparse_Menu   - parses and creates Menu.dat
-zReparse_Music  - parses and creates Music.dat
```

!!! note
    If you want to compile OU, you also have to include the Game parameter

    > -zReparse_Game -zReparse_OU

## Const array access
The original zParser doesn't allow direct access to `const string` arrays. zParserExtender allows you to do so.

Example:
```dae
func event GameInit()
{
    Hlp_MessageBox(TXT_INV_CAT[4]); // Prints "Artifacts"
};
```

## Other engine fixes
1. When creating an item instance, the instance is placed into the global `item` instance
2. On DAT file load, the engine restores the original symbol hierarchy
3. When loading a save, the engine now skips unkonw symbols, insted of crashing

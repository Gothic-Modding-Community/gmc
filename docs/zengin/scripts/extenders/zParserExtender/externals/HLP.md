# HLP - help functions
Helper functions, used for safety checks or to get specific information from the engine.

```c++
func int Hlp_HasFocusVob( var C_NPC npc ) {};

func instance Hlp_GetFocusVob( var C_NPC npc ) {};

func string Hlp_GetFocusVobName( var C_NPC npc ) {};

func int Hlp_GetStringLength( var string str ) {};

func int IsNAN( var float value ) {};

func int Hlp_KeyToggled( var int key ) {};

func int Hlp_KeyPressed( var int key ) {};

func int Hlp_LogicalKeyToggled( var int key ) {};

func int Hlp_GameOnPause() {};

func void Hlp_MessageBox( var string message ) {};

func void Hlp_PrintConsole(var string message) {};

func int Hlp_ReadOptionInt(var string optName, var string section, var string entry, var int default) {};

func float Hlp_ReadOptionFloat(var string optName, var string section, var string entry, var float default) {};

func string Hlp_ReadOptionString(var string optName, var string section, var string entry, var string default) {};

func int Hlp_OptionIsExists(var string optName, var string section, var string entry) {};

func void Hlp_WriteOptionInt(var string optName, var string section, var string entry, var int value) {};

func void Hlp_WriteOptionFloat(var string optName, var string section, var string entry, var float value) {};

func void Hlp_WriteOptionString(var string optName, var string section, var string entry, var string value) {};
```

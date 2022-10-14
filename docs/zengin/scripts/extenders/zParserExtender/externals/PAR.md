# PAR - functions for parser manipulation
Parser functions are used to manipulate the parsers. Retrieve SymbolID, access arrays and such.
```dae
func int Par_GetParserID(var string parName) {};

func int Par_GetSymbolID(var int parId, var string symName) {};

func int Par_GetSymbolLength(var int parId, var int symId) {};

func int Par_GetSymbolValueInt(var int parId, var int symId) {};

func float Par_GetSymbolValueFloat(var int parId, var int symId) {};

func string Par_GetSymbolValueString(var int parId, var int symId) {};

func instance Par_GetSymbolValueInstance(var int parId, var int symId) {};

func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId) {};

func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId) {};

func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueInt(var int value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueString(var string value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId) {};
```

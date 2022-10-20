# PAR - functions for parser manipulation
Parser functions are used to manipulate the parsers. Retrieve SymbolID, access arrays and such.

## Par_GetParserID
Returns a parser ID of the parser with a `parName` name

Parser names:

- `#!dae "Game"`
- `#!dae "SFX"`
- `#!dae "PFX"`
- `#!dae "VFX"`
- `#!dae "Camera"`
- `#!dae "Menu"`
- `#!dae "Music"`

```dae
func int Par_GetParserID(var string parName) {};
```

- `parName` - parser name
- `return` - parser ID

## Par_GetSymbolID
Returns symbol ID for the symbol specified by its name

```dae
func int Par_GetSymbolID(var int parId, var string symName) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol ID

## Par_GetSymbolLength
Returns symbol length (number of elements)

```dae
func int Par_GetSymbolLength(var int parId, var int symId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol length

## Par_GetSymbolValueInt
Returns the integer value of specified symbol

```dae
func int Par_GetSymbolValueInt(var int parId, var int symId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol value

## Par_GetSymbolValueFloat
Returns the float value of specified symbol

```dae
func float Par_GetSymbolValueFloat(var int parId, var int symId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol value

## Par_GetSymbolValueString
Returns the string value of specified symbol

```dae
func string Par_GetSymbolValueString(var int parId, var int symId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol value

## Par_GetSymbolValueInstance
Returns the instance value of specified symbol

```dae
func instance Par_GetSymbolValueInstance(var int parId, var int symId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `return` - symbol value

## Par_GetSymbolValueIntArray
Returns the value of specified integer array at the `arrayID` index

```dae
func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `arrayID` - array index
- `return` - value

## Par_GetSymbolValueFloatArray
Returns the value of specified float array at the `arrayID` index

```dae
func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `arrayID` - array index
- `return` - value

## Par_GetSymbolValueStringArray
Returns the value of specified string array at the `arrayID` index

```dae
func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId) {};
```

- `parID` - parser ID
- `symName` - symbol name
- `arrayID` - array index
- `return` - value

## Par_SetSymbolValueInt
Sets a new integer value to specified symbol

```dae
func void Par_SetSymbolValueInt(var int value, var int parId, var int symId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID

## Par_SetSymbolValueFloat
Sets a new float value to specified symbol

```dae
func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID

## Par_SetSymbolValueString
Sets a new string value to specified symbol

```dae
func void Par_SetSymbolValueString(var string value, var int parId, var int symId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID

## Par_SetSymbolValueInstance
Sets a new instance value to specified symbol

```dae
func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID

## Par_SetSymbolValueIntArray
Sets a new integer value to specified integer array symbol

```dae
func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID
- `arrayId` - array index

## Par_SetSymbolValueFloatArray
Sets a new float value to specified float array symbol

```dae
func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID
- `arrayId` - array index

## Par_SetSymbolValueStringArray
Sets a new string value to specified string array symbol

```dae
func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId) {};
```

- `value` - value to be set
- `parID` - parser ID
- `symId` - symbol ID
- `arrayId` - array index

## Externals with docu comments

```dae
/// Returns a parser ID of the parser with a `parName` name
///
/// Parser names:
/// - "Game"
/// - "SFX"
/// - "PFX"
/// - "VFX"
/// - "Camera"
/// - "Menu"
/// - "Music"
/// 
/// @param parName parser name
/// @return parser ID
func int Par_GetParserID(var string parName) {};

/// Returns symbol ID for the symbol specified by its name
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol ID
func int Par_GetSymbolID(var int parId, var string symName) {};

/// Returns symbol length (number of elements)
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol length
func int Par_GetSymbolLength(var int parId, var int symId) {};

/// Returns the integer value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func int Par_GetSymbolValueInt(var int parId, var int symId) {};

/// Returns the float value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func float Par_GetSymbolValueFloat(var int parId, var int symId) {};

/// Returns the string value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func string Par_GetSymbolValueString(var int parId, var int symId) {};

/// Returns the instance value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func instance Par_GetSymbolValueInstance(var int parId, var int symId) {};

/// Returns the value of specified integer array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId) {};

/// Returns the value of specified float array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId) {};

/// Returns the value of specified string array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId) {};

/// Sets a new integer value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueInt(var int value, var int parId, var int symId) {};

/// Sets a new float value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId) {};

/// Sets a new string value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueString(var string value, var int parId, var int symId) {};

/// Sets a new instance value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId) {};

/// Sets a new integer value to specified integer array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId) {};

/// Sets a new float value to specified float array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId) {};

/// Sets a new string value to specified string array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId) {};
```

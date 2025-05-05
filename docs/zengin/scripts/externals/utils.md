# Utility functions
Utility functions are used for data types operations, such as type conversion.

## Fucntions

### `IntToFloat`
!!! function "`IntToFloat`"
    Converts an integer to a float
    ```dae
    func float IntToFloat(var int x)  {};
    ```

    **Parameters**  

    - `#!dae var int x` - number to convert

    **Return value**  
    The function returns converted float

### `IntToString`
!!! function "`IntToString`"
    Converts an int to a string
    ```dae
    func string IntToString(var int x)  {};
    ```

    **Parameters**  

    - `#!dae var int x` - number to convert

    **Return value**  
    The function returns converted string

### `FloatToInt`
!!! function "`FloatToInt`"
    Converts a float to an int (cuts off the decimal part)
    ```dae
    func int FloatToInt(var float x)  {};
    ```

    **Parameters**  

    - `#!dae var float x` - float number to convert

    **Return value**  
    The function returns converted integer

### `FloatToString`
!!! function "`FloatToString`"
    Converts a float to a string with 6 decimal places
    ```dae
    func string FloatToString(var float x)  {};
    ```

    **Parameters**  

    - `#!dae var float x` - float number to convert

    **Return value**  
    The function returns converted string


### `ConcatStrings`
!!! function "`ConcatStrings`"
	Concatenates two strings and returns the new string
	```dae
	func string ConcatStrings(var string str1, var string str2) {};
	```

	**Parameters**   

	- `#!dae var string str1` - first string
	- `#!dae var string str2` - second string

	**Return value**  
	The function returns concatenated string

## zParserExtender
zParserExtender implements its own type conversion functions. Check the [Cast external functions](../extenders/zparserextender/externals/cast.md) for more information.
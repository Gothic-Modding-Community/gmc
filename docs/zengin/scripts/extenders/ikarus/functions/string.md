# String operations
Collection of Ikarus functions to manipulate and format strings.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L2341)

## Functions

### `STR_GetCharAt`
Returns the ASCII value of a character at a specific position in a string.
```dae
func int STR_GetCharAt (var string str, var int pos)
```
**Parameters**:

- `#!dae var string str`  
    The input string
- `#!dae var int pos`  
    The position of the character

**Return value**

The function returns the ASCII value of the character at the specified position.

### `STR_Len`
Returns the length of a string.
```dae
func int STR_Len (var string str)
```
**Parameters**:

- `#!dae var string str`  
    The input string

**Return value**

The function returns the length of the string in characters.

### `STR_toChar`
Converts a string to a pointer to its character array.
```dae
func int STR_toChar (var string str)
```
**Parameters**:

- `#!dae var string str`  
    The input string

**Return value**

The function returns a pointer to the character array representing the input string `str`

### `STR_FromChar`
Converts a character array to a string.
```dae
func string STR_FromChar(var int char)
```
**Parameters**:

- `#!dae var int char`  
    Pointer to the character array

**Return value**

The function returns a string representation of the character array.

### `STR_SubStr`
Extracts a substring from a given string.
```dae
func string STR_SubStr (var string str, var int start, var int count)
```
**Parameters**:

- `#!dae var string str`  
    The input string
- `#!dae var int start`  
    The starting position of the substring
- `#!dae var int count`  
    The length of the substring

**Return value**

The function returns a substring, if the starting position is invalid an empty string is returned.


### `STR_Prefix`
Extracts a prefix of a given string, similar to [`STR_SubStr`](#str_substr), but with the starting position set to the first character of the string.
```dae
func string STR_Prefix (var string str, var int len)
```
**Parameters**:

- `#!dae var string str`  
    The input string
- `#!dae var int count`  
    The length of the prefix

**Return value**

The function returns a prefix of the input string with the specified length.

### `STR_Compare`
Compares two strings lexicographically and returns a result indicating their relative order.
```dae
func int STR_Compare(var string str1, var string str2)
```
**Parameters**

- `#!dae var string str1` 
    The first string to compare
- `#!dae var string str2` 
    The second string to compare

**Return Value**

The function returns an integer value representing the result of the comparison:

- `STR_GREATER` (1): If `str1` comes lexicographically after `str2`.
- `STR_EQUAL` (0): If `str1` is lexicographically equal to `str2`.
- `STR_SMALLER` (-1): If `str1` comes lexicographically before `str2`.

??? abstract "Examples"
    The comparison is based on lexicographic order, which is the order of characters as they appear in the ASCII table. Uppercase letters come before lowercase letters.

    ```dae
    int result1 = STR_Compare("A", "B");
    // The 'result1' variable now contains STR_SMALLER

    int result2 = STR_Compare("ABC", "ABC");
    // The 'result2' variable now contains STR_EQUAL

    int result3 = STR_Compare("AA", "A");
    // The 'result3' variable now contains STR_GREATER

    int result4 = STR_Compare("BA", "BB");
    // The 'result4' variable now contains STR_SMALLER

    int result5 = STR_Compare("B", "a");
    // The 'result5' variable now contains STR_SMALLER

    int result6 = STR_Compare("A", "");
    // The 'result6' variable now contains STR_GREATER
    ```

### `STR_ToInt`
Converts a string to an integer.
```dae
func int STR_ToInt (var string str)
```
**Parameters**:

- `#!dae var string str`  
    The input string

**Return Value**

The function returns an integer value of the string, if a string is invalid (doesn't contain an integer) zero is returned.

### `STR_IndexOf`
Searches for a substring `tok` within a given string and returns the index of the first occurrence of `tok`, taking into account upper and lower case letters.
```dae
func int STR_IndexOf(var string str, var string tok)
```
**Parameters**

- `#!dae var string str`  
    The string in which to search for `tok`.
- `#!dae var string tok`  
    The substring to search for within `str`.

**Return Value**

The function returns the index at which the first occurrence of `tok` begins within `str`. If `tok` is not found in `str`, the function returns -1.

??? abstract "Examples"

    ```dae
    int index1 = STR_IndexOf("Hello World!", "Hell");
    // The 'index1' variable now contains 0

    int index2 = STR_IndexOf("Hello World!", "World");
    // The 'index2' variable now contains 6

    int index3 = STR_IndexOf("Hello World!", "Cake");
    // The 'index3' variable now contains -1

    int index4 = STR_IndexOf("Hello World!", "");
    // The 'index4' variable now contains 0

    int index5 = STR_IndexOf("Hello", "Hello World!");
    // The 'index5' variable now contains -1

    int index6 = STR_IndexOf("hello Hell!", "Hell");
    // The 'index6' variable now contains 6

    int index7 = STR_IndexOf("", "");
    // The 'index7' variable now contains 0
    ```

### `STR_SplitCount`
Counts the number of parts a string splits into when using a specified separator.
```dae
func int STR_SplitCount(var string str, var string seperator)
```
**Parameters**

- `#!dae var string str`  
    The input string to be split.
- `#!dae var string separator`  
    The separator character or string used to split the input string.

**Return Value**

The function returns a number of parts the input string splits into when using the specified separator.

??? abstract "Example"

    ```dae
    string inputStr = "This is a sentence.";
    int count = STR_SplitCount(inputStr, " ");
    // The 'count' variable now contains 4
    ```

### `STR_Split`
Splits a string into multiple substrings based on a specified separator and returns the substring at a specified offset.
```dae
func string STR_Split(var string str, var string separator, var int offset)
```

**Parameters**

- `#!dae var string str `  
    The input string to be split.
- `#!dae var string separator`  
    The separator character or string used to split the input string.
- `#!dae var int offset`  
    The index of the substring to be returned after splitting. The index is zero-based.

**Return Value**

The function returns a substring at the specified offset after splitting the input string. If the offset is greater than or equal to the number of parts generated by splitting, an empty string is returned.

??? abstract "Example"

    ```dae
    func void foo() {
        string inputStr = "This is a sentence.";
        string tok1 = STR_Split(inputStr, " ", 0); // This
        string tok2 = STR_Split(inputStr, " ", 1); // is
        string tok3 = STR_Split(inputStr, " ", 2); // a
        string tok4 = STR_Split(inputStr, " ", 3); // sentence
    };
    ```
    At the end of the function, `tok1` contains "This", `tok2` contains "is", `tok3` contains "a", and `tok4` contains "sentence.".

### `STR_Upper`
Converts a string to uppercase.
```dae
func string STR_Upper(var string str)
```
**Parameters**:

- `#!dae var string str`  
    The input string

**Return Value**

The function returns a copy of `str` with all uppercase letters converted to their corresponding uppercase letters.

### `STR_Lower`
Converts a string to lowercase.
```dae
func string STR_Lower(var string str)
```
**Parameters**:

- `#!dae var string str`  
    The input string

**Return Value**

The function returns a copy of `str` with all lowercase letters converted to their corresponding uppercase letters.

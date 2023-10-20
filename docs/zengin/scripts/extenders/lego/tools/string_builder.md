# StringBuilder
The StringBuilder is a package, designed to easily concatenate multiple elements into a string (without `ConcatStrings` and `IntToString`).

All created StringBuilders are transient. All functions starting from `SB_InitBuffer`, including it, use the active StringBuilder set with `SB_New` or `SB_Use`, so there is no `#!dae var int stringBuilder` parameter in functions. A look at the example explains what I mean.

!!! Warning
    The StringBuilder works with pointers, not handles like many other LeGo packages.

## Dependencies
N/A

## Initialization
N/A

## Implementation
[:material-github: StringBuilder.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/StringBuilder.d)

## Functions

### `SB_New`
Creates and returns a new `StringBuilder`. At the same time, this new `StringBuilder` is set as active. (See `SB_Use`.) 
```dae
func int SB_New()
```
**Return value**

The function returns a pointer to a new `StringBuilder`.

### `SB_Use`
Marks this `StringBuilder` as active. It can now be used with the functions.
```dae
func void SB_Use(var int sb)
```
**Parameters**

- `#!dae var int sb`  
    Pointer to a `StringBuilder`, returned from `SB_New`

### `SB_Get`
Returns the active `StringBuilder`. 
```dae
func int SB_Get()
```
**Return value**

The function returns the active `StringBuilder` object - last set with `SB_Use` or just created with `SB_New`.

### `SB_InitBuffer`
If the size of the resulting string is already known, the buffer can be set manually. This is usually not necessary.
```dae
func void SB_InitBuffer(var int size)
```
**Parameters**

- `#!dae var int size`  
    Size in bytes. **Warning!** Only works if the `StringBuilder` has been newly created! 

### `SB_Clear`
Empties the current `StringBuilder`. It is not destroyed in the process, so it can be used again. If the object has a buffer allocated, the buffer is freed.
```dae
func void SB_Clear()
```

### `SB_Release`
Releases the current stream of the `StringBuilder`. The `StringBuilder` is destroyed, and the stream can be obtained via `SB_GetStream`.
```dae
func void SB_Release()
```

### `SB_Destroy`
Completely destroys the `StringBuilder`. 
```dae
func void SB_Destroy()
```

### `SB_ToString`
Returns a copy of the stream as a string. 
```dae
func string SB_ToString()
```
**Return value**

The function returns the copy of the active `StringBuilder` as a string. If the `StringBuilder` object doesn't have a buffer allocated, an empty string is returned.

### `SB_ToStream`
Returns a copy of the stream in raw format.
```dae
func int SB_ToStream()
```
**Return value**

The function returns a copy of the stream in raw format (`char[]`)

### `SB_GetStream`
Doesn't copy the stream, but returns it as it is.
```dae
func int SB_GetStream()
```
**Return value**

The function returns the stream as it is. `SB_Destroy` or `SB_Clear` destroy the returned pointer.

### `SB_Length`
Returns the current length of the stream. Similar to `STR_Len` from [Ikarus](../../ikarus/index.md) .
```dae
func int SB_Length()
```
**Return value**

The function returns the current length of the active `StringBuilder`.

### `SB_SetLength`
Sets the length of the stream. When increasing, zero bytes are appended.
```dae
func void SB_SetLength(var int length)
```

## Stream operations


### `SB`
Appends a string, to the active `StringBuilder`.
```dae
func void SB(var string s)
```
**Parameters**

- `#!dae var string s`  
    The appended string

### `SBi`
Appends an integer in text form, to the active `StringBuilder`.
```dae
func void SBi(var int i)
```
**Parameters**

- `#!dae var int i`  
    The appended integer

### `SBc`
Appends a byte, to the active `StringBuilder`. (e.g. 82 for 'R' - An ASCII table can be quickly found)
```dae
func void SBc(var int c)
```
**Parameters**

- `#!dae var int c`  
    The appended byte (ASCII table character)

### `SBraw`
Appends a raw bytes array, to the active `StringBuilder`.
```dae
func void SBraw(var int ptr, var int len)
```
**Parameters**

- `#!dae var int ptr`  
    Pointer to the appended array
- `#!dae var int len`  
    Length of an array

### `SBflt`
Appends a Daedalus float in text form, to the active `StringBuilder`.
```dae
func void SBflt(var float x)
```
**Parameters**

- `#!dae var float x`  
    The appended Daedalus float value

### `SBf`
Appends an Ikarus float in text form, to the active `StringBuilder`.
```dae
func void SBf(var int x)
```
**Parameters**

- `#!dae var float x`  
    The appended Ikarus float value

### `SBw`
Appends a 4-byte raw data (interpreted as an integer `x`), to the active `StringBuilder`.
```dae
func void SBw(var int x)
```
**Parameters**

- `#!dae var int i`  
    The appended value

## Independent Functions

### `STR_Escape`
Makes escape sequences out of non-writable characters. For example, newline character `\n` becomes `\\n`, tab character `\t` becomes `\\t`, etc.
```dae
func string STR_Escape(var string s0)
```
**Parameters**

- `#!dae var string s0`  
    The string to be added escape sequences

**Return value**

The function returns a new string with escape sequences added for special characters.


### `STR_Unescape`
Counterpart to `STR_Escape`. Escape sequences like `\n`, `\r` or `\t` are converted back. 
```dae
func string STR_Unescape(var string s0)
```
**Parameters**

- `#!dae var string s0`  
    The string to be removed escape sequences

**Return value**

The function returns a new string with escape sequences replaced by their corresponding characters.

### `STR_StartsWith`
Checks if the input string `s` starts with the specified prefix string.
```dae
func int STR_StartsWith(var string str, var string start) 
```
**Parameters**

- `#!dae var string str`  
    The string to be checked
- `#!dae var string start`  
    The searched prefix

**Return value**

The function returns `TRUE` if the string starts with the prefix, `FALSE` is returned otherwise.

## Additional Functions

### `BuildStringSymbolsArray`
Creates an array of all string symbols found in the parser's string table.
```dae
func int BuildStringSymbolsArray()
```
**Return value**

The function returns created array.

### `GetStringSymbolByAddr`
Retrieves the symbol at the specified address from the string table.
```dae
func int BuildStringSymbolsArray()
```
**Return value**

The function returns a parser symbol at the given address.

## Examples

### Basic functionality 
This is how function that builds a string looks without `StringBuilder`:
```dae
func void PrintMyNumbers(var int x0, var int x1, var int x2) {
    var string res;
    res = ConcatStrings(IntToString(x0), ", ");
    res = ConcatStrings(res, IntToString(x1));
    res = ConcatStrings(res, ", ");
    res = ConcatStrings(res, IntToString(x2));
    PrintS(res);
};
```
And now the function that uses `StringBulider`:
```dae
func void PrintMyNumbers(var int x0, var int x1, var int x2) {
    var int s; s = SB_New();  // Create StringBuilder
    SBi(x0);                  // Append Int
    SB (", ");                // Append string
    SBi(x1);                  // Append Int
    SB (", ");                // Append string
    SBi(x2);                  // Append Int
    PrintS(SB_ToString());    // Get output as a string
    SB_Destroy();             // Destroy StringBuilder
};
```
Looks much more pleasant, right? But why do we create a StringBuilder and then not use it?
The idea is the following: A StringBuilder is created with `SB_New()` and set as the active StringBuilder in the background. The package only supports one StringBuilder at a time, which will keep the pointer in case we want to use another StringBuilder in between. 

### Multiple StringBuilders
Simple example. We want to fill two StringBuilders at the same time and then return them combined:
```dae
func string Example2() {
    // Create two StringBuilders:
    var int s0; s0 = SB_New();
    var int s1; s1 = SB_New();

    // Set the first StringBuilder as active and fill it.
    SB_Use(s0);
    SB("Hello ");
    SB("World!");

    // Set the second StringBuilder as active and fill it.
    SB_Use(s1);
    SB("This is ");
    SB("the hero speaking!");

    // Now we want to combine the two StringBuilders.
    // The system doesn't actually provide for such an operation, but it can still be done using a helper string
    var string str; str = SB_ToString(); // This string now says “This is the hero speaking!”

    SB_Use(s0);
    SB(" ");
    SB(str);

    str = SB_ToString(); // Now "Hello world! This is the hero speaking!" are in the string.

    // The rest is already known, we destroy StringBuilders
    SB_Destroy();
    SB_Use(s1);
    SB_Destroy();

    return str;
};
```
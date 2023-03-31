# BinaryMachines
This package allows you to create and write your own files anywhere in the file system.

## Dependencies  
N/A

## Initialization  
N/A

## Implementation
[:material-github: BinaryMachines.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/BinaryMachines.d)

## BinaryWriter

### `BW_NewFile`
Creates the file with the `file` name and opens a stream. Doesn't work if a stream is already open.
```dae
func int BW_NewFile(var string file)
```
**Parameters**

- `#!dae var string file`  
    Name of created file

### `BW_Close`
Closes the current write stream.
```dae
func void BW_Close()
```

### `BW`
Writes `length` bytes from the `data` to the stream, maximum 4 bytes.
```dae
func void BW(var int data, var int length)
```
**Parameters**

- `#!dae var int data`  
    Value of bytes
- `#!dae var int length`  
    Number of bytes

### `BW_Int`
Writes 4 bytes from the `data` to the stream. Same as `BW(data, 4)`.
```dae
func void BW_Int(var int data)
```
**Parameters**

- `#!dae var int data`  
    Int value to wirte

### `BW_Char`
Writes the first character from the `data` to the stream. Same as `BW(Str_GetCharAt(data, 0), 1)`.
```dae
func void BW_Char(var string data)
```
**Parameters**

- `#!dae var string data`  
    Char to write

### `BW_String`
Writes the `data` terminated with `\0` to the stream.
```dae
func void BW_String(var string data)
```
**Parameters**

- `#!dae var string data`  
    String to write

### `BW_Byte`
Writes a byte from the `data` to the stream. Same as `BW(data, 1)`.
```dae
func void BW_Byte(var int data)
```
**Parameters**

- `#!dae var int data`  
    Byte value to write

### `BW_Bytes`
Writes `length` of bytes from the pointer `dataPtr` to the stream.
```dae
func void BW_Bytes(var int dataPtr, var int length)
```
**Parameters**

- `#!dae var int dataPtr`  
    Pointer of data to write
- `#!dae var int length`  
    Number of bytes

### `BW_Text`
Writes the string to the stream without terminating it. So it can no longer be read.
```dae
func void BW_Text(var string data)
```
**Parameters**

- `#!dae var string data`  
    Text to write

### `BW_NextLine`
Writes a paragraph to the stream.
```dae
func void BW_NextLine()
```

## BinaryReader

### `BR_OpenFile`
Opens the file with the `file` name and opens a stream. Doesn't work if a stream is already open.
```dae
func int BR_OpenFile(var string file)
```
**Parameters**

- `#!dae var string file`  
    File to be opened

### `BR_Close`
Closes the current read stream.
```dae
func void BR_Close()
```

### `BR`
Reads bytes from the stream.
```dae
func int BR(var int length)
```
**Parameters**

- `#!dae var int length`  
    Number of bytes to read (maximum 4)

**Return value**

The function returns the value of read bytes.

### `BR_Int`
Reads 4 bytes from the stream. Same as `BR(4)`.
```dae
func int BR_Int()
```
**Return value**

The function returns the read integer.

### `BR_Char`
Reads a character from the stream. Same as `BR(1)`.
```dae
func string BR_Char()
```
**Return value**

The function returns the read character.

### `BR_String`
Reads a string terminated by `\0` from the stream.
```dae
func string BR_String()
```
**Return value**

The function returns the read string.

### `BR_Byte`
Reads a byte from the stream.
```dae
func int BR_Byte()
```
**Return value**

The function returns the read byte.

### `BR_Bytes`
Reads bytes from the stream.
```dae
func int BR_Bytes(var int length)
```
**Parameters**

- `#!dae var int length`  
    Number of bytes to read

**Return value**

The function returns a pointer to the read bytes.

### `BR_TextLine`
Reads a line from the stream.
```dae
func string BR_TextLine()
```
**Return value**

The function returns the read line.

### `BR_Text`
Reads a string of the given length from a stream.
```dae
func string BR_Text(var int length)
```
**Parameters**

- `#!dae var int length`  
    Number of characters to read

**Return value**

The function returns the read string.

## Examples

### Save and load variables
```dae
const string filename = "System\MySave.sav";

var string s0; // string
var int    i1; // int
var int    b2; // byte
var string c3; // char

func void SaveMyData() 
{
    if(BW_NewFile(filename))  // Create a new file:
    { 
        BW_String(s0);
        BW_Int(i1);
        BW_Byte(b2);
        BW_Char(c3);          // Save stuff..
        BW_Close();           // ..and close.
    };
};

func void LoadMyData() {
    if(BR_OpenFile(filename)) // Try to open file:
    { 
        s0 = BR_String();
        i1 = BR_Int();
        b2 = BR_Byte();
        c3 = BR_Char();       // Read in values..
        BR_Close();           // ..and close.
    }
    else 
    {
        SaveMyData();         // Otherwise create a save file.
    };
};
```

### Congratulate the player
```dae
func void Certificate(var string Username, var int Score) 
{
    var string filename; filename = ConcatStrings(Username, "'s Certificate.txt");
    BW_NewFile(filename); // Username + "s Certificate.txt". The file is then in the Gothic directory.
    BW_Text("Congratulations "); BW_Text(Username);
    BW_TextLine("!");

    BW_Text("You have reached ");
    BW_Text(IntToString(Score)); // Not BW_Int!
    BW_TextLine(" Points in this fun game.");

    BW_NextLine();

    BW_Text("Best regards, Author");
    BW_Close();

    /*
       When calling:  Certificate("Player", 1000);
       a file with the name 'Player's Certificate.txt' would come out which would contain the following:

        Congratulations Player
        You have reached 1000 Points in this fun game.

        Best regards, Author
    */
};
```

### The location of an NPCs
```dae
func void BW_NpcPosition(var C_NPC slf) 
{
    var int ptr; ptr = MEM_Alloc(60);                // 16 * 4
    MEM_CopyBytes(MEM_InstToPtr(slf) + 60, ptr, 60); // Copy slf.trafoObjToWorld
    BW_Bytes(ptr, 60);                               // Writes the 60 copied bytes
    MEM_Free(ptr);                                   // And clean up..
};

func void BR_NpcPosition(var C_NPC slf) 
{
    var int ptr; ptr = BR_Bytes(60);                 // Read 60 bytes
    MEM_CopyBytes(ptr, MEM_InstToPtr(slf) + 60, 60); // Paste back into slf
    MEM_Free(ptr);                                   // And clean up again..
};

/*
   Normal use:
     BW_NewFile(file);
     BW_NpcPosition(hero);
     BW_Close();
*/
```

!!! Note
    Examples originally written by Gottfried and [posted](https://forum.worldofplayers.de/forum/threads/969446-Skriptpaket-Ikarus-3/page3?p=16198713#post16198713) on World of Gothic forum.

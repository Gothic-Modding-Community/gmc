# Elementary memory access
This part of Ikarus makes it possible to read and write memory as different data types - integers, strings, arrays of integers and strings and bytes.

If `address <= 0`, an error is thrown. Otherwise, an attempt is made to read or write at this address.
If the address falls into invalid range, for example in a code segment,access violation will occur (Gothic crashes).
In the case of string operations, it is also necessary that at the specified position a valid zString already exists.

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

### MEM_ReadInt
Reads int from the `address`.
```dae
func int MEM_ReadInt (var int address) {};
```

- `address` - memory address to read from
- `return` - integer value if the address is correct

### MEM_ReadString
Reads string from the `address`.
```dae
func string MEM_ReadString (var int address) {};
```

- `address` - memory address to read from
- `return` - string if the address is correct

### MEM_ReadByte
Reads byte from the `adr`.
```dae
func int MEM_ReadByte (var int adr) {};
```

- `adr` - memory address to read from
- `return` - byte value if the address is correct

### MEM_ReadIntArray
Reads int from the array at the `arrayAddress`.
```dae
func int MEM_ReadIntArray (var int arrayAddress, var int offset) {};
```

- `arrayAddress` - memory address of array
- `offset` - array offset (array index)
- `return` - string from array if the address is correct

### MEM_ReadStringArray
!!! Info
    `MEM_ReadStringArray` has been already moved to the LeGo PermMem package.

### MEM_ReadByteArray
Reads byte from the array at the `arrayAddress`.
```dae
func int MEM_ReadByteArray (var int arrayAddress, var int offset) {};
```

- `arrayAddress` - memory address of array
- `offset` - array offset (array index)
- `return` - byte from array if the address is correct

## Write functions

### MEM_WriteInt
Writes int value in the `address`.
```dae
func void MEM_WriteInt (var int address, var int val) {};
```

- `address` - memory address to write into
- `val` - int value to write

### MEM_WriteString
Writes string in the `address`.
```dae
func void MEM_WriteString (var int address, var string val) {};
```

- `address` - memory address to write into
- `val` - string to write

### MEM_WriteByte
Only the byte at address `adr` is changed here, not a whole four-byte word. That is, the three subsequent bytes remain untouched.
If `0 <= val < 256` does not apply in `MEM_WriteByte`, a warning is issued and val is trimmed accordingly. In particular, shouldn't be negative numbers are passed.
```dae
func void MEM_WriteByte (var int adr, var int val) {};
```

- `address` - memory address to write into
- `val` - byte to write

### MEM_WriteIntArray
Writes int value in the array at `arrayAddress`.
```dae
func void MEM_WriteIntArray (var int arrayAddress, var int offset, var int value) {};
```

- `arrayAddress` - memory address of array
- `offset` - array offset (array index)
- `val` - int value to write

### MEM_WriteStringArray
Writes string value in the array at `arrayAddress`.
```dae
func void MEM_WriteStringArray (var int arrayAddress, var int offset, var string value) {};
```

- `arrayAddress` - memory address of array
- `offset` - array offset (array index)
- `val` - string to write

### MEM_WriteByteArray
Writes byte value in the array at `arrayAddress`.
```dae
func void MEM_WriteByteArray (var int arrayAddress, var int offset, var int value) {};
```

- `arrayAddress` - memory address of array
- `offset` - array offset (array index)
- `val` - byte to write

## Examples

### Usage of MEM_WriteInt
An example of using [MEM_WriteInt](#mem_writeint) is the following Ikarus function, which turns debugging messages on and off:
```dae
func void MEM_SetShowDebug (var int on)
{
    MEM_WriteInt(showDebugAddress, on);
};
```


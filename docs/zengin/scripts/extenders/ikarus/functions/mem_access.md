---
title: Memory Access
---
# Elementary memory access
This part of Ikarus makes it possible to read and write memory as different data types - integers, strings, arrays of integers or strings and bytes.

If `address <= 0`, an error is thrown. Otherwise, an attempt is made to read or write at this address.
If the address falls into invalid range, for example in a code segment, access violation will occur (Gothic crashes).
In the case of string operations, it is also necessary that at the specified position a valid zString already exists.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L328)

## Read functions

### `MEM_ReadInt`
Reads int from the `address`.
```dae
func int MEM_ReadInt(var int address)
```
**Parameters**

- `#!dae var int address`  
    Memory address to read from

**Return value**

The function returns an integer value if the address is correct.

### `MEM_ReadString`
Reads string from the `address`.
```dae
func string MEM_ReadString(var int address)
```
**Parameters**

- `#!dae var int address`  
    Memory address to read from

**Return value**

The function returns string if the address is correct.

### `MEM_ReadByte`
Reads byte from the `address`.
```dae
func int MEM_ReadByte(var int address)
```
**Parameters**

- `#!dae var int address`  
    Memory address to read from

**Return value**

The function returns byte value if the address is correct.

### `MEM_ReadIntArray`
Reads int from the array at the `arrayAddress`.
```dae
func int MEM_ReadIntArray(var int arrayAddress, var int offset)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)

**Return value**

The function returns integer value from the array if the address is correct.

### `MEM_ReadStringArray`
!!! Info
    `MEM_ReadStringArray` has been already moved to the LeGo [PermMem](../../lego/tools/permmem.md#mem_readstringarray) package.

### `MEM_ReadByteArray`
Reads byte from the array at the `arrayAddress`.
```dae
func int MEM_ReadByteArray(var int arrayAddress, var int offset)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)

**Return value**

The function returns byte from the array if the address is correct.

## Write functions

### `MEM_WriteInt`
Writes int value in the `address`.
```dae
func void MEM_WriteInt(var int address, var int value)
```
**Parameters**

- `#!dae var int address`  
    Memory address to write into
- `#!dae var int value`  
    Integer value to write

??? abstract "Examples"
    An example of using this function is the following Ikarus function, which turns debugging messages on and off:
    ```dae
    func void MEM_SetShowDebug(var int on)
    {
        MEM_WriteInt(showDebugAddress, on);
    };
    ```

### `MEM_WriteString`
Writes string in the `address`.
```dae
func void MEM_WriteString(var int address, var string value)
```
**Parameters**

- `#!dae var int address`  
    Memory address to write into
- `#!dae var int value`  
    String to write

### `MEM_WriteByte`
Only the byte at address `address` is changed here, not a whole four-byte word. That is, the three subsequent bytes remain untouched.
If `0 <= val < 256` does not apply in `MEM_WriteByte`, a warning is issued and val is trimmed accordingly. In particular, shouldn't be negative numbers are passed.
```dae
func void MEM_WriteByte(var int address, var int value)
```
**Parameters**

- `#!dae var int address`  
    Memory address to write into
- `#!dae var int value`  
    Byte to write

### `MEM_WriteIntArray`
Writes int value in the array at `arrayAddress`.
```dae
func void MEM_WriteIntArray(var int arrayAddress, var int offset, var int value)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)
- `#!dae var int value`  
    Integer value to write

### `MEM_WriteStringArray`
Writes string value in the array at `arrayAddress`.
```dae
func void MEM_WriteStringArray(var int arrayAddress, var int offset, var string value)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)
- `#!dae var string value`  
    String to write

### `MEM_WriteByteArray`
Writes byte value in the array at `arrayAddress`.
```dae
func void MEM_WriteByteArray(var int arrayAddress, var int offset, var int value)
```
**Parameters**

- `#!dae var int arrayAddress`  
    Memory address of array
- `#!dae var int offset`  
    Array offset (array index)
- `#!dae var int value`  
    Byte to write



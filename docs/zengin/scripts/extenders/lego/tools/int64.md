# Int64
Int64 implements basic arithmetic for 64-bit integers based on machine code (hence the function signatures are also in machine code style). Furthermore, Int64 offers the constructor int64@ for Int64 objects, but mk64 expects a pointer, not a handle.

## Dependencies
No dependencies

## Initialization
No Initialization

## Implementation
[:material-github: Int64.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Int64.d)

## Functions

### `mk64`
Writes `lo` and `hi` in one place (dest). Makes Int64, `hi` has to be `-1` for negative 32bit `lo`.
```dae
func void mk64(var int dest, var int hi, var int lo)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory.
- `#!dae var int hi`  
    High part of integer.
- `#!dae var int lo`  
    Low part of integer.

??? abstract "Examples"
    Function looks like that:
    ```dae
        func void mk64(var int dest, var int lo, var int hi) {
        MEM_WriteInt(dest, lo);
        MEM_WriteInt(dest+4, hi);
        };
    ```
    So if you want to get `9 876 543 210` low part should be set to `617 283 950` and the high part to `10`

    ```dae
    var int low; low = 617 283 950;
    var int high; high = 10;
    mk64(<memory address>, low, high);
    ```

### `neg64`
Negates the integer: `*dest <- -(*dest)`
```dae
func void neg64(var int dest)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory.

### `add64`
Adds `src` to `dest`: `*dest <- *dest + *src`
```dae
func void add64(var int dest, var int src)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `#!dae var int src`  
    A pointer to an Int64 object. Will not change.

### `sub64`
Subtracts `src` from `dest`: `*dest <- *dest - *src`
```dae
func void sub64(var int dest, var int src)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `#!dae var int src`  
    A pointer to an Int64 object. Will not change.

### `mul64`
Multiplies `dest` by `src`: `*dest <- (*dest) * (*src)`
```dae
func void mul64(var int dest, var int src)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `#!dae var int src`  
    A pointer to an Int64 object. Will not change.

### `div64`
Divides `dest` by `src`: `*dest <- *dest / *src`
```dae
func void mul64(var int dest, var int src)
```
**Parameters**

- `#!dae var int dest`  
    A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `#!dae var int src`  
    A pointer to an Int64 object. Will not change.

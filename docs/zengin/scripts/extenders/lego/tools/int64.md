---
title: Int64
description: LeGo package implementing 64 bit integer support
---
# Int64

!!! info inline end
    **Dependencies:**<br/>
    - None<br/>
    **Implementation:**<br/>
    [:material-github: Int64.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Int64.d)

Int64 implements basic arithmetic for 64-bit integers based on machine code (hence the function signatures are also in machine code style). Furthermore, Int64 offers the constructor `int64@` for Int64 objects, but mk64 expects a pointer, not a handle.

## Initialization
N/A

## Functions

### `mk64`
!!! function "`mk64`"
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
        So if you want to get `9876543210` low part should be set to `1286608618` and the high part to `2`

        ```dae
        var int ptr; ptr = MEM_Alloc(8);
        var int low; low = 1286608618;
        var int high; high = 2;
        mk64(ptr, low, high);
        // ...
        MEM_Free(ptr);
        ```

### `neg64`
!!! function "`neg64`"
    Negates the integer: `*dest <- -(*dest)`
    ```dae
    func void neg64(var int dest)
    ```
    **Parameters**

    - `#!dae var int dest`  
        A pointer to an Int64 object or just 8 bytes of free memory.

### `add64`
!!! function "`add64`"
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
!!! function "`sub64`"
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
!!! function "`mul64`"
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
!!! function "`div64`"
    Divides `dest` by `src`: `*dest <- *dest / *src`
    ```dae
    func void mul64(var int dest, var int src)
    ```
    **Parameters**

    - `#!dae var int dest`  
        A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
    - `#!dae var int src`  
        A pointer to an Int64 object. Will not change.

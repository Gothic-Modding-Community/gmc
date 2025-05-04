# Memory utility
Ikarus utility functions, for memory management and manipulation.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L1655-L1838)

## Functions

### `MEM_Alloc`
!!! function "`MEM_Alloc`"
    Allocates a specified amount of memory and returns a pointer to the allocated memory area. 

    !!! Danger 
        Gothic does not and cannot retain a reference to this memory area or release it, even when destroying the session. Therefore, memory should only be reserved under certain conditions:

        - It is guaranteed to exist and can be released again with [`MEM_Free`](#mem_free) after loading a save game.
        - Gothic is aware of this memory area and independently releases it. 

    It might be possible to create new objects with this function and permanently integrate them into the object structure of Gothic. However, extreme caution is advised, as object structures cannot be used, and manual handling is required.

    This function is well-suited for building small elements like list items and integrating them into existing lists. The memory allocated by this function is always initialized to zero.
    ```dae
    func int MEM_Alloc(var int amount)
    ```
    **Parameters**

    - `#!dae var int amount`   
        The amount of bytes to allocate

    **Return value**

    The function returns a pointer to the allocated memory area.

### `MEM_Realloc`
!!! function "`MEM_Realloc`"
    Allocates a memory area of size `newsize` and returns a pointer to this memory area. The memory area from location `ptr` is released.

    If `newsize >= oldsize`, the first `oldsize` bytes from the old memory area are transferred to the new one. The additional memory is initialized with zero.

    If `newsize <= oldsize`, all bytes of the new memory area are initialized with the corresponding values of the old memory area.

    This function is intended to create an allocated memory area enlarge or reduce. Existing data remains naturally way received. 
    ```dae
    func int MEM_Realloc(var int ptr, var int oldsize, var int newsize)
    ```
    **Parameters**

    - `#!dae var int ptr`   
        The original pointer to the memory block
    - `#!dae var int oldsize`   
        The size of the original memory block
    - `#!dae var int newsize`   
        The size of the new memory block

    **Return value**

    The function returns a pointer to the modified memory area.

### `MEM_Free`
!!! function "`MEM_Free`"
    Releases an allocated memory area. 

    !!! Danger 
        Great caution is advised, especially when attempting to destroy engine objects, as no destructors are called!

    Releasing small things such as list elements can be done easily.
    ```dae
    func void MEM_Free(var int ptr)
    ```
    **Parameters**

    - `#!dae var int ptr`   
        Pointer to the released memory block

### `MEM_Copy`
!!! function "`MEM_Copy`"
    Copies a specified number of words from the source address to the destination address.
    ```dae
    func void MEM_Copy(var int src, var int dst, var int wordcount)
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to copy from
    - `#!dae var int dst`   
        The destination address to copy to
    - `#!dae var int wordCount`   
        The number of words to copy

### `MEM_CopyWords`
!!! function "`MEM_CopyWords`"
    Alias to [`MEM_Copy`](#mem_copy). Copies a specified number of words from the source address to the destination address.
    ```dae
    func void MEM_CopyWords(var int src, var int dst, var int wordcount) 
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to copy from
    - `#!dae var int dst`   
        The destination address to copy to
    - `#!dae var int wordCount`   
        The number of words to copy

### `MEM_CopyBytes`
!!! function "`MEM_CopyBytes`"
    Copies a specified number of bytes from the source address to the destination address
    ```dae
    func void MEM_CopyBytes(var int src, var int dst, var int byteCount)
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to copy from
    - `#!dae var int dst`   
        The destination address to copy to
    - `#!dae var int byteCount`   
        The number of bytes to copy

### `MEM_Swap`
!!! function "`MEM_Swap`"
    Swaps a specified number of words between the source address and the destination address.
    ```dae
    func void MEM_Swap(var int src, var int dst, var int wordCount)
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to swap from
    - `#!dae var int dst`   
        The destination address to swap to
    - `#!dae var int wordCount`   
        The number of words to swap

### `MEM_SwapWords`
!!! function "`MEM_SwapWords`"
    Alias to [`MEM_Swap`](#mem_swap). Swaps a specified number of words between the source address and the destination address.
    ```dae
    func void MEM_SwapWords(var int src, var int dst, var int wordCount)
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to swap from
    - `#!dae var int dst`   
        The destination address to swap to
    - `#!dae var int wordCount`   
        The number of words to swap

### `MEM_SwapBytes`
!!! function "`MEM_SwapBytes`"
    Swaps a specified number of bytes between the source address and the destination address.
    ```dae
    func void MEM_SwapBytes(var int src, var int dst, var int byteCount)
    ```
    **Parameters**

    - `#!dae var int src`   
        The source address to swap from
    - `#!dae var int dst`   
        The destination address to swap to
    - `#!dae var int byteCount`   
        The number of bytes to swap

### `MEM_Clear`
!!! function "`MEM_Clear`"
    Sets a specified number of bytes in memory to zero.
    ```dae
    func void MEM_Clear(var int ptr, var int size)
    ```
    **Parameters**

    - `#!dae var int ptr`   
        The memory address to start clearing from
    - `#!dae var int size`   
        The number of bytes to clear

### `MEM_Compare`
!!! function "`MEM_Compare`"
    Compares a specified number of words between two memory blocks.
    ```dae
    func int MEM_Compare(var int ptr0, var int ptr1, var int wordCount)
    ```
    **Parameters**

    - `#!dae var int ptr0`   
        The first memory block to compare
    - `#!dae var int ptr1`   
        The second memory block to compare
    - `#!dae var int wordCount`   
        The number of words to compare

    **Return value**

    The function returns `TRUE` if the memory blocks are equal, `FALSE` is returned otherwise.

### `MEM_CompareWords`
!!! function "`MEM_CompareWords`"
    Alias to [`MEM_Compare`](#mem_compare). Compares a specified number of words between two memory blocks.
    ```dae
    func int MEM_CompareWords(var int ptr0, var int ptr1, var int wordCount)
    ```
    **Parameters**

    - `#!dae var int ptr0`   
        The first memory block to compare
    - `#!dae var int ptr1`   
        The second memory block to compare
    - `#!dae var int wordCount`   
        The number of words to compare

    **Return value**

    The function returns `TRUE` if the memory blocks are equal, `FALSE` is returned otherwise.

### `MEM_CompareBytes`
!!! function "`MEM_CompareBytes`"
    Compares a specified number of bytes between two memory blocks.
    ```dae
    func int MEM_CompareBytes(var int ptr1, var int ptr2, var int byteCount)
    ```
    **Parameters**

    - `#!dae var int ptr0`   
        The first memory block to compare
    - `#!dae var int ptr1`   
        The second memory block to compare
    - `#!dae var int wordCount`   
        The number of bytes to compare

    **Return value**

    The function returns `TRUE` if the memory blocks are equal, `FALSE` is returned otherwise.

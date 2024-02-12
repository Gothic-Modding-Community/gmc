---
title: Random
description: LeGo package providing a better alternative for a `Hlp_Random()` function
---
# Random

!!! info inline end
    **Dependencies:**<br/>
    - None<br/>
    **Implementation:**<br/>
    [:material-github: Random.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Random.d)

Provides more random randomization than `Hlp_Random()` function.

## Initialization
Initialize with `LeGo_Random` flag.
```dae
LeGo_Init(LeGo_Random);
```

## Functions

### `r_Next`
!!! function "`r_Next`"
    Returns a random number.
    ```dae
    func int r_Next()
    ```
    **Return value**

    The function returns a random number.

### `r_Max`
!!! function "`r_Max`"
    Returns a random number from 0 to `max`.
    ```dae
    func int r_Max(var int max)
    ```
    **Parameters**

    - `#!dae var int max`  
        Maximum value of number

    **Return value**

    The function returns a random number from 0 to 'max'.

### `r_MinMax`
!!! function "`r_MinMax`"
    Returns a random number from 'min' to 'max'.
    ```dae
    func int r_MinMax(var int min, var int max)
    ```
    **Parameters**

    - `#!dae var int max`  
        Maximum value of number
    - `#!dae var int min`  
        Minimum value of number

    **Return value**

    The function returns a random number from `min` to `max`.

### `r_Init`
!!! function "`r_Init`"
    Initializes the random number generator. Happens optionally in `LeGo_Init`.
    ```dae
    func void r_Init(var int seed)
    ```
    **Parameters**

    - `#!dae var int seed`  
        The initializing value

### `r_DefaultInit`
!!! function "`r_DefaultInit`"
    Initializes the random number generator based on the current time.
    ```dae
    func void r_DefaultInit()
    ```

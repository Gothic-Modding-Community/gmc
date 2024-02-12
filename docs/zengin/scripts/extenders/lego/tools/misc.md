---
title: Misc
description: LeGo package implementing various helper functions
---
# Misc

!!! info inline end
    **Dependencies:**<br/>
    - [Floats](../../ikarus/floats.md)<br/>
    **Implementation:**<br/>
    [:material-github: Misc.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

The Misc package introduces various helper functions that did not fit into any other package.

## Initialization  
N/A

## Constants
Misc package implements the `phi` constant
```dae
const int phi = 1070141312; // PI/2
```
which is actually `pi` divided by 2 saved as an ikarus float. 

Decimal: `1.5707...`

## Functions

### `atan2f`
!!! function "`atan2f`"
    Calculates the arcus tangent of an angle between the origin and (x, y) point.
    ```dae
    func int atan2f(var int x, var int y)
    ```
    **Parameters**

    - `#!dae var int x`  
        X-coordinate
    - `#!dae var int y`  
        Y-coordinate

    **Return value**

    The function returns arcus tangent in radians as Ikarus `float`.

### `sin`
!!! function "`sin`"
    Calculates the sine of an angle given in radians.
    ```dae
    func int sin(var int angle)
    ```
    **Parameters**

    - `#!dae var int angle`  
        The angle in radians as a Ikarus `float`

    **Return value**

    The function returns sine of the angle as Ikarus `float`.

### `cos`
!!! function "`cos`"
    Calculates the cosine of an angle given in radians.
    ```dae
    func int cos(var int angle)
    ```
    **Parameters**

    - `#!dae var int angle`  
        The angle in radians as a Ikarus `float`

    **Return value**

    The function returns cosine of the angle as Ikarus `float`.

### `tan`
!!! function "`tan`"
    Calculates the tangent of an angle given in radians.
    ```dae
    func int tan(var int angle)
    ```
    **Parameters**

    - `#!dae var int angle`  
        The angle in radians as a Ikarus `float`

    **Return value**

    The function returns tangent of the angle as Ikarus `float`.

### `asin`
!!! function "`asin`"
    Calculates the arcus sine.
    ```dae
    func int asin(var int sine)
    ```
    **Parameters**

    - `#!dae var int sine`  
        The sine of an angle as a Ikarus `float`

    **Return value**

    The function returns arcus sine of the angle as Ikarus `float`.

### `acos`
!!! function "`acos`"
    Calculates the arcus cosine
    ```dae
    func int acos(var int cosine)
    ```
    **Parameters**

    - `#!dae var int cosine`  
        The cosine of an angle as a Ikarus `float`

    **Return value**

    The function returns arcus cosine of the angle as Ikarus `float`.

### `distance2D`
!!! function "`distance2D`"
    Calculates the distance between two points on a two-dimensional plane.
    ```dae
    func int distance2D(var int x1, var int x2, var int y1, var int y2)
    ```
    **Parameters**

    - `#!dae var int x1`  
        X-coordinate of the first point
    - `#!dae var int x2`  
        X-coordinate of the second point
    - `#!dae var int y1`  
        Y-coordinate of the first point
    - `#!dae var int y2`  
        Y-coordinate of the second point

    **Return value**

    The function returns the distance between the two points.

### `distance2Df`
!!! function "`distance2Df`"
    Calculates the distance between two points on a two-dimensional plane but parameters and return values are Ikarus `floats`.
    ```dae
    func int distance2Df(var int x1, var int x2, var int y1, var int y2)
    ```
    **Parameters**

    - `#!dae var int x1`  
        X-coordinate of the first point
    - `#!dae var int x2`  
        X-coordinate of the second point
    - `#!dae var int y1`  
        Y-coordinate of the first point
    - `#!dae var int y2`  
        Y-coordinate of the second point

    **Return value**

    The function returns the distance between the two points as Ikarus `float`.

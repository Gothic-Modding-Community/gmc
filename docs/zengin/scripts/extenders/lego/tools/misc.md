# Misc

The Misc package introduces various helper functions that did not fit into any other package.

## Dependencies  
N/A

## Initialization  
N/A

## Implementation
[:material-github: Misc.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

## Functions

### `atan2f`
Calculates the arcus tangent of an angle between the origin and (x, y) point.
```dae
func float atan2f(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    X-coordinate
- `#!dae var int y`  
    Y-coordinate

**Return value**

The function returns arcus tangent in radians as Ikarus `float`.

### `sin`
Calculates the sine of an angle given in radians.
```dae
func float sin(var float angle)
```
**Parameters**

- `#!dae var float angle`  
    The angle in radians as a Ikarus `float`

**Return value**

The function returns sine of the angle.

### `cos`
Calculates the cosine of an angle given in radians.
```dae
func float cos(var float angle)
```
**Parameters**

- `#!dae var float angle`  
    The angle in radians as a Ikarus `float`

**Return value**

The function returns cosine of the angle.


### `tan`
Calculates the tangent of an angle given in radians.
```dae
func float tan(var float angle)
```
**Parameters**

- `#!dae var float angle`  
    The angle in radians as a Ikarus `float`

**Return value**

The function returns tangent of the angle.

### `asin`
Calculates the arcus sine
```dae
func float asin(var float sine)
```
**Parameters**

- `#!dae var float sine`  
    The sine of an angle as a Ikarus `float`

**Return value**

The function returns arcus sine of the angle.

### `acos`
Calculates the arcus cosine
```dae
func float acos(var float cosine)
```
**Parameters**

- `#!dae var float cosine`  
    The cosine of an angle as a Ikarus `float`

**Return value**

The function returns arcus cosine of the angle.


### `distance2D`
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
Calculates the distance between two points on a two-dimensional plane but parameters and return values are Ikarus `floats`.
```dae
func float distance2Df(var float x1, var float x2, var float y1, var float y2)
```
**Parameters**

- `#!dae var float x1`  
    X-coordinate of the first point
- `#!dae var float x2`  
    X-coordinate of the second point
- `#!dae var float y1`  
    Y-coordinate of the first point
- `#!dae var float y2`  
    Y-coordinate of the second point

**Return value**

The function returns the distance between the two points as Ikarus `float`.


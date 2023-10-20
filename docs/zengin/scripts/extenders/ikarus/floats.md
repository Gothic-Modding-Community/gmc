# Floats
This part of ikarus implements support for 32 bit IEEE 754 floats in Daedalus. The script was originally created to edit `zFLOAT` and `zREAL` variables, but can also be used to arthmetic operations on real float values (not to be confused with Daedalus floats).

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: float.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/float.d)

## Functions
!!! Danger
    Ikarus floats are saved as int but it doesn't mean that you can use arthmetic operators on them. All operations on floats must be done with functions listed below.

### `mkf`
(make float) Converts the input integer x to a float value.
```dae
func int mkf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input integer

**Return value**

The function returns the float representation of the input integer x.

### `truncf`
(truncate float) Truncates the decimal part of the input float x.
```dae
func int truncf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the integer part of the input float x by discarding the decimal part.

### `roundf`
(round float) Rounds the input float x to the nearest integer value.
```dae
func int roundf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the nearest integer value to the input float x. If the decimal part is exactly halfway between two integers, the function rounds to the nearest even integer.

### `addf`
(add floats) Adds two ikarus floats together.
```dae
func int addf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns the sum of the input floats `x` and `y`. (x + y)

### `subf`
(subtract floats) Subtracts the second float from the first float.
```dae
func int subf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns the difference between the first float `x` and the second float `y`. (x - y)

### `negf`
(negate float) Negates the input float.
```dae
func int negf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the negation of the input float `x`.

### `mulf`
(multiply floats) Multiplies two ikarus floats.
```dae
func int mulf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns the product of multiplying the input floats x and y. (x * y)

### `divf`
(divide floats) Divides two ikarus floats.
```dae
func int divf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The dividend float
- `#!dae var int y`  
    The divisor float

**Return value**

The function returns the quotient of dividing the input float x by y. (x / y)

### `invf`
(inverse float) Computes the inverse of the input float.
```dae
func int invf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the inverse of the `x`, calculated as `1/x`.

### `gf`
(greater) Checks if the first float is greater than the second float.
```dae
func int gf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float



**Return value**

The function returns `TRUE` if `x` is greater than `y`, `FALSE` is returned otherwise.

### `gef`
(greater or equal) Checks if the first float is greater than or equal to the second float.
```dae
func int gef(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns `TRUE` if `x` is greater than or equal to `y`, `FALSE` is returned otherwise.

### `lf`
(lower) Checks if the first float is less than the second float.
```dae
func int lf(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns `TRUE` if `x` is less than `y`, `FALSE` is returned otherwise.

### `lef`
(lower or equal) Checks if the first float is less than or equal to the second float.
```dae
func int lef(var int x, var int y)
```
**Parameters**

- `#!dae var int x`  
    The first float
- `#!dae var int y`  
    The second float

**Return value**

The function returns `TRUE` if `x` is less than or equal to `y`, `FALSE` is returned otherwise.

### `sqrf`
(square float) Calculates the square of the float.
```dae
func int sqrf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the square of the input float `x`, computed as `x * x`.

### `sqrtf`
(square root float) Calculates the square root of the float.
```dae
func int sqrtf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the square root of the input float `x`.

### `sqrtf_approx`
Calculates the approximate square root of a float.
```dae
func int sqrtf_approx(var int f)
```
**Parameters**

- `#!dae var int f`  
    The input float

**Return value**

The function returns the approximate square root of the input float as an ikarus float.

### `absf`
(absolute value) Computes the absolute value of a float.
```dae
func int absf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The input float

**Return value**

The function returns the absolute value of the input float `x`, which is the value without the negative sign (if present).

### `fracf`
(fraction) Computes the fraction of two integers p and q.
```dae
func int fracf(var int p, var int q)
```
**Parameters**

- `#!dae var int p`  
    Numerator
- `#!dae var int q`  
    Denominator

**Return value**

The function returns the fraction of `p` divided by `q` as an ikarus float.

### `castFromIntf`
Converts an ikarus float to a Daedalus float.
```dae
func float castFromIntf(var int f)
```
**Parameters**

- `#!dae var int f`  
    Ikarus float

**Return Value**

The function returns the value `f` as a Daedalus float.

### `castToIntf`
Converts a Daedalus float to an ikarus float.
```dae
func int castToIntf(var float f)
```
**Parameters**

- `#!dae var float f`  
    Daedalus float

**Return Value**

The function returns the value `f` as an ikarus float.

### `toStringf`
Converts a float value to its string representation.
```dae
func string toStringf(var int x)
```
**Parameters**

- `#!dae var int x`  
    Input float value

**Return value**

The function returns a string representation of the input float value.

### `printf`
(print float) Prints the float on screen using `Print()`.
```dae
func void printf(var int x)
```
**Parameters**

- `#!dae var int x`  
    The printed float

## Examples

### Simple operations
```dae
var int float1 = mkf(5);        // Create an Ikarus float with value 5
var int float2 = mkf(2);        // Create an Ikarus float with value 2

var int addResult = addf(float1, float2);     // Add float1 and float2
var int subResult = subf(float1, float2);     // Subtract float2 from float1
var int mulResult = mulf(float1, float2);     // Multiply float1 by float2
var int divResult = divf(float1, float2);     // Divide float1 by float2

printf(addResult);   // Output: 7
printf(subResult);   // Output: 3
printf(mulResult);   // Output: 10
printf(divResult);   // Output: 2.5
```
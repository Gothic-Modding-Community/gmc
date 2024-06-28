---
title: Sprite
description: LeGo package implementing functions for working with sprites
---

# Sprite

!!! info inline end
    **Dependencies:**<br/>
    - [PermMem](permmem.md)<br/>
    **Implementation:**<br/>
    [:material-github: Sprite.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Sprite.d)

Sprite package implements functions for working with 2D sprites.

## Initialization
Initialize with `LeGo_Sprite` flag.
```dae
LeGo_Init(LeGo_Sprite);
```

## Functions

### `Sprite_Create`
!!! function "`Sprite_Create`"
    Creates a sprite. The dimensions are in virtual coordinates.
    ```dae
    func int Sprite_Create(var int x, var int y, var int width, var int height, var int color, var string tex)
    ```
    **Parameters**

    - `#!dae var int x`  
        X position of sprite (virtual)
    - `#!dae var int y`  
        Y position of sprite (virtual)
    - `#!dae var int width`  
        Width of sprite (virtual)
    - `#!dae var int height`  
        Height of sprite (virtual)
    - `#!dae var int color`  
        Color of sprite (in [RGBA](interface.md#rgba) format)
    - `#!dae var string tex`  
        Name of the sprite texture

    **Return value**
        
    The function returns the handle of the created sprite.

### `Sprite_CreatePxl`
!!! function "`Sprite_CreatePxl`"
    Creates a sprite. The dimensions are in pixels.
    ```dae
    func int Sprite_CreatePxl(var int x, var int y, var int width, var int height, var int color, var string tex)
    ```
    **Parameters**

    - `#!dae var int x`  
        X position of sprite (pixels)
    - `#!dae var int y`  
        Y position of sprite (pixels)
    - `#!dae var int width`  
        Width of sprite (pixels)
    - `#!dae var int height`  
        Height of sprite (pixels)
    - `#!dae var int color`  
        Color of sprite (in [RGBA](interface.md#rgba) format)
    - `#!dae var string tex`  
        Name of the sprite texture

    **Return value**
        
    The function returns the handle of the created sprite.

### `Sprite_Render`
!!! function "`Sprite_Render`"
    Renders a sprite on a screen (must be visible first).
    ```dae
    func void Sprite_Render(var int h)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite

### `Sprite_SetVisible`
!!! function "`Sprite_SetVisible`"
    Sets the visibility of a sprite.
    ```dae
    func void Sprite_SetVisible(var int h, var int visible)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int visible`  
        Visibility flag (0 for invisible, 1 for visible)

### `Sprite_SetPrio`
!!! function "`Sprite_SetPrio`"
    Sets the priority of a sprite. The higher the priority, the closer the sprite is to the camera.
    ```dae
    func void Sprite_SetPrio(var int h, var int prio)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int prio`  
        Priority of the sprite

### `Sprite_Scale`
!!! function "`Sprite_Scale`"
    Scales a sprite.
    ```dae
    func void Sprite_Scale(var int h, var int x, var int y)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int x`  
        X scale factor (as ikarus float)
    - `#!dae var int y`  
        Y scale factor (as ikarus float)

### `Sprite_SetWidth`
!!! function "`Sprite_SetWidth`"
    Sets the width of a sprite in virtual coordinates.
    ```dae
    func void Sprite_SetWidth(var int h, var int w)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int w`  
        Width of the sprite in virtual coordinates

### `Sprite_SetWidthPxl`
!!! function "`Sprite_SetWidthPxl`"
    Sets the width of a sprite in pixels.
    ```dae
    func void Sprite_SetWidthPxl(var int h, var int w)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int w`  
        Width of the sprite in pixels

### `Sprite_SetHeight`
!!! function "`Sprite_SetHeight`"
    Sets the height of a sprite in virtual coordinates.
    ```dae
    func void Sprite_SetHeight(var int h, var int hg)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int hg`  
        Height of the sprite in virtual coordinates

### `Sprite_SetHeightPxl`
!!! function "`Sprite_SetHeightPxl`"
    Sets the height of a sprite in pixels.
    ```dae
    func void Sprite_SetHeightPxl(var int h, var int hg)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int hg`  
        Height of the sprite in pixels


### `Sprite_SetDim`
!!! function "`Sprite_SetDim`"
    Sets the dimensions of a sprite in virtual coordinates.
    ```dae
    func void Sprite_SetDim(var int h, var int w, var int hg)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int w`  
        Width of the sprite in virtual coordinates
    - `#!dae var int hg`  
        Height of the sprite in virtual coordinates

### `Sprite_SetDimPxl`
!!! function "`Sprite_SetDimPxl`"
    Sets the dimensions of a sprite in pixels.
    ```dae
    func void Sprite_SetDimPxl(var int h, var int w, var int hg)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int w`  
        Width of the sprite in pixels
    - `#!dae var int hg`  
        Height of the sprite in pixels

### `Sprite_SetPos`
!!! function "`Sprite_SetPos`"
    Sets the position of a sprite in virtual coordinates.
    ```dae
    func void Sprite_SetPos(var int h, var int x, var int y)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int x`  
        X position of the sprite (virtual)
    - `#!dae var int y`  
        Y position of the sprite (virtual)

### `Sprite_SetPosPxl`
!!! function "`Sprite_SetPosPxl`"
    Sets the position of a sprite in pixels.
    ```dae
    func void Sprite_SetPosPxl(var int h, var int x, var int y)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int x`  
        X position of the sprite (pixels)
    - `#!dae var int y`  
        Y position of the sprite (pixels)

### `Sprite_SetPosPxlF`
!!! function "`Sprite_SetPosPxlF`"
    Sets the position of a sprite in pixels (floating point).
    ```dae
    func void Sprite_SetPosPxlF(var int h, var int xf, var int yf)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int xf`  
        X position of the sprite (pixels but as a float)
    - `#!dae var int yf`  
        Y position of the sprite (pixels but as a float)

### `Sprite_SetColor`
!!! function "`Sprite_SetColor`"
    Sets the color of a sprite.
    ```dae
    func void Sprite_SetColor(var int h, var int col)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int col`  
        Color of the sprite (in [RGBA](interface.md#rgba) format)

### `Sprite_SetVertColor`
!!! function "`Sprite_SetVertColor`"
    Sets the color of a vertex in a sprite.
    ```dae
    func void Sprite_SetVertColor(var int h, var int vert, var int col)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int vert`  
        Index of the vertex (0-3)
    - `#!dae var int col`  
        Color of the vertex (in [RGBA](interface.md#rgba) format)

### `Sprite_SetUV`
!!! function "`Sprite_SetUV`"
    Sets the UV coordinates of a sprite.
    ```dae
    func void Sprite_SetUV(var int h, var int x0, var int y0, var int x1, var int y1)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int x0`  
        X coordinate of the top-left UV
    - `#!dae var int y0`  
        Y coordinate of the top-left UV
    - `#!dae var int x1`  
        X coordinate of the bottom-right UV
    - `#!dae var int y1`  
        Y coordinate of the bottom-right UV

### `Sprite_SetVertUV`
!!! function "`Sprite_SetVertUV`"
    Sets the UV coordinates of a vertex in a sprite.
    ```dae
    func void Sprite_SetVertUV(var int h, var int vert, var int x, var int y)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int vert`  
        Index of the vertex (0-3)
    - `#!dae var int x`  
        X coordinate of the UV
    - `#!dae var int y`  
        Y coordinate of the UV

### `Sprite_Rotate`
!!! function "`Sprite_Rotate`"
    Rotates a sprite by a given angle in degrees.
    ```dae
    func void Sprite_Rotate(var int h, var int r)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int r`  
        Rotation angle in degrees


### `Sprite_RotateR`
!!! function "`Sprite_RotateR`"
    Rotates a sprite by a given angle in radians.
    ```dae
    func void Sprite_RotateR(var int h, var int r)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int r`  
        Rotation angle in radians

### `Sprite_SetRotation`
!!! function "`Sprite_SetRotation`"
    Sets the rotation of a sprite in degrees.
    ```dae
    func void Sprite_SetRotation(var int h, var int r)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int r`  
        Rotation angle in degrees

### `Sprite_SetRotationR`
!!! function "`Sprite_SetRotationR`"
    Sets the rotation of a sprite in radians.
    ```dae
    func void Sprite_SetRotationR(var int h, var int r)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int r`  
        Rotation angle in radians

### `Sprite_SetRotationSC`
!!! function "`Sprite_SetRotationSC`"
    Sets the rotation of a sprite using sine and cosine values.
    ```dae
    func void Sprite_SetRotationSC(var int h, var int sin, var int cos)
    ```
    **Parameters**

    - `#!dae var int h`  
        Handle of the sprite
    - `#!dae var int sin`  
        Sine value of the rotation
    - `#!dae var int cos`  
        Cosine value of the rotation

## Helper functions

### `SinCosApprox`
!!! function "`SinCosApprox`"
    Approximates sine and cosine values for a given angle. Keeps them in `#!dae var int sinApprox` `#!dae var int cosApprox;` variables.
    ```dae
    func void SinCosApprox(var int angle)
    ```
    **Parameters**

    - `#!dae var int angle`  
        Angle in degrees
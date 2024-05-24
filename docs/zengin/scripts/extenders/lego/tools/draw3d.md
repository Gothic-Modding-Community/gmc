---
title: Draw3D
description: LeGo package for drawing different 3d shapes
---
# Draw3D

!!! info inline end
    **Dependencies:**<br/>
    - [PermMem](permmem.md)<br/>
    - [HookEngine](hook_engine.md)<br/>
    **Implementation:**<br/>
    [:material-github: Draw3D.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Draw3D.d)

This package allows you to draw various shapes (such as lines or bounding boxes) in three-dimensional space. This makes debugging visualizations of coordinates in the world possible. 

## Initialization
Initialize with `LeGo_Draw3D` flag.
```dae
LeGo_Init(LeGo_Draw3D);
```

## Functions

### Line

#### `DrawLine`
!!! function "`DrawLine`"
    Creates and draws a new line and returns its handle.
    ```dae
    func int DrawLine(var int startPosPtr, var int endPosPtr, var int color)
    ```
    **Parameters**

    - `#!dae var int startPosPtr`  
        Pointer to the float array with world coordinates of the starting point of the line
    - `#!dae var int endPosPtr`  
        Pointer to the float array with world coordinates of the ending point of the line
    - `#!dae var int color`  
        Color of the line as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the line.

#### `DrawLine3`
!!! function "`DrawLine3`"
    [`DrawLine`](#drawline), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func int DrawLine3(var int x1, var int y1, var int z1,var int x2, var int y2, var int z2,var int color)
    ```
    **Parameters**

    - `#!dae var int x1, y1, z1`  
        X, Y, and Z coordinates of the starting point of the line
    - `#!dae var int x2, y2, z2`  
        X, Y, and Z coordinates of the ending point of the line
    - `#!dae var int color`  
        Color of the line as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the line.

#### `DrawLineAddr`
!!! function "`DrawLineAddr`"
    [`DrawLine`](#drawline), but with the address of a line as parameter.
    ```dae
    func int DrawLineAddr(var int linePtr, var int color)
    ```
    **Parameters**

    - `#!dae var int linePtr`  
        Pointer to the float array array with six values (startAndEndPos[6])
    - `#!dae var int color`  
        Color of the line as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the line.

#### `UpdateLine`
!!! function "`UpdateLine`"
    Changes the coordinates of a specific line.
    ```dae
    func void UpdateLine(var int hndl, var int startPosPtr, var int endPosPtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)
    - `#!dae var int startPosPtr`  
        Pointer to an integer float array with world coordinates of the starting point of the line
    - `#!dae var int endPosPtr`  
        Pointer to an integer float array with world coordinates of the ending point of the line

#### `UpdateLine3`
!!! function "`UpdateLine3`"
    [`UpdateLine`](#updateline), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func void UpdateLine3(var int hndl,var int x1, var int y1, var int z1,var int x2, var int y2, var int z2)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)
    - `#!dae var int x1, y1, z1`  
        X, Y, and Z coordinates of the starting point of the line
    - `#!dae var int x2, y2, z2`  
        X, Y, and Z coordinates of the ending point of the line

#### `UpdateLineAddr`
!!! function "`UpdateLineAddr`"
    [`UpdateLine`](#updateline), but with the address of a line as parameter.
    ```dae
    func void UpdateLineAddr(var int hndl, var int linePtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)
    - `#!dae var int linePtr`  
        Pointer to an integer float array with six values (startAndEndPos[6])

#### `SetLineColor`
!!! function "`SetLineColor`"
    Changes the color of a specific line.
    ```dae
    func void SetLineColor(var int hndl, var int color)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)
    - `#!dae var int color`  
        New color of the line as [`zCOLOR`](interface.md#rgba)

#### `EraseLine`
!!! function "`EraseLine`"
    Deletes a line from the world and the handle.
    ```dae
    func void EraseLine(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)

#### `LineVisible`
!!! function "`LineVisible`"
    Returns whether a line is visible.
    ```dae
    func int LineVisible(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)

    **Return value**

    The function returns `TRUE` if the line is visible/displayed. `FALSE` is returned otherwise.

#### `ShowLine`
!!! function "`ShowLine`"
    Displays the line.
    ```dae
    func void ShowLine(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)

#### `HideLine`
!!! function "`HideLine`"
    Hides the line.
    ```dae
    func void HideLine(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)

#### `ToggleLine`
!!! function "`ToggleLine`"
    Changes the visibility of a line. If displayed - hide, if hidden - display.
    ```dae
    func void ToggleLine(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawLine`](#drawline)

### Sphere

#### `DrawSphere`
!!! function "`DrawSphere`"
    Creates and draws a new sphere (visualized as a circle) and returns its handle.
    ```dae
    func int DrawSphere(var int centerPosPtr, var int radius, var int color)
    ```
    **Parameters**

    - `#!dae var int centerPosPtr`  
        Pointer to an integer float array with world coordinates of the sphere's center (`centerPos[3]`)
    - `#!dae var int radius`  
        Radius of the sphere as an integer float
    - `#!dae var int color`  
        Color of the sphere as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the sphere.

#### `DrawSphere3`
!!! function "`DrawSphere3`"
    [`DrawSphere`](#drawsphere), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func int DrawSphere3(var int x1, var int y1, var int z1, var int radius, var int color)
    ```
    **Parameters**

    - `#!dae var int x1, y1, z1`  
        World coordinates of the sphere's center
    - `#!dae var int radius`  
        Radius of the sphere as an integer float
    - `#!dae var int color`  
        Color of the sphere as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the sphere.

#### `DrawSphereAddr`
!!! function "`DrawSphereAddr`"
    [`DrawSphere`](#drawsphere), but with the address of a sphere as a parameter.
    ```dae
    func int DrawSphereAddr(var int spherePtr, var int color)
    ```
    **Parameters**

    - `#!dae var int spherePtr`  
        Pointer to a `zTBSphere3D` structure
    - `#!dae var int color`  
        Color of the sphere as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the sphere.

#### `UpdateSphere`
!!! function "`UpdateSphere`"
    Changes the coordinates and/or size of an existing sphere.
    ```dae
    func void UpdateSphere(var int hndl, var int centerPosPtr, var int radius)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)
    - `#!dae var int centerPosPtr`  
        Pointer to an integer float array with world coordinates of the sphere's center (`centerPos[3]`)
    - `#!dae var int radius`  
        Radius of the sphere as an integer float

#### `UpdateSphere3`
!!! function "`UpdateSphere3`"
    [`UpdateSphere`](#updatesphere), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func void UpdateSphere3(var int hndl, var int x1, var int y1, var int z1, var int radius)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)
    - `#!dae var int x1, y1, z1`  
        World coordinates of the sphere's center
    - `#!dae var int radius`  
        Radius of the sphere as an integer float

#### `UpdateSphereAddr`
!!! function "`UpdateSphereAddr`"
    [`UpdateSphere`](#updatesphere), but with the address of a sphere as a parameter.
    ```dae
    func void UpdateSphereAddr(var int hndl, var int spherePtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)
    - `#!dae var int spherePtr`  
        Pointer to a `zTBSphere3D` structure

#### `SetSphereColor`
!!! function "`SetSphereColor`"
    Changes the color of a specific sphere.
    ```dae
    func void SetSphereColor(var int hndl, var int color)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)
    - `#!dae var int color`  
        New color of the sphere as [`zCOLOR`](interface.md#rgba)

#### `EraseSphere`
!!! function "`EraseSphere`"
    Deletes a sphere from the world and its handle.
    ```dae
    func void EraseSphere(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)

#### `SphereVisible`
!!! function "`SphereVisible`"
    Returns whether a sphere is visible.
    ```dae
    func int SphereVisible(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)

    **Return value**

    The function returns `TRUE` if the sphere is visible/displayed. `FALSE` is returned otherwise.

#### `ShowSphere`
!!! function "`ShowSphere`"
    Displays the sphere.
    ```dae
    func void ShowSphere(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)

#### `HideSphere`
!!! function "`HideSphere`"
    Hides the sphere.
    ```dae
    func void HideSphere(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)

#### `ToggleSphere`
!!! function "`ToggleSphere`"
    Changes the visibility of a sphere. If displayed - hide, if hidden - display.
    ```dae
    func void ToggleSphere(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawSphere`](#drawsphere)

### Bounding Box

#### `DrawBBox`
!!! function "`DrawBBox`"
    Creates and draws a new bounding box and returns its handle.
    ```dae
    func int DrawBBox(var int startPosPtr, var int endPosPtr, var int color)
    ```
    **Parameters**

    - `#!dae var int startPosPtr`  
        Pointer to an integer float array with world coordinates of the bounding box's first point (`startPos[3]`)
    - `#!dae var int endPosPtr`  
        Pointer to an integer float array with world coordinates of the bounding box's second point (`endPos[3]`)
    - `#!dae var int color`  
        Color of the bounding box as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the bounding box.

#### `DrawBBox3`
!!! function "`DrawBBox3`"
    [`DrawBBox`](#drawbbox), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func int DrawBBox3(var int x1, var int y1, var int z1, var int x2, var int y2, var int z2, var int color)
    ```
    **Parameters**

    - `#!dae var int x1, y1, z1`  
        World coordinates of the bounding box's first point
    - `#!dae var int x2, y2, z2`  
        World coordinates of the bounding box's second point
    - `#!dae var int color`  
        Color of the bounding box as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the bounding box.

#### `DrawBBoxAddr`
!!! function "`DrawBBoxAddr`"
    [`DrawBBox`](#drawbbox), but with the address of a bounding box as a parameter.
    ```dae
    func int DrawBBoxAddr(var int bboxPtr, var int color)
    ```
    **Parameters**

    - `#!dae var int bboxPtr`  
        Pointer to an integer float array with six values (startAndEndPos[6])
    - `#!dae var int color`  
        Color of the bounding box as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the bounding box.

#### `UpdateBBox`
!!! function "`UpdateBBox`"
    Changes the coordinates of an existing bounding box.
    ```dae
    func void UpdateBBox(var int hndl, var int startPosPtr, var int endPosPtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)
    - `#!dae var int startPosPtr`  
        Pointer to an integer float array with world coordinates of the bounding box's first point (`startPos[3]`)
    - `#!dae var int endPosPtr`  
        Pointer to an integer float array with world coordinates of the bounding box's second point (`endPos[3]`)

#### `UpdateBBox3`
!!! function "`UpdateBBox3`"
    [`UpdateBBox`](#updatebbox), but with world coordinates as parameters, instead of `zVEC3` pointers.
    ```dae
    func void UpdateBBox3(var int hndl, var int x1, var int y1, var int z1, var int x2, var int y2, var int z2)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)
    - `#!dae var int x1, y1, z1`  
        World coordinates of the bounding box's first point
    - `#!dae var int x2, y2, z2`  
        World coordinates of the bounding box's second point

#### `UpdateBBoxAddr`
!!! function "`UpdateBBoxAddr`"
    [`UpdateBBox`](#updatebbox), but with the address of a bounding box as a parameter.
    ```dae
    func void UpdateBBoxAddr(var int hndl, var int bboxPtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)
    - `#!dae var int bboxPtr`  
        Pointer to an integer float array with six values (startAndEndPos[6])

#### `SetBBoxColor`
!!! function "`SetBBoxColor`"
    Changes the color of a specific bounding box.
    ```dae
    func void SetBBoxColor(var int hndl, var int color)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)
    - `#!dae var int color`  
        New color of the bounding box as [`zCOLOR`](interface.md#rgba)

#### `EraseBBox`
!!! function "`EraseBBox`"
    Deletes a bounding box from the world and its handle.
    ```dae
    func void EraseBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)

#### `BBoxVisible`
!!! function "`BBoxVisible`"
    Returns whether a bounding box is visible.
    ```dae
    func int BBoxVisible(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)

    **Return value**

    The function returns `TRUE` if the bounding box is visible/displayed. `FALSE` is returned otherwise.

#### `ShowBBox`
!!! function "`ShowBBox`"
    Displays the bounding box.
    ```dae
    func void ShowBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)

#### `HideBBox`
!!! function "`HideBBox`"
    Hides the bounding box.
    ```dae
    func void HideBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)

#### `ToggleBBox`
!!! function "`ToggleBBox`"
    Changes the visibility of a bounding box. If displayed - hide, if hidden - display.
    ```dae
    func void ToggleBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawBBox`](#drawbbox)

### Oriented Bounding Box

#### `DrawOBBoxAddr`
!!! function "`DrawOBBoxAddr`"
    Creates and draws a new oriented bounding box based on the address of an oriented bounding box and returns its handle.
    ```dae
    func int DrawOBBoxAddr(var int oBBoxPtr, var int color)
    ```
    **Parameters**

    - `#!dae var int oBBoxPtr`  
        Pointer to a `zCOBBox3D` structure
    - `#!dae var int color`  
        Color of the oriented bounding box as [`zCOLOR`](interface.md#rgba)

    **Return value**

    The function returns a new [PermMem](permmem.md) handle to the oriented bounding box.

#### `UpdateOBBoxAddr`
!!! function "`UpdateOBBoxAddr`"
    Changes the coordinates and orientation of an existing oriented bounding box.
    ```dae
    func void UpdateOBBoxAddr(var int hndl, var int oBBoxPtr)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)
    - `#!dae var int oBBoxPtr`  
        Pointer to a `zCOBBox3D` structure

#### `SetOBBoxColor`
!!! function "`SetOBBoxColor`"
    Changes the color of a specific oriented bounding box.
    ```dae
    func void SetOBBoxColor(var int hndl, var int color)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)
    - `#!dae var int color`  
        New color of the oriented bounding box as [`zCOLOR`](interface.md#rgba)

#### `EraseOBBox`
!!! function "`EraseOBBox`"
    Deletes an oriented bounding box from the world and its handle.
    ```dae
    func void EraseOBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)

#### `OBBoxVisible`
!!! function "`OBBoxVisible`"
    Returns whether an oriented bounding box is visible.
    ```dae
    func int OBBoxVisible(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)

    **Return value**

    The function returns `TRUE` if the oriented bounding box is visible/displayed. `FALSE` is returned otherwise.

#### `ShowOBBox`
!!! function "`ShowOBBox`"
    Displays the oriented bounding box.
    ```dae
    func void ShowOBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)

#### `HideOBBox`
!!! function "`HideOBBox`"
    Hides the oriented bounding box.
    ```dae
    func void HideOBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)

#### `ToggleOBBox`
!!! function "`ToggleOBBox`"
    Changes the visibility of an oriented bounding box. If displayed - hide, if hidden - display.
    ```dae
    func void ToggleOBBox(var int hndl)
    ```
    **Parameters**

    - `#!dae var int hndl`  
        Handle returned from [`DrawOBBoxAddr`](#drawobboxaddr)



### `EraseAll`
!!! function "`EraseAll`"
    Deletes all draw elements and their handles from the world.
    ```dae
    func void EraseAll()
    ```

## Examples

World coordinates are not particularly informative. This package aims to help and allows visualizing world coordinates in the form of lines, spheres (as circles), bounding boxes, and oriented bounding boxes in three-dimensional space.

### Visualizing Straight Line to an NPC

To draw a line between two NPCs, you only need the coordinates of the two NPCs.

```dae
func void Example_1() {
    var zCVob her; her = Hlp_GetNpc(hero);
    var int point1[3];
    point1[0] = her.trafoObjToWorld[3];
    point1[1] = her.trafoObjToWorld[7];
    point1[2] = her.trafoObjToWorld[11];

    var zCVob oth; oth = Hlp_GetNpc(PC_ThiefOW);
    var int point2[3];
    point2[0] = oth.trafoObjToWorld[3];
    point2[1] = oth.trafoObjToWorld[7];
    point2[2] = oth.trafoObjToWorld[11];

    var int hndl;

    if (!Hlp_IsValidHandle(hndl)) {
        hndl = DrawLine(_@(point1), _@(point2), zCOLOR_GREEN);
    } else {
        UpdateLine(hndl, _@(point1), _@(point2));
    };
};
```

This function can now be called continuously using `FrameFunction` to continuously adjust the straight line according to the positions of the characters.

```dae
FF_Apply(Example_1);
```

Alternatively, you can write the function as follows:

```dae
func void Example_1() {
    var zCVob her; her = Hlp_GetNpc(hero);
    var zCVob oth; oth = Hlp_GetNpc(PC_ThiefOW);

    var int hndl;

    if (!Hlp_IsValidHandle(hndl)) {
        hndl = DrawLine3(her.trafoObjToWorld[3], her.trafoObjToWorld[7], her.trafoObjToWorld[11],
                         oth.trafoObjToWorld[3], oth.trafoObjToWorld[7], oth.trafoObjToWorld[11],
                         zCOLOR_GREEN);
    } else {
        UpdateLine3(hndl, her.trafoObjToWorld[3], her.trafoObjToWorld[7], her.trafoObjToWorld[11],
                          oth.trafoObjToWorld[3], oth.trafoObjToWorld[7], oth.trafoObjToWorld[11]);
    };
};
```

### Visualizing a Distance of 5 Meters

It becomes more interesting when dealing with "abstract" coordinates. For instance, you can visualize a "safety distance" around the player using a bounding box or a sphere, to check AI reactions at certain distances.

```dae
//*******************
//   Bounding Box
//*******************
func void Example_2() {
    var zCVob her; her = Hlp_GetNpc(hero);

    // Safety distance around the player (5 meters)
    var int distance; distance = mkf(500);

    // Lower corner of the bounding box
    var int point1[3];
    point1[0] = subf(her.trafoObjToWorld[3],  distance);
    point1[1] = subf(her.trafoObjToWorld[7],  distance);
    point1[2] = subf(her.trafoObjToWorld[11], distance);

    // Upper corner of the bounding box (diagonally opposite)
    var int point2[3];
    point2[0] = addf(her.trafoObjToWorld[3],  distance);
    point2[1] = addf(her.trafoObjToWorld[7],  distance);
    point2[2] = addf(her.trafoObjToWorld[11], distance);

    var int hndl;

    if (!Hlp_IsValidHandle(hndl)) {
        hndl = DrawBBox(_@(point1), _@(point2), zCOLOR_BLUE);
    } else {
        UpdateBBox(hndl, _@(point1), _@(point2));
    };
};
```

To draw a sphere with a radius of 5 meters centered at a specific point, you only need the coordinates of the sphere's center.

```dae
//*******************
//      Sphere
//*******************
func void Example_2() {
    var zCVob her; her = Hlp_GetNpc(hero);
    var int centerPoint[3];
    centerPoint[0] = her.trafoObjToWorld[3];
    centerPoint[1] = her.trafoObjToWorld[7];
    centerPoint[2] = her.trafoObjToWorld[11];

    var int hndl;

    if (!Hlp_IsValidHandle(hndl)) {
        hndl = DrawSphere(_@(centerPoint), 500, zCOLOR_BLUE);
    } else {
        UpdateSphere(hndl, _@(centerPoint), 500);
    };
};
```

Similarly, you could continuously update the bounding box/sphere using a `FrameFunction`.

### Changing Color or Hiding/Deleting Draw Elements

If you want to visualize an AI reaction, for example, you can change the color. Color values can be created using the `RGBA` function based on RGB values.

```dae
func void ObserveIntruder(var int hndl, var C_NPC oth) {
    if (Npc_HasDetectedNpc(oth, hero)) {
        // Color is now red, position and size of the bounding box remain unchanged
        SetBBoxColor(hndl, zCOLOR_RED); // zCOLOR_RED == RGBA(255, 0, 0, 255)
    };
};
```

Draw elements can also be easily hidden or completely deleted.

```dae
func void CheckDialog(var int hndl) {
    if (!InfoManager_HasFinished()) {
        // Hide bounding box during dialogs
        HideBBox(hndl);

        // EraseBBox(hndl); // Or delete including the handle
    };
};
```
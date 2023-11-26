# zCVob

**zCVob** is a base class for all objects placed in a world.

!!! example "Acknowledgment"
    Heavily inspired by the amazing documentation site [Gothic library](http://www.gothic-library.ru/publ/class_zcvob/1-1-0-467)

## Class members

=== "G1"
    <figure markdown style="float:right;margin:0 10px 10px 0">
        ![zCVob properties in spacer](../../../assets/images/zCVob_G1.png){width="300" }
    </figure>
    
    Properties of a zCVob class are split into two parts. The **Internals** are hardly ever needed to be edited manually, they are changeed by e.g. moving an object in [Spacer](../spacer.md). On the other hand the **Vob** properties can only be changed by the Objects context menu in [Spacer](../spacer.md).

    **Internals**

    - [pack](#pack)
    - [presetName](#presetname)
    - [bbox3DWS](#bbox3dws)
    - [trafoOSToWSRot](#trafoostowsrot)
    - [trafoOSToWSPos](#trafoostowspos)

    **Vob**

    - [vobName](#vobname)
    - [visual](#visual)
    - [showVisual](#showvisual)
    - [visualCamAlign](#visualcamalign)
    - [CdStatic](#cdstatic)
    - [CdDyn](#cddyn)
    - [staticVob](#staticvob)
    - [dynShadow](#dynshadow)

=== "G2A"
    <figure markdown style="float:right;margin:0 10px 10px 0">
        ![zCVob properties in spacer2](../../../assets/images/zCVob_G2A.png){ width="300" }
    </figure>

    Properties of a zCVob class are split into two parts. The **Internals** are hardly ever needed to be edited manually, they are changeed by e.g. moving an object in [Spacer](../spacer.md). On the other hand the **Vob** properties can only be changed by the Objects context menu in [Spacer](../spacer.md).

    **Internals**

    - [pack](#pack)
    - [presetName](#presetname)
    - [bbox3DWS](#bbox3dws)
    - [trafoOSToWSRot](#trafoostowsrot)
    - [trafoOSToWSPos](#trafoostowspos)

    **Vob**

    - [vobName](#vobname)
    - [visual](#visual)
    - [showVisual](#showvisual)
    - [visualCamAlign](#visualcamalign)
    - [visualAniMode](#visualanimode)
    - [visualAniModeStrength](#visualanimodestrength)
    - [vobFarClipZScale](#vobfarclipzscale)
    - [CdStatic](#cdstatic)
    - [CdDyn](#cddyn)
    - [staticVob](#staticvob)
    - [dynShadow](#dynshadow)
    - [zbias](#zbias)
    - [isAmbient](#isambient)

## Class member overview

### pack
No Information provided.

### presetName
The name of the template that was used to create the item.

### bbox3DWS
Volume of virtual object. Defined by two opposite diagonal points of the BoundingBox (`1x, 1y, 1z`, `2x, 2y, 2z`). The volume is needed to calculate collisions and interactions with other game objects. For example, with dynamic objects, which include characters (class C_NPC), items (class [C_ITEM](../../scripts/classes/c_item.md) ), etc. 
    
Interaction processing begins when object volumes intersect. For example, when the player enters the world change trigger area, the engine loads another game level based on the parameters this trigger. All this happens when the main character's BoundingBox intersects with the trigger's BoundingBox. 

The BoundingBox can only be changed using the `Edit the Bbox` button in Spcaer. 

### trafoOSToWSRot
Orientation relative to the coordinate center. 

!!! Note
    This refers to the center of coordinates of the `.3DS` file of the game world on which the `ZEN` file is built. 

### trafoOSToWSPos
Coordinates of the position in space relative to the center of coordinates. 

The coordinates are set automatically the first time an instance of the class is inserted into the game world. You can change them either directly by entering numerical values ​​in the corresponding fields of the parameter, by [moving the vob](../spacer.md#viewport-controls) in spacer.

### vobName 
An identifier of a zCVob shown in the editor and sometimes used in scripts. The name can be left blank.

For some object classes, entering a name is required: zCVobSpot , zCVobWaypoint , zCTrigger , etc.

!!! Danger
    Setting a name for every static and insignificant object can lead to an error when parsing the game world. 
### visual
The name of the file that will be responsible for the visual display of the object. 

Different file formats are used for different object classes: 

- `*.3DS` - Static objects
- `*.PFX` - Particle effects
- `*.TGA` - Textures
- `*.MDS`, `*.ASC` - Interactive objects
- `*.MMS` - Animated objects


### showVisual
This option is responsible for displaying the object.

**Accepted values:**

- **TRUE** - Display.
- **FALSE** - Do not display.


### visualCamAlign
Option to align objects relative to the camera. 

**Accepted values:**

- **NONE** - Not used.
- **YAW** - The object always faces the player.
- **FULL** - The object is aligned relative to the world axes.

!!! Note
    For example, in order for the grass model to always face the character, you need to set this parameter to **YAW**.

### visualAniMode
Wind simulation option. Used in conjunction with the [visualAniModeStrength](#visualanimodestrength) parameter.

**Accepted values:**

- **NONE** - Not used.
- **WIND** - Strong wind effect. Acceptable for herbs.
- **WIND2** - Light wind effect. Acceptable for trees.

!!! Warning
    This option is only available in Gothic 2 (Spacer2).

### visualAniModeStrength
Wind power animation multiplier. Small values such as `0.001` are typically used. Used in conjunction with the [visualAniMode](#visualanimode) parameter.

!!! Warning
    This option is only available in Gothic 2 (Spacer2).

### vobFarClipZScale
Sets the loading range of the VOB object. Depends on the VOB drawing distance specified using the `zCZoneVobFarPlane` object.

The range of values is from `0.0` to `2.0`.

With a value of `0.0`, the object is not visible, but collisions are calculated. With a value of `2.0`, the VOB drawing range is identical to the VOB drawing range of objects specified by the `zCZoneVobFarPlane` object.

!!! Warning
    This option is only available in Gothic 2 (Spacer2).

### CdStatic
Determines if the VOB will collide with the static objects (world mesh and other VOBs with **cdStatic** on).

**Accepted values:**

- TRUE - Collision handling for static objects is enabled.
- FALSE - Collision handling for static objects is disabled.

!!! Tip    
    A situation often arises when objects “refuse” to move beyond a certain point on the surface. This happens when **cdStatic** is set to **TRUE**, i.e. the object cannot cross the surface another static object. In this case, it is enough to disable the **cdStatic** parameter for the duration of the move, and turn it on again after the move.

### CdDyn
Determines if the VOB will collide with dynamic objects (NPCs, items, etc.). This basically determines if the object has collision during gameplay.

**Accepted values:**

- **TRUE** - Collision handling for dynamic objects is enabled.
- **FALSE** - Collision handling for dynamic objects is disabled.


### staticVob
Determines if the VOB is taken into consideration in static lighting calculations in Indoor spaces. Usually enabled in decorative Vobs, but some of the interactive ones have it disabled.

**Accepted values:**

- **TRUE** - Calculate the shadow of the object.
- **FALSE** - Do not calculate the shadow of the object.

!!! Note
    The shadow is calculated when compiling light in Low, Middle or High mode.

### dynShadow
Determine if the object will cast a shadow when affected by dynamic light (e.g. torches).

**Accepted values:**

- **DS_NONE** - No shadow.
- **DS_BLOB** - Casts a circular shadow.

### zbias
Option to remove texture flickering if a `.TGA` file is used as rendering.

!!! Warning
    This option is only available in Gothic 2 (Spacer2).

### isAmbient
Sets the calculation of refracted lighting of objects.

**Accepted values:**

- TRUE - Calculate the refraction of light.
- FALSE - Do not calculate light refraction.

!!! Warning
    This option is only available in Gothic 2 (Spacer2).

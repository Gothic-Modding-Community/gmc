# zCVob

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCVob`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `12289`<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_zcvob/1-1-0-467)

Represents so-called virtual objects which appear in the game world. `zCVob` is the base class for all virtual objects which include everything from static models like boxes to interactive elements like doors and chests and invisible trigger objects.

## Class members
Properties of a zCVob class are split into two parts. The **Internals** are hardly ever needed to be edited manually, they are changed by e.g. moving an object in [Spacer](../spacer.md). On the other hand the **Vob** properties can only be changed by the Objects context menu in [Spacer](../spacer.md).

=== "Gothic 1"

    - zCVob
    {: .sp-class}
        - Internals
        {: .sp-folder}
            - [pack](#pack) = 0
            {: .sp-int}
            - [presetName](#presetname) = ""
            {: .sp-string}
            - [bbox3DWS](#bbox3dws) = 0 0 0 0 0 0
            {: .sp-misc}
            - [trafoOSToWSRot](#trafoostowsrot) = 0
            {: .sp-misc}
            - [trafoOSToWSPOS](#trafoostowspos) = 0 0 200
            {: .sp-vec}
        - Vob
        {: .sp-folder}
            - [vobName](#vobname) = ""
            {: .sp-string}
            - [visual](#visual) = ""
            {: .sp-string}
            - [showVisual](#showvisual) = TRUE
            {: .sp-bool}
            - [visualCamAlign](#visualcamalign) = NONE
            {: .sp-enum}
            - [cdStatic](#cdstatic) = FALSE
            {: .sp-bool}
            - [cdDyn](#cddyn) = FALSE
            {: .sp-bool}
            - [staticVob](#staticvob) = FALSE
            {: .sp-bool}
            - [dynShadow](#dynshadow) = DS_NONE
            {: .sp-enum}
        - visual = NULL
        {: .sp-class}
        - ai = NULL
        {: .sp-class}

=== "Gothic 2"

    - zCVob
    {: .sp-class}
        - Internals
        {: .sp-folder}
            - [pack](#pack) = 0
            {: .sp-int}
            - [presetName](#presetname) = ""
            {: .sp-string}
            - [bbox3DWS](#bbox3dws) = 0 0 0 0 0 0
            {: .sp-misc}
            - [trafoOSToWSRot](#trafoostowsrot) = 0
            {: .sp-misc}
            - [trafoOSToWSPOS](#trafoostowspos) = 0 0 200
            {: .sp-vec}
        - Vob
        {: .sp-folder}
            - [vobName](#vobname) = ""
            {: .sp-string}
            - [visual](#visual) = ""
            {: .sp-string}
            - [showVisual](#showvisual) = TRUE
            {: .sp-bool}
            - [visualCamAlign](#visualcamalign) = NONE
            {: .sp-enum}
            - [visualAniMode](#visualanimode) = NONE
            {: .sp-enum}
            - [visualAniModeStrength](#visualanimodestrength) = 0.0
            {: .sp-float}
            - [vobFarClipZScale](#vobfarclipzscale) = 1.0
            {: .sp-float}
            - [cdStatic](#cdstatic) = FALSE
            {: .sp-bool}
            - [cdDyn](#cddyn) = FALSE
            {: .sp-bool}
            - [staticVob](#staticvob) = FALSE
            {: .sp-bool}
            - [dynShadow](#dynshadow) = DS_NONE
            {: .sp-enum}
            - [zbias](#zbias) = 1
            {: .sp-int}
            - [isAmbient](#isambient) = FALSE
            {: .sp-bool}
        - visual = NULL
        {: .sp-class}
        - ai = NULL
        {: .sp-class}


=== "Gothic 1 (Save)"

    - zCVob
    {: .sp-class}
        - Internals
        {: .sp-folder}
            - [pack](#pack) = 0
            {: .sp-int}
            - [presetName](#presetname) = ""
            {: .sp-string}
            - [bbox3DWS](#bbox3dws) = 0 0 0 0 0 0
            {: .sp-misc}
            - [trafoOSToWSRot](#trafoostowsrot) = 0
            {: .sp-misc}
            - [trafoOSToWSPOS](#trafoostowspos) = 0 0 200
            {: .sp-vec}
        - Vob
        {: .sp-folder}
            - [vobName](#vobname) = ""
            {: .sp-string}
            - [visual](#visual) = ""
            {: .sp-string}
            - [showVisual](#showvisual) = TRUE
            {: .sp-bool}
            - [visualCamAlign](#visualcamalign) = NONE
            {: .sp-enum}
            - [cdStatic](#cdstatic) = FALSE
            {: .sp-bool}
            - [cdDyn](#cddyn) = FALSE
            {: .sp-bool}
            - [staticVob](#staticvob) = FALSE
            {: .sp-bool}
            - [dynShadow](#dynshadow) = DS_NONE
            {: .sp-enum}
        - visual = NULL
        {: .sp-class}
        - ai = NULL
        {: .sp-class}
        - [sleepMode](#sleepmode) = 0
        {: .sp-int}
        - [nextOnTimer](#nextontimer) = 0.0
        {: .sp-float}

=== "Gothic 2 (Save)"

    - zCVob
    {: .sp-class}
        - Internals
        {: .sp-folder}
            - [pack](#pack) = 0
            {: .sp-int}
            - [presetName](#presetname) = ""
            {: .sp-string}
            - [bbox3DWS](#bbox3dws) = 0 0 0 0 0 0
            {: .sp-misc}
            - [trafoOSToWSRot](#trafoostowsrot) = 0
            {: .sp-misc}
            - [trafoOSToWSPOS](#trafoostowspos) = 0 0 200
            {: .sp-vec}
        - Vob
        {: .sp-folder}
            - [vobName](#vobname) = ""
            {: .sp-string}
            - [visual](#visual) = ""
            {: .sp-string}
            - [showVisual](#showvisual) = TRUE
            {: .sp-bool}
            - [visualCamAlign](#visualcamalign) = NONE
            {: .sp-enum}
            - [visualAniMode](#visualanimode) = NONE
            {: .sp-enum}
            - [visualAniModeStrength](#visualanimodestrength) = 0.0
            {: .sp-float}
            - [vobFarClipZScale](#vobfarclipzscale) = 1.0
            {: .sp-float}
            - [cdStatic](#cdstatic) = FALSE
            {: .sp-bool}
            - [cdDyn](#cddyn) = FALSE
            {: .sp-bool}
            - [staticVob](#staticvob) = FALSE
            {: .sp-bool}
            - [dynShadow](#dynshadow) = DS_NONE
            {: .sp-enum}
            - [zbias](#zbias) = 1
            {: .sp-int}
            - [isAmbient](#isambient) = FALSE
            {: .sp-bool}
        - visual = NULL
        {: .sp-class}
        - ai = NULL
        {: .sp-class}
        - [sleepMode](#sleepmode) = 0
        {: .sp-int}
        - [nextOnTimer](#nextontimer) = 0.0
        {: .sp-float}

    

## Class member overview

### `pack` {: .sp-int}
Internal property which indicates how the data associated with this virtual object is stored.

### `presetName` {: .sp-string}
The name of the template that was used to create this virtual object.

### `bbox3DWS` {: .sp-misc}
The 3-dimensional bounding box of this virtual object. Defined by two opposite diagonal points (`1x, 1y, 1z`, `2x, 2y, 2z`). This is used in conjunction with [cdStatic](#cdstatic) and [cdDyn](#cddyn) calculate collisions and interactions with other game objects (NPCs, items, etc.). 
    
Interaction processing begins when object volumes intersect. For example, when the player enters the world change trigger area, the engine loads another game level based on the parameters this trigger. All this happens when the main character's BoundingBox intersects with the trigger's BoundingBox. 

The BoundingBox can only be changed using the `Edit the Bbox` button in Spacer. 

### `trafoOSToWSRot` {: .sp-misc}
The rotation of this virtual object in world space, represented by a 3x3 rotation matrix.


### `trafoOSToWSPos` {: .sp-vec}
Coordinates of the object in world space relative to the center. 

!!! Note
    This refers to the center of coordinates of the `.3DS` file of the game world on which the `ZEN` file is built. 

The coordinates are set automatically the first time an instance of the class is inserted into the game world. You can change them either directly by entering numerical values in the corresponding fields of the parameter, by [moving the vob](../spacer.md#viewport-controls) in spacer.

### `vobName` {: .sp-string}
An identifier of a zCVob shown in the editor and sometimes used in scripts. The name can be left blank.

For some object classes, entering a name is required: zCVobSpot, zCVobWaypoint, zCTrigger etc.

!!! Danger
    Setting a name for every static and insignificant object can lead to an error when parsing the game world.

### `visual` {: .sp-string}
The name of the visual component associated with this object, usually a name of a file.

Following formats are supported: 

- `*.3DS` - Static objects
- `*.PFX` - Particle effects
- `*.TGA` - Textures
- `*.MDS`, `*.ASC` - Interactive objects
- `*.MMS` - Animated objects


### `showVisual` {: .sp-bool}
Indicates whether this object should display its visual. 

**Accepted values:**

- **TRUE** - Display.
- **FALSE** - Do not display.


### `visualCamAlign` {: .sp-enum}
Option to align objects relative to the camera. 

**Accepted values:**

- **NONE** - Not used.
- **YAW** - The object always faces the player.
- **FULL** - The object is aligned relative to the world axes.

!!! Note
    This may be used with grass or flowers which only consist of a 2-dimensional sprite to have it always face the camera.

### `visualAniMode` {: .sp-enum}
Wind simulation option. Used in conjunction with the [visualAniModeStrength](#visualanimodestrength) parameter.

**Accepted values:**

- **NONE** - Not used.
- **WIND** - Strong wind effect. Acceptable for herbs.
- **WIND2** - Light wind effect. Acceptable for trees.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `visualAniModeStrength` {: .sp-float}
Wind power animation multiplier. Small values such as `0.001` are typically used. Used in conjunction with the [visualAniMode](#visualanimode) parameter.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `vobFarClipZScale` {: .sp-float}
Sets the loading range of the VOB object. Depends on the VOB drawing distance specified using the `zCZoneVobFarPlane` object.

The range of values is from `0.0` to `2.0`.

With a value of `0.0`, the object is not visible, but collisions are calculated. With a value of `2.0`, the `zCVob` drawing range is the same as the draw distance specified in `zCZoneVobFarPlane` object.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `cdStatic` {: .sp-bool}
Determines if the virtual object will collide with the static objects (world mesh and other VOBs with **cdStatic** on).

**Accepted values:**

- TRUE - Collide with static objects.
- FALSE - Don't collide static objects.

!!! Tip    
    A situation often arises when objects “refuse” to move beyond a certain point on the surface. This happens when **cdStatic** is set to **TRUE**, i.e. the object cannot cross the surface another static object. In this case, it is enough to disable the **cdStatic** parameter for the duration of the move, and turn it on again after the move.

### `cdDyn` {: .sp-bool}
Determines if the virtual object will collide with dynamic objects (NPCs, items, etc.). This basically determines if the object has collision during gameplay.

**Accepted values:**

- **TRUE** - Collide with dynamic objects.
- **FALSE** - Don't collide with dynamic objects.


### `staticVob` {: .sp-bool}
Determines if the VOB is taken into consideration in static lighting calculations in Indoor spaces. Usually enabled in decorative Vobs, but some of the interactive ones have it disabled.

**Accepted values:**

- **TRUE** - Calculate the shadow of the object.
- **FALSE** - Do not calculate the shadow of the object.

!!! Note
    The shadow is calculated when compiling light in Low, Middle or High mode.

### `dynShadow` {: .sp-enum}
Indicates whether the object will cast a shadow when affected by dynamic light (e.g. torches).

**Accepted values:**

- **DS_NONE** - No shadow.
- **DS_BLOB** - Casts a circular shadow.

### `zbias` {: .sp-int}
The depth-bias for this virtual object.

Can be used remove texture flickering if a `.TGA` file is used as rendering.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `isAmbient` {: .sp-bool}
Indicates that this virtual object is ambient. It looks like this setting was a system used during development when access to the game's source code was available. Basically, the global variable `zCWorld::s_bAmbientVobsEnabled` could be used to hide or show virtual objects which have the `isAmbient` flag set. In release builds, this variable is always set to true, thus the `isAmbient` flag does not have any perceivable effect on the game. It follows, that this field should be ignored by most implementations.

!!! Warning
    This option is only available in Gothic II (Spacer2).


### `sleepMode` {: .sp-int}
Unknown.

!!! warning
    This property is only available in saved games.

### `nextOnTimer` {: .sp-float}
Unknown.

!!! warning
    This property is only available in saved games.

[^1]:
    Heavily inspired by the zCVob article at [gothic-library](http://www.gothic-library.ru/publ/class_zcvob/1-1-0-467).

[^2]:
    Corrected with information found in [ZenKit ZenGin Reference](https://zk.gothickit.dev/engine/objects/zCVob/).

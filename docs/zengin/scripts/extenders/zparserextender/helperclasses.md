# Engine classes
zParserExtender implements various proxy classes that can be used to access game world objects.
!!! Warning
    It is not recommended to implement complex mechanics using these classes and functions. They are present as a simple backup option for accessing game world objects and for quick fixes.
    
## C_VOB
This class represents basic pointer to a game world object.

## C_Color
Represents color in the RGBA format
```dae
class C_Color
{
    var int R; // red channel value
    var int G; // green channel value
    var int B; // blue channel value
    var int A; // alpha channel value
};
```

## C_Position
Represents 3D position in the world
```dae
class C_Position
{
    var int X; // X coordinate
    var int Y; // Y coordinate
    var int Z; // Z coordinate
};
```
Externals:
```dae
/// Returns the current position of the object in the world
/// 
/// @param vob vob to ge the position of
/// @return C_Position instace - position of the VOB
func C_Position Vob_GetVobPosition( var C_Vob vob ) {};

/// Sets the current position of the object in the world
/// 
/// @param vob vob to get the position of
/// @param pos new position of the vob
func void Vob_SetVobPosition( var C_Vob vob, var C_Position pos ) {};
```

!!! Note
    The following classes define properties of `C_VOB` objects or classes derived from it.
    
## C_VOB_DATA
Represents universal `zCVob` class
```dae
class C_VOB_DATA
{
    var string Name;              // object name
    var float VisualAlpha;        // object's transparency 0.0 - 1.0
    var int ShowVisual;           // display the mode
    var int DrawBBox3D;           // show objects bounding box
    var int VisualAlphaEnabled;   // enables objects transparency
    var int PhysicsEnabled;       // enables object's physics
    var int IgnoredByTraceRay;    // allow any object collisions
    var int CollDetectionStatic;  // allow collision with static world polygons
    var int CollDetectionDynamic; // allow collision with dynamic world objects
    var int CastDynShadow;        // display shadow of the object
    var int LightColorStatDirty;  // allow static liging of the object
    var int LightColorDynDirty;   // allow dynamic lighing of the object
    var int SleepingMode;         // sets object's activity mode (0 - inactive, 1 - active, 2 - AI only)
    var int DontWriteIntoArchive; // turns of the serialization of this object to the save file 
};
```
Externals:
```dae
/// Returns the universal data of the zCVob object
///
/// @param vob VOB to get the position of
/// @return general vob data C_Vob_Data
func C_Vob_Data Vob_GetVobData( var C_Vob vob ) {};

/// Sets the universal data to a zCVob object
///
/// @param vob VOB to get the position of
/// @param data general vob data C_Vob_Data
func void Vob_SetVobData( var C_Vob vob, var C_Vob_Data data ) {};
```
## C_LIGHT_DATA
Represents `zCVobLight` objects
```dae
class C_LIGHT_DATA
{
    var int R;                // red light intensity
    var int G;                // green light intensity
    var int B;                // blue light intensity
    var int Range;            // radius
    var int RangeInv;         // 
    var int RangeBackup;      // 
    var int RangeAniActFrame; // current light animation frame for the radius
    var int RangeAniFPS;      // speed of light animation for the radius
    var int ColorAniActFrame; // current light animation frame for colour
    var int ColorAniFPS;      // speed of light animation for colour
    var int SpotConeAngleDeg; // angle of cone light source
    var int IsStatic;         // whether the source is static
    var int RangeAniSmooth;   // [UNUSED]
    var int RangeAniLoop;     // [UNUSED]
    var int ColorAniSmooth;   // allows soft transitions between colours
    var int ColorAniLoop;     // [UNUSED]
    var int IsTurnedOn;       // whether the light source is on
    var int LightQuality;     // source quality (when statically compiling light) (0 - high, 1 - medium, 2 - low)
    var int LightType;        // type of source (at static light compilation) (0 - point, 1 - cone)
};
```
Externals:
```dae
/// Returns zCVobLight object data
///
/// @param vobLight vobLight object
/// @return C_Light_Data of the light
func C_Light_Data Vob_GetLightData( var C_Vob vobLight ) {};

/// Sets the data of a zCVobLight object
///
/// @param vobLight object to apply the light data to
/// @param data C_Light_Data light data to be set
func void Vob_SetLightData( var C_Vob vobLight, var C_Light_Data data ) {};

/// Clears the list of animation colours for the light source
///
/// @param vobLight light vob
func void Vob_ClearLightAniList( var C_Vob vobLight ) {};

/// Adds a color to the colour list
///
/// @param vobLight object to apply the colour to
/// @param col colour to be applied
func void Vob_AddLightAniColor( var C_Vob vobLight, var C_Color col ) {};

/// Adds a color to the colour list
///
/// @param vobLight object to apply the colour to
/// @param r red colour channel
/// @param g green colour channel 
/// @param b blue colour channel
func void Vob_AddLightAniColorRGB( var C_Vob vobLight,
                                   var int r,
                                   var int g,
                                   var int b ) {};
```
## C_MOB_DATA
Represents  data for the used oCMOB object
```dae
class C_MOB_DATA
{
    var string VisibleName;     // name shown above the object
    var int Hitpoints;          // number of hitpoints
    var int Damage;             // damage the object can cause
    var int IsDestroyed;        // if the object is destroyed
    var int Moveable;           // whether the object can be moved
    var int Takeable;           // whether the object can be taken
    var int FocusOverride;      // if the object will redefine focus in combat mode
    var int SndMat;             // object's material (0 - wood, 1 - stone, 2 - metal, 3 - skin, 4 - clay, 5 - glass)
    var string VisualDestroyed; // model when the object is destroyed
    var string OwnerStr;        // name of the instance of the owner of the object
    var string OwnerGuildStr;   // name of the guild of the object
    var int Owner;              // instance of the owner
    var int OwnerGuild;         // guild instance
    var int FocusNameIndex;     // the script string of the displayed name
};
```
```dae
/// Returns the data of the oCMOB object
///
/// @param mob oCMOB object
/// @return mob data
func C_Mob_Data Vob_GetMobData( var C_Vob mob ) {};

/// Sets the data of the oCMOB object
///
/// @param mob oCMOB object
/// @param data C_Mob_Data to be set 
func void Vob_SetMobData( var C_Vob mob, var C_Mob_Data data ) {};
```
## C_MOBINTER_DATA
Represents data for the interactive object `oCMobInter`
```dae
class C_MOBINTER_DATA
{
    var string TriggerTarget;   // object name which will be triggered by OnTrigger
    var string UseWithItem;     // name of the object instance that is needed for interaction
    var string Sceme;           // name of the scene that corresponds to the object and character animations
    var string ConditionFunc;   // scripting condition under which the interaction can be performed
    var string OnStateFuncName; // the name pattern of the functions that will be called when the object changes the state
    var int State;              // the current state of the object
    var int State_num;          // number of object's states
    var int State_target        // current state of the object
    var int Rewind;             // prohibits object updating
    var int MobStateAni;        // current animation of the object
    var int NpcStateAni;        // current character animation
};
```
```dae
/// Returns the data of the oCMobInter object
///
/// @param mobInter oCMobInter object
/// @return MobInter_Data of the object
func MobInter_Data Vob_GetMobInterData( var C_Vob mobInter ) {};

/// Sets the data of the oCMobInter object
///
/// @param mobInter oCMobInter object
/// @param data MobInter_Data of the object
func void Vob_SetMobInterData( var C_Vob mobInter, var C_MobInter_Data data ) {};
```
## C_MOBLOCKABLE_DATA
Represents data for the locked interactive object `oCMobLockable`
```dae
class C_MOBLOCKABLE_DATA
{
    var int Locked;         // whether the object is locked
    var int AutoOpen;       // [UNUSED]
    var int PickLockNr;     // current rotation number 
    var string KeyInstance; // key instance name for the object
    var string PickLockStr; // combination to open the object ("LRRLR")
};
```
```dae
/// Returns the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// @param data MobInter_Data of the object
func C_MobLockable_Data Vob_GetMobInterData( var C_Vob mobLock ) {};

/// Sets the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// @param data C_MobLockable_Data of the object
func void Vob_SetMobInterData( var C_Vob mobLock, var C_MobLockable_Data data ) {};
```

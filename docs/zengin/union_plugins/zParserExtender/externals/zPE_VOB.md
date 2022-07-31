# VOB - functions for object manipulation
VOB functions allow you to manipulate game world objects.
```c++
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

# VOB - functions for object manipulation
VOB functions allow you to manipulate game world objects.

## Vob_GetVobPosition
Returns the current position of the object in the world

```dae
func C_Position Vob_GetVobPosition( var C_Vob vob ) {};
```

- `vob` - vob to ge the position of
- `return` - C_Position instance - position of the VOB

## Vob_SetVobPosition
Sets the current position of the object in the world

```dae
func void Vob_SetVobPosition( var C_Vob vob, var C_Position pos ) {};
```

- `vob` - vob to get the position of
- `pos` - new position of the vob

## Vob_GetVobData
Returns the universal data of the zCVob object

```dae
func C_Vob_Data Vob_GetVobData( var C_Vob vob ) {};
```

- `vob` - VOB to get the position of
- `return` - general vob data C_Vob_Data

## Vob_SetVobData
Sets the universal data to a zCVob object

```dae
func void Vob_SetVobData( var C_Vob vob, var C_Vob_Data data ) {};
```

- `vob` - VOB to get the position of
- `data` - general vob data C_Vob_Data

## Vob_GetLightData
Returns zCVobLight object data

```dae
func C_Light_Data Vob_GetLightData( var C_Vob vobLight ) {};
```

- `vobLight` - vobLight object
- `return` - C_Light_Data of the light

## Vob_SetLightData
Sets the data of a zCVobLight object

```dae
func void Vob_SetLightData( var C_Vob vobLight, var C_Light_Data data ) {};
```

- `vobLight` - object to apply the light data to
- `data` - C_Light_Data light data to be set

## Vob_ClearLightAniList
Clears the list of animation colours for the light source

```dae
func void Vob_ClearLightAniList( var C_Vob vobLight ) {};
```

- `vobLight` - light vob

## Vob_AddLightAniColor
Adds a color to the colour list

```dae
func void Vob_AddLightAniColor( var C_Vob vobLight, var C_Color col ) {};
```

- `vobLight` - object to apply the colour to
- `col` - colour to be applied

## Vob_AddLightAniColorRGB
Adds a color to the colour list

```dae
func void Vob_AddLightAniColorRGB( var C_Vob vobLight,
```

- `vobLight` - object to apply the colour to
- `r` - red colour channel
- `g` - green colour channel
- `b` - blue colour channel

## Vob_GetMobData
Returns the data of the oCMOB object

```dae
func C_Mob_Data Vob_GetMobData( var C_Vob mob ) {};
```

- `mob` - oCMOB object
- `return` - mob data

## Vob_SetMobData
Sets the data of the oCMOB object

```dae
func void Vob_SetMobData( var C_Vob mob, var C_Mob_Data data ) {};
```

- `mob` - oCMOB object
- `data` - C_Mob_Data to be set

## Vob_GetMobInterData
Returns the data of the oCMobInter object

```dae
func MobInter_Data Vob_GetMobInterData( var C_Vob mobInter ) {};
```

- `mobInter` - oCMobInter object
- `return` - MobInter_Data of the object

## Vob_SetMobInterData
Sets the data of the oCMobInter object

```dae
func void Vob_SetMobInterData( var C_Vob mobInter, var C_MobInter_Data data ) {};
```

- `mobInter` - oCMobInter object
- `data` - MobInter_Data of the object

## Vob_GetMobInterData
Returns the data of the oCMobLockable object

```dae
func void C_MobLockable_Data Vob_GetMobInterData( var C_Vob mobLock ) {};
```

- `mobLock` - oCMobLockable object
- `data` - MobInter_Data of the object

## Vob_SetMobInterData
Sets the data of the oCMobLockable object

```dae
func void Vob_SetMobInterData( var C_Vob mobLock, var C_MobLockable_Data data ) {};
```

- `mobLock` - oCMobLockable object
- `data` - C_MobLockable_Data of the object

## Externals with Docu comments

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

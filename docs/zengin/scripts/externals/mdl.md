---
title: MDL functions
---
# MDL functions
Functions to tweak animation and other model related settings.

## Mdl_ApplyOverlayMDS
Apply an animation overlay with `overlay_name` for the specified `npc`
```dae
func void Mdl_ApplyOverlayMDS(var c_npc npc, var string overlay_name) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the overlay to
- `#!dae var string overlay_name` - name of the animation overlay

## Mdl_ApplyOverlayMDSTimed
Apply an animation overlay with `overlay_name` for the specified `npc` for `duration` milliseconds
```dae
func void Mdl_ApplyOverlayMDSTimed(var c_npc npc, var string overlay_name, var float duration) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the overlay to
- `#!dae var string overlay_name` - name of the animation overlay
- `#!dae var float duration` - overlay duration in milliseconds

## Mdl_RemoveOverlayMDS
Remove the animation overlay `overlay_name` from specified `npc` 
```dae
func void Mdl_RemoveOverlayMDS(var c_npc npc, var string overlay_name) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to remove the overlay from
- `#!dae var string overlay_name` - name of the animation overlay

## Mdl_ApplyRandomAni
Assign a random animation `ani2` to random animation list of animation `ani1`
```dae
func void Mdl_ApplyRandomAni(var c_npc npc, var string ani1, var string ani2) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC owning the animation
- `#!dae var string ani1` - the animation to asign random animation to
- `#!dae var string ani2` - animation to be assigned


## Mdl_ApplyRandomAniFreq
Sets the random animation frequency for animation `ani1`
```dae
func void Mdl_ApplyRandomAniFreq(var c_npc npc, var string ani1, var float frequency) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC owning the animation
- `#!dae var string ani1` - the animation to set the random frequency
- `#!dae var float frequency` - number of seconds between random animations

!!! Example
    ```dae
    // Attach T_WOUNDED_TRY animation to the S_WOUNDED animation
    Mdl_ApplyRandomAni(self, "S_WOUNDED", "T_WOUNDED_TRY");
    // Make the random animation attached play every 8 seconds
    Mdl_ApplyRandomAniFreq(self, "S_WOUNDED", 8);
    ```  

## Mdl_SetModelFatness
Set the procedural model fatness
```dae
func void Mdl_SetModelFatness(var c_npc npc, var float fatness) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the fatness to 
- `#!dae var float fatness` - fatness value


## Mdl_SetModelScale
Set model scale per axis
```dae
func void Mdl_SetModelScale(var c_npc npc, var float x, var float y, var float z) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the scale to 
- `#!dae var float x` - scale along the x axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
- `#!dae var float y` - scale along the y axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
- `#!dae var float z` - scale along the z axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 


## Mdl_SetVisualBody
Sets up the visual of an NPC
```dae
func void Mdl_SetVisualBody(var instance npc,
                            var string body_mesh,
                            var int body_tex,
                            var int skin,
                            var string head_mesh,
                            var int head_tex,
                            var int teeth_tex,
                            var int armor_inst       ) {};
```  

**Parameters**

- `#!dae var instance npc` - NPC to be affected
- `#!dae var string body_mesh` - mesh to be used as the body e.g. `HUN_BODY_NAKED0`
- `#!dae var int body_tex` - body texture assigned to this body mesh
- `#!dae var int skin` - body texture variant
- `#!dae var string head_mesh` - head mesh
- `#!dae var int head_tex` - head texture
- `#!dae var int teeth_tex` - teeth texture
- `#!dae var int armor_inst` - armor (C_ITEM instance) to be equipped or `-1` for no armor 

## Mdl_SetVisual
Set the animation set (also dictates models you can set using the `Mdl_SetVisualBody`)
```dae
func void Mdl_SetVisual(var instance npc, var string animation_set) {};
```  

**Parameters**

- `#!dae var instance npc` - NPC to apply the animation set to 
- `#!dae var string animation_set` - name of the MDS file that contains the animation set

## Mdl_StartFaceAni
Start a face animation
```dae
func void Mdl_StartFaceAni(var c_npc npc,
                           var string name,
                           var float intensity,
                           var float holdtime) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the animation to 
- `#!dae var string name` - animation name
- `#!dae var float intensity` - intensity of the animation 0.0 to 1.0
- `#!dae var float holdtime` - how long should the animation be held for `-2` will use the MMS defined value, '-1' will make the hold time infinite

## Mdl_ApplyRandomFaceAni
Start a random face animation
```dae
func void Mdl_ApplyRandomFaceAni(var c_npc npc,
                                 var string name,
                                 var float timemin,
                                 var float timeminvar,
                                 var float timemax,
                                 var float timemaxvar,
                                 var float probmin) {};
```  

**Parameters**

- `#!dae var c_npc npc` - NPC to apply the animation to 
- `#!dae var string name` - animation name
- `#!dae var float timemin` - minimum time after which the ani should be started (in seconds)
- `#!dae var float timeminvar` - minimum boundary variation (in seconds)
- `#!dae var float timemax` - maximum time after which the ani should be started (in seconds)
- `#!dae var float timemaxvar` - maximum boundary variation (in seconds)
- `#!dae var float probmin` - probablity (0.0 to 1.0) to choose the lower boundary time

## Externals with docu comments

```dae
/// Apply an animation overlay with `overlay_name` for the specified `npc`
/// 
/// @param npc NPC to apply the overlay to
/// @param overlay_name name of the animation overlay
func void Mdl_ApplyOverlayMDS(var c_npc npc, var string overlay_name) {};

/// Apply an animation overlay with `overlay_name` for the specified `npc` for `duration` milliseconds
///
/// @param npc NPC to apply the overlay to
/// @param overlay_name name of the animation overlay
/// @param duration overlay duration in milliseconds
func void Mdl_ApplyOverlayMDSTimed(var c_npc npc, var string overlay_name, var float duration) {};

/// Remove the animation overlay `overlay_name` from specified `npc` 
/// 
/// @param npc NPC to remove the overlay from
/// @param overlay_name name of the animation overlay
func void Mdl_RemoveOverlayMDS(var c_npc npc, var string overlay_name) {};

/// Assign a random animation `ani2` to random animation list of animation `ani1`
///
/// @param npc NPC owning the animation
/// @param ani1 the animation to asign random animation to
/// @param ani2 animation to be assigned
func void Mdl_ApplyRandomAni(var c_npc npc, var string ani1, var string ani2) {};

/// Sets the random animation frequency for animation `ani1`
///
/// @param npc NPC owning the animation
/// @param ani1 the animation to set the random frequency
/// @param frequency number of seconds between random animations
func void Mdl_ApplyRandomAniFreq(var c_npc npc, var string ani1, var float frequency) {};

/// Set the procedural model fatness
///
/// @param npc NPC to apply the fatness to 
/// @param fatness fatness value
func void Mdl_SetModelFatness(var c_npc npc, var float fatness) {};

/// Set model scale per axis
///
/// @param npc NPC to apply the scale to 
/// @param x scale along the x axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
/// @param y scale along the y axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
/// @param z scale along the z axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
func void Mdl_SetModelScale(var c_npc npc, var float x, var float y, var float z) {};

/// Sets up the visual of an NPC
///
/// @param npc NPC to be affected
/// @param body_mesh mesh to be used as the body e.g. `HUN_BODY_NAKED0`
/// @param body_tex body texture assigned to this body mesh
/// @param skin body texture variant
/// @param head_mesh head mesh
/// @param head_tex head texture
/// @param teeth_tex teeth texture
/// @param armor_inst armor (C_ITEM instance) to be equipped or `-1` for no armor 
func void Mdl_SetVisualBody(var instance npc,
                            var string body_mesh,
                            var int body_tex,
                            var int skin,
                            var string head_mesh,
                            var int head_tex,
                            var int teeth_tex,
                            var int armor_inst       ) {};

/// Set the animation set (also dictates models you can set using the `Mdl_SetVisualBody`)
///
/// @param npc NPC to apply the animation set to 
/// @param animation_set name of the MDS file that contains the animation set
func void Mdl_SetVisual(var instance npc, var string animation_set) {};

/// Start a face animation
///
/// @param npc NPC to apply the animation to 
/// @param name animation name
/// @param intensity intensity of the animation 0.0 to 1.0
/// @param holdtime how long should the animation be held for `-2` will use the MMS defined value, '-1' will make the hold time infinite
func void Mdl_StartFaceAni(var c_npc npc,
                           var string name,
                           var float intensity,
                           var float holdtime) {};

/// Start a random face animation
///
/// @param npc NPC to apply the animation to 
/// @param name animation name
/// @param timemin minimum time after which the ani should be started (in seconds)
/// @param timeminvar minimum boundary variation (in seconds)
/// @param timemax maximum time after which the ani should be started (in seconds)
/// @param timemaxvar maximum boundary variation (in seconds)
/// @param probmin probablity (0.0 to 1.0) to choose the lower boundary time
func void Mdl_ApplyRandomFaceAni(var c_npc npc,
                                 var string name,
                                 var float timemin,
                                 var float timeminvar,
                                 var float timemax,
                                 var float timemaxvar,
                                 var float probmin) {};
```

---
title: MDL functions
---
# MDL functions
Functions to tweak animation and other model related settings.

## Functions

### `Mdl_ApplyOverlayMDS`
!!! function "`Mdl_ApplyOverlayMDS`"
    Apply an animation overlay with `overlay_name` for the specified `npc`
    ```dae
    func void Mdl_ApplyOverlayMDS(var c_npc npc, var string overlay_name) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to apply the overlay to
    - `#!dae var string overlay_name`   
        Name of the animation overlay

### `Mdl_ApplyOverlayMDSTimed`
!!! function "`Mdl_ApplyOverlayMDSTimed`"
    Apply an animation overlay with `overlay_name` for the specified `npc` for `duration` milliseconds
    ```dae
    func void Mdl_ApplyOverlayMDSTimed(var c_npc npc, var string overlay_name, var float duration) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to apply the overlay to
    - `#!dae var string overlay_name`   
        Name of the animation overlay
    - `#!dae var float duration`   
        Overlay duration in milliseconds

### `Mdl_RemoveOverlayMDS`
!!! function "`Mdl_RemoveOverlayMDS`"
    Remove the animation overlay `overlay_name` from specified `npc` 
    ```dae
    func void Mdl_RemoveOverlayMDS(var c_npc npc, var string overlay_name) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to remove the overlay from
    - `#!dae var string overlay_name`   
        Name of the animation overlay

### `Mdl_ApplyRandomAni`
!!! function "`Mdl_ApplyRandomAni`"
    Assign a random animation `ani2` to random animation list of animation `ani1`
    ```dae
    func void Mdl_ApplyRandomAni(var c_npc npc, var string ani1, var string ani2) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC owning the animation
    - `#!dae var string ani1`   
        The animation to assign random animation to
    - `#!dae var string ani2`   
        Animation to be assigned


### `Mdl_ApplyRandomAniFreq`
!!! function "`Mdl_ApplyRandomAniFreq`"
    Sets the random animation frequency for animation `ani1`
    ```dae
    func void Mdl_ApplyRandomAniFreq(var c_npc npc, var string ani1, var float frequency) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC owning the animation
    - `#!dae var string ani1`   
        The animation to set the random frequency
    - `#!dae var float frequency`   
        Number of seconds between random animations

    ??? Abstract "Example"
        ```dae
        // Attach T_WOUNDED_TRY animation to the S_WOUNDED animation
        Mdl_ApplyRandomAni(self, "S_WOUNDED", "T_WOUNDED_TRY");
        // Make the random animation attached play every 8 seconds
        Mdl_ApplyRandomAniFreq(self, "S_WOUNDED", 8);
        ```  

### `Mdl_SetModelFatness`
!!! function "`Mdl_SetModelFatness`"
    Set the procedural model fatness
    ```dae
    func void Mdl_SetModelFatness(var c_npc npc, var float fatness) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to apply the fatness to 
    - `#!dae var float fatness`   
        Fatness value

### `Mdl_SetModelScale`
!!! function "`Mdl_SetModelScale`"
    Set model scale per axis
    ```dae
    func void Mdl_SetModelScale(var c_npc npc, var float x, var float y, var float z) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to apply the scale to 
    - `#!dae var float x`   
        Scale along the x-axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
    - `#!dae var float y`   
        Scale along the y-axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 
    - `#!dae var float z`   
        Scale along the z-axis, 1.0 = 100%, 1.5 = 150%, 0.9 = 90% 

### `Mdl_SetVisualBody`
!!! function "`Mdl_SetVisualBody`"
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

    - `#!dae var instance npc`   
        NPC to be affected
    - `#!dae var string body_mesh`   
        Mesh to be used as the body e.g. `HUN_BODY_NAKED0`
    - `#!dae var int body_tex`   
        Body texture assigned to this body mesh
    - `#!dae var int skin`   
        Body texture variant
    - `#!dae var string head_mesh`   
        Head mesh
    - `#!dae var int head_tex`   
        Head texture
    - `#!dae var int teeth_tex`   
        Teeth texture
    - `#!dae var int armor_inst`   
        Armor ([`C_ITEM`](../classes/c_item.md) instance) to be equipped or `-1` for no armor 

### `Mdl_SetVisual`
!!! function "`Mdl_SetVisual`"
    Set the animation set (also dictates models you can set using the `Mdl_SetVisualBody`)
    ```dae
    func void Mdl_SetVisual(var instance npc, var string animation_set) {};
    ```  

    **Parameters**

    - `#!dae var instance npc`   
        NPC to apply the animation set to 
    - `#!dae var string animation_set`   
        Name of the MDS file that contains the animation set

### `Mdl_StartFaceAni`
!!! function "`Mdl_StartFaceAni`"
    Start a face animation
    ```dae
    func void Mdl_StartFaceAni(var c_npc npc,
                               var string name,
                               var float intensity,
                               var float holdtime) {};
    ```  

    **Parameters**

    - `#!dae var c_npc npc`   
        NPC to apply the animation to 
    - `#!dae var string name`   
        Animation name
    - `#!dae var float intensity`   
        Intensity of the animation 0.0 to 1.0
    - `#!dae var float holdtime`   
        How long should the animation be held for `-2` will use the MMS defined value, '-1' will make the hold time infinite

### `Mdl_ApplyRandomFaceAni`
!!! function "`Mdl_ApplyRandomFaceAni`"
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

    - `#!dae var c_npc npc`   
        NPC to apply the animation to 
    - `#!dae var string name`   
        Animation name
    - `#!dae var float timemin`   
        Minimum time after which the ani should be started (in seconds)
    - `#!dae var float timeminvar`   
        Minimum boundary variation (in seconds)
    - `#!dae var float timemax`   
        Maximum time after which the ani should be started (in seconds)
    - `#!dae var float timemaxvar`   
        Maximum boundary variation (in seconds)
    - `#!dae var float probmin`   
        Probability (0.0 to 1.0) to choose the lower boundary time

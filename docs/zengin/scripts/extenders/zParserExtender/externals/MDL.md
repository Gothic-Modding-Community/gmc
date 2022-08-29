# MDL - model functions
Functions to tweak animation and other model related settings.




```c++
func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};

func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};

func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};

func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};

func float Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};

func float Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};

func float Mdl_SetAnimationFPS( var C_NPC npc, var int idx, var float fps ) {};

func float Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};

func void Mdl_SetVisible( var C_NPC npc, var int isVisible ) {};

/// Applies or moves existing overlay to the top of the list
///
/// @param mdsName name of the overlay
func void Mdl_ApplyOverlayMds_AtFirst( var string mdsName ) {};

/// Sets a multipler for animation speed
/// 1.0 = 100% speed (normal speed)
///
/// @param npc npc to be affected
/// @param multiplier speed of the animation
func void Mdl_SetNpcSpeedMultiplier( var C_Npc npc, var float multiplier ) {};

/// Resets the animation speed of an NPC
///
/// @param npc npc to be affected
func void Mdl_ResetNpcSpeedMultiplier( var C_Npc npc ) {};

```

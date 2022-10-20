# MDL - model functions
Functions to tweak animation and other model related settings.

## Mdl_GetAnimationIndex
Returns animation's index for specified NPC based on animation's name

```dae
func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};
```

- `npc` - NPC with the animation
- `ani_name` - name of the animation in allcaps
- `return` - animation index

## Mdl_GetAnimationName
Returns animation's name for specified NPC based on animation's index

```dae
func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};
```

- `npc` - NPC with the animation
- `ani_index` - animation index
- `return` - animation name

## Mdl_AnimationIsExists
Checks wheter animation exists

```dae
func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};
```

- `npc` - NPC with the animation
- `ani_index` - animation index
- `return` - animation name

## Mdl_AnimationIsActive
Checks wheter animation is active (wheter it is currently played)

```dae
func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};
```

- `npc` - NPC with the animation
- `ani_index` - animation index
- `return` - `TRUE` if the animation is playing, `FALSE` if it is not playing

## Mdl_SetAllAnimationsFPS
Set framerate for all animations

```dae
func void Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};
```

- `npc` - NPC with the animation
- `fps` - framerate

## Mdl_ResetAllAnimationsFPS
Reset framerate for all animations to default value

```dae
func void Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};
```

- `npc` - NPC with the animation

## Mdl_SetAnimationFPS
Set framerate for animtion specified by animation index

```dae
func void Mdl_SetAnimationFPS( var C_NPC npc, var int ani_index, var float fps ) {};
```

- `npc` - NPC with the animation
- `ani_index` - animation index
- `fps` - framerate

## Mdl_ResetAnimationFPS
Reset framerate to default for animtion specified by animation index

```dae
func void Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};
```

- `npc` - NPC with the animation
- `ani_index` - animation index

## Mdl_SetVisible
Set NPCs visibility

```dae
func void Mdl_SetVisible( var C_NPC npc, var int isVisible ) {};
```

- `npc` - specified NPC
- `isVisible` - [TRUE, FALSE] `TRUE` - visible, `FALSE` - invisible

## Mdl_ApplyOverlayMds_AtFirst
Applies or moves existing overlay to the top of the list

```dae
func void Mdl_ApplyOverlayMds_AtFirst( var string mdsName ) {};
```

- `mdsName` - name of the overlay

## Mdl_SetNpcSpeedMultiplier
Sets a multipler for animation speed
1.0 = 100% speed (normal speed)

```dae
func void Mdl_SetNpcSpeedMultiplier( var C_Npc npc, var float multiplier ) {};
```

- `npc` - npc to be affected
- `multiplier` - speed of the animation

## Mdl_ResetNpcSpeedMultiplier
Resets the animation speed of an NPC

```dae
func void Mdl_ResetNpcSpeedMultiplier( var C_Npc npc ) {};
```

- `npc` - npc to be affected

## Externals with docu comments

```dae
/// Returns animation's index for specified NPC based on animation's name
///
/// @param npc NPC with the animation
/// @param ani_name name of the animation in allcaps
/// @return animation index
func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};

/// Returns animation's name for specified NPC based on animation's index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return animation name
func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};

/// Checks wheter animation exists
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return animation name
func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};

/// Checks wheter animation is active (wheter it is currently played)
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return `TRUE` if the animation is playing, `FALSE` if it is not playing
func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};

/// Set framerate for all animations
///
/// @param npc NPC with the animation
/// @param fps framerate
func void Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};

/// Reset framerate for all animations to default value
///
/// @param npc NPC with the animation
func void Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};

/// Set framerate for animtion specified by animation index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @param fps framerate
func void Mdl_SetAnimationFPS( var C_NPC npc, var int ani_index, var float fps ) {};

/// Reset framerate to default for animtion specified by animation index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
func void Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};

/// Set NPCs visibility
///
/// @param npc specified NPC
/// @param isVisible [TRUE, FALSE] `TRUE` - visible, `FALSE` - invisible
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

---
title: MDL functions
---
# MDL - model functions
Functions to tweak animation and other model related settings.

## `Mdl_GetAnimationIndex`
!!! function "`Mdl_GetAnimationIndex`"
    Returns animation's index for specified NPC based on animation's name

    ```dae
    func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_name` - name of the animation in uppercase
    - `return` - animation index

## `Mdl_GetAnimationName`
!!! function "`Mdl_GetAnimationName`"
    Returns animation's name for specified NPC based on animation's index

    ```dae
    func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_index` - animation index
    - `return` - animation name

## `Mdl_AnimationIsExists`
!!! function "`Mdl_AnimationIsExists`"
    Checks whether animation exists

    ```dae
    func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_index` - animation index
    - `return` - animation name

## `Mdl_AnimationIsActive`
!!! function "`Mdl_AnimationIsActive`"
    Checks whether animation is active (whether it is currently played)

    ```dae
    func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_index` - animation index
    - `return` - `TRUE` if the animation is playing, `FALSE` if it is not playing

## `Mdl_SetAllAnimationsFPS`
!!! function "`Mdl_SetAllAnimationsFPS`"
    Set framerate for all animations

    ```dae
    func void Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};
    ```

    - `npc` - NPC with the animation
    - `fps` - framerate

## `Mdl_ResetAllAnimationsFPS`
!!! function "`Mdl_ResetAllAnimationsFPS`"
    Reset framerate for all animations to default value

    ```dae
    func void Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};
    ```

    - `npc` - NPC with the animation

## `Mdl_SetAnimationFPS`
!!! function "`Mdl_SetAnimationFPS`"
    Set framerate for animation specified by animation index

    ```dae
    func void Mdl_SetAnimationFPS( var C_NPC npc, var int ani_index, var float fps ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_index` - animation index
    - `fps` - framerate

## `Mdl_ResetAnimationFPS`
!!! function "`Mdl_ResetAnimationFPS`"
    Reset framerate to default for animation specified by animation index

    ```dae
    func void Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};
    ```

    - `npc` - NPC with the animation
    - `ani_index` - animation index

## `Mdl_SetVisible`
!!! function "`Mdl_SetVisible`"
    Set NPCs visibility

    ```dae
    func void Mdl_SetVisible( var C_NPC npc, var int isVisible ) {};
    ```

    - `npc` - specified NPC
    - `isVisible` - `TRUE` - visible, `FALSE` - invisible

## `Mdl_ApplyOverlayMds_AtFirst`
!!! function "`Mdl_ApplyOverlayMds_AtFirst`"
    Applies or moves existing overlay to the top of the list

    ```dae
    func void Mdl_ApplyOverlayMds_AtFirst( var string mdsName ) {};
    ```

    - `mdsName` - name of the overlay

## `Mdl_SetNpcSpeedMultiplier`
!!! function "`Mdl_SetNpcSpeedMultiplier`"
    Sets a multiplier for animation speed
    1.0 = 100% speed (normal speed)

    ```dae
    func void Mdl_SetNpcSpeedMultiplier( var C_Npc npc, var float multiplier ) {};
    ```

    - `npc` - npc to be affected
    - `multiplier` - speed of the animation

## `Mdl_ResetNpcSpeedMultiplier`
!!! function "`Mdl_ResetNpcSpeedMultiplier`"
    Resets the animation speed of an NPC

    ```dae
    func void Mdl_ResetNpcSpeedMultiplier( var C_Npc npc ) {};
    ```

    - `npc` - npc to be affected

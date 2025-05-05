---
title: AI functions
---
# AI functions
Functions for working with NPCs AI queue. Every function is added to the AI queue of the specified NPC and executed in the order they were added.

## Functions

### `AI_AimAt`
!!! function "`AI_AimAt`"
    Aims at the target with a ranged weapon (have to be drawn first)
    ```dae
    func void AI_AimAt(var C_NPC attacker, var C_NPC target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC attacker` - instance of the attacker
    - `#!dae var C_NPC target` - C_NPC instance of the target

### `AI_AlignToFP`
!!! function "`AI_AlignToFP`"
    Aligns the NPC to the Freepoint
    ```dae
    func void AI_AlignToFP(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_AlignToWP`
!!! function "`AI_AlignToWP`"
    Aligns the NPC to the Waypoint
    ```dae
    func void AI_AlignToWP(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_Attack`
!!! function "`AI_Attack`"
    Starts the combat AI (should be called in the ZS_Attack loop).
    Uses the internal target that can be set by `Npc_SetTarget()` and `Npc_GetNextTarget()`
    ```dae
    func void AI_Attack(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_CanSeeNpc`
!!! function "`AI_CanSeeNpc`"
    If `slf` can see `oth` starts given AI state function
    ```dae
    func void AI_CanSeeNpc(var C_NPC slf, var C_NPC oth, var func function) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the first NPC
    - `#!dae var C_NPC oth` - instance of the second NPC
    - `#!dae var func function` - AI state function to start (ZS_*)

### `AI_ContinueRoutine`
!!! function "`AI_ContinueRoutine`"
    Continues the daily routine.
    Includes standing up
    ```dae
    func void AI_ContinueRoutine(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_Defend`
!!! function "`AI_Defend`"
    Adds overlay message (`EV_DEFEND`) that ends when the NPC performs a parry triggered by another NPC's attack.
    ```dae
    func void AI_Defend(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_Dodge`
!!! function "`AI_Dodge`"
    Makes the NPC dodge a bit backward
    ```dae
    func void AI_Dodge(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_DrawWeapon`
!!! function "`AI_DrawWeapon`"
    Draws the equipped melee weapon
    ```dae
    func void AI_DrawWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_DropItem`
!!! function "`AI_DropItem`"
    Drops the item with the specified item ID on the ground (works only in dialogs)
    ```dae
    func void AI_DropItem(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - item instance name

### `AI_EquipArmor`
!!! function "`AI_EquipArmor`"
    Equips armor from the inventory
    ```dae
    func void AI_EquipArmor(var C_NPC npc, var C_ITEM armor) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_ITEM armor` - armor instance to equip

### `AI_EquipBestArmor`
!!! function "`AI_EquipBestArmor`"
    Equips the best armor available in the NPCs inventory
    ```dae
    func void AI_EquipBestArmor(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_EquipBestMeleeWeapon`
!!! function "`AI_EquipBestMeleeWeapon`"
    Equips the best melee weapon available in the NPCs inventory
    ```dae
    func void AI_EquipBestMeleeWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_EquipBestRangedWeapon`
!!! function "`AI_EquipBestRangedWeapon`"
    Equips the best ranged weapon available in the NPCs inventory
    ```dae
    func void AI_EquipBestRangedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_FinishingMove`
!!! function "`AI_FinishingMove`"
    Makes `attacker` kill `target` with a finishing move if possible
    ```dae
    func void AI_FinishingMove(var C_NPC attacker, var C_NPC target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC attacker` - instance of the attacking NPC
    - `#!dae var C_NPC target` - instance of the target NPC

### `AI_Flee`
!!! function "`AI_Flee`"
    Makes the NPC flee from the target
    ```dae
    func void AI_Flee(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_GotoFP`
!!! function "`AI_GotoFP`"
    Finds the nearest available freepoint near the NPC, moves there, and aligns accordingly
    ```dae
    func void AI_GotoFP(var C_NPC npc, var string fpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string fpname` - name of the freepoint (could be only the middle part of the name: `FP_` + `fpname` + `_01`)

### `AI_GotoNextFP`
!!! function "`AI_GotoNextFP`"
    Finds an available freepoint within near the NPC (not the nearest one), moves there, and aligns accordingly.
    Useful for NPCs that are already at the freepoint
    ```dae
    func void AI_GotoNextFP(var C_NPC npc, var string fpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string fpname` - name of the freepoint (could be only the middle part of the name: `FP_` + `fpname` + `_01`)

### `AI_GotoItem`
!!! function "`AI_GotoItem`"
    Makes the NPC go to the specified item
    ```dae
    func void AI_GotoItem(var C_NPC npc, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_ITEM itm` - instance of the item

### `AI_GotoNpc`
!!! function "`AI_GotoNpc`"
    Makes `slf` go to `oth`
    ```dae
    func void AI_GotoNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_GotoSound`
!!! function "`AI_GotoSound`"
    Makes NPC go to the source of the sound
    ```dae
    func void AI_GotoSound(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_GotoWP`
!!! function "`AI_GotoWP`"
    NPC goes to the specified waypoint
    ```dae
    func void AI_GotoWP(var C_NPC npc, var string wpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string wpname` - name of the waypoint

### `AI_LookAt`
!!! function "`AI_LookAt`"
    Makes NPC look at the target object (only head moves)
    ```dae
    func void AI_LookAt(var C_NPC npc, var string target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string target` - name of the object to look at

### `AI_LookAtNpc`
!!! function "`AI_LookAtNpc`"
    Makes `slf` looks at `oth` (only head moves)
    ```dae
    func void AI_LookAtNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_Output`
!!! function "`AI_Output`"
    Makes `slf` say a line of text to `oth`.
    The actual text is defined by the comment after the function call
    ```dae
    func void AI_Output(var C_NPC slf, var C_NPC oth, var string outputname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - C_NPC instance of the target NPC
    - `#!dae var string outputname` - name of the output and the associated .wav file

    !!! Example
        ```dae
        AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //There you are again! (smiling) I never thought the two of us would meet again.
        ```

### `AI_OutputSVM`
!!! function "`AI_OutputSVM`"
    Makes `slf` say an SVM text to `oth`
    ```dae
    func void AI_OutputSVM(var C_NPC slf, var C_NPC oth, var string svmname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - C_NPC instance of the target NPC
    - `#!dae var string svmname` - name of the SVM

### `AI_OutputSVM_Overlay`
!!! function "`AI_OutputSVM_Overlay`"
    Makes `slf` say an SVM text to `oth`, but does not wait for the SVM to finish before executing the next AI command.
    Useful for comments right before and during combat
    ```dae
    func void AI_OutputSVM_Overlay(var C_NPC slf, var C_NPC oth, var string svmname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - C_NPC instance of the target NPC
    - `#!dae var string svmname` - name of the SVM

### `AI_PlayAni`
!!! function "`AI_PlayAni`"
    Plays an animation on the NPC
    ```dae
    func void AI_PlayAni(var C_NPC npc, var string aniname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string aniname` - name of the animation UPPERCASE

### `AI_PlayAniBS`
!!! function "`AI_PlayAniBS`"
    Plays an animation on the NPC and sets its body state
    ```dae
    func void AI_PlayAniBS(var C_NPC npc, var string aniname, var int bodystate) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string aniname` - name of the animation UPPERCASE
    - `#!dae var int bodystate` - body state

### `AI_PlayFX`
!!! function "`AI_PlayFX`"
    Plays a visual effect (VFX)
    ```dae
    func void AI_PlayFX(var C_NPC origin, var instance target, var string effect) 
    ```

    **Parameters**  

    - `#!dae var C_NPC origin` - NPC who is the effect origin and also to whose AI queue the function is added
    - `#!dae var instance target` - instance of the effect target object
    - `#!dae var string effect` - name of the visual effect

    !!! Warning
        The function is only present in Gothic 2.

### `AI_StopFX`
!!! function "`AI_StopFX`"
    Stops a visual effect (VFX)
    ```dae
    func void AI_StopFX(var C_NPC npc, var string effect) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string effect` - name of the visual effect

    !!! Warning
        The function is only present in Gothic 2.

### `AI_PointAt`
!!! function "`AI_PointAt`"
    Makes NPC point at the target object
    ```dae
    func void AI_PointAt(var C_NPC npc, var string target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae name` - name of the waypoint or object

### `AI_PointAtNpc`
!!! function "`AI_PointAtNpc`"
    Makes `slf` point with hand at `oth`
    ```dae
    func void AI_PointAtNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_PrintScreen`
!!! function "`AI_PrintScreen`"
    Prints a message on the screen. The function is queued on `hero` AI queue.
    ```dae
    func int AI_PrintScreen(var string text, var int posx, var int posy, var string font, var int timesec) 
    ```

    **Parameters**  

    - `#!dae var string text` - message to print
    - `#!dae var int posx` - x position as percent (-1 to center)
    - `#!dae var int posy` - y position as percent (-1 to center)
    - `#!dae var string font` - font to use
    - `#!dae var int timesec` - display duration in seconds

    !!! Warning
        The function is only present in Gothic 2.

### `AI_ProcessInfos`
!!! function "`AI_ProcessInfos`"
    Opens a dialog window with NPS's C_INFO instances if its state is `ZS_TALK`.    
    When called on `hero`, the dialog window for the currently contrloled NPC instance will be opened.
    ```dae
    func void AI_ProcessInfos(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_ReadyMeleeWeapon`
!!! function "`AI_ReadyMeleeWeapon`"
    Draws the equipped melee weapon
    ```dae
    func void AI_ReadyMeleeWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_ReadyRangedWeapon`
!!! function "`AI_ReadyRangedWeapon`"
    Draws the equipped ranged weapon
    ```dae
    func void AI_ReadyRangedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_ReadySpell`
!!! function "`AI_ReadySpell`"
    Readies a spell
    ```dae
    func void AI_ReadySpell(var C_NPC npc, var int spellid, var int investmana) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int spellid` - ID of the spell
    - `#!dae var int investmana` - amount of mana to invest

### `AI_UnreadySpell`
!!! function "`AI_UnreadySpell`"
    Unreadies a spell
    ```dae
    func void AI_UnreadySpell(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_RemoveWeapon`
!!! function "`AI_RemoveWeapon`"
    Puts away the drawn weapon
    ```dae
    func void AI_RemoveWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_SetNpcsToState`
!!! function "`AI_SetNpcsToState`"
    Sets all NPCs within a radius of x cm to the specified ZS state
    ```dae
    func void AI_SetNpcsToState(var C_NPC npc, var func state, var int radius) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var func state` - ZS state function
    - `#!dae var int radius` - radius in cm

### `AI_SetWalkmode`
!!! function "`AI_SetWalkmode`"
    Specifies the walk mode (run, walk, sneak) of the NPC
    ```dae
    func void AI_SetWalkmode(var C_NPC npc, var int mode) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int mode` - walk mode

### `AI_ShootAt`
!!! function "`AI_ShootAt`"
    Shoots at the target with a ranged weapon
    ```dae
    func void AI_ShootAt(var C_NPC attacker, var C_NPC target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC attacker` - instance of the attacker NPC
    - `#!dae var C_NPC target` - instance of the target NPC

### `AI_Snd_Play`
!!! function "`AI_Snd_Play`"
    Plays a sound (queued)
    ```dae
    func void AI_Snd_Play(var C_NPC npc, var string sndName) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to whose AI queue the function is added
    - `#!dae var string sndName` - C_SFX instance name

    !!! Warning
        The function is only present in Gothic 2.

### `AI_Snd_Play3D`
!!! function "`AI_Snd_Play3D`"
    Plays a sound at the position of the npc (queued)
    ```dae
    func void AI_Snd_Play3D(var C_NPC npc, var C_NPC origin, var string sndName) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to whose AI queue the function is added
    - `#!dae var C_NPC origin` - instance of the NPC whose position the sound is played at
    - `#!dae var string sndName` - C_SFX instance name

    !!! Warning
        The function is only present in Gothic 2.

### `AI_StandUp`
!!! function "`AI_StandUp`"
    Makes NPC stand up from a sitting or lying position
    ```dae
    func void AI_StandUp(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_StandUpQuick`
!!! function "`AI_StandUpQuick`"
    Makes NPC stand up from a sitting or lying position without playing transition animations
    ```dae
    func void AI_StandUpQuick(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_StartState`
!!! function "`AI_StartState`"
    Puts the NPC into the specified AI state (ZS_*)
    ```dae
    func void AI_StartState(var C_NPC npc, var func state, var int statebehaviour, var string wpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var func state` - function representing the AI state (ZS_*)
    - `#!dae var int statebehaviour` - `0` to end the current state immediately, `1` to finish it properly
    - `#!dae var string wpname` - name of the waypoint to do the action at

### `AI_StopAim`
!!! function "`AI_StopAim`"
    Makes the NPC stop aiming at the target
    ```dae
    func void AI_StopAim(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_StopLookAt`
!!! function "`AI_StopLookAt`"
    Makes npc stop looking at a target and returns to the default forward gaze
    ```dae
    func void AI_StopLookAt(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_StopPointAt`
!!! function "`AI_StopPointAt`"
    Makes the NPC stop pointing at the target
    ```dae
    func void AI_StopPointAt(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_StopProcessInfos`
!!! function "`AI_StopProcessInfos`"
    Exits the dialog window of the NPC
    ```dae
    func void AI_StopProcessInfos(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_TakeItem`
!!! function "`AI_TakeItem`"
    The NPC goes to the specified item and takes it
    ```dae
    func void AI_TakeItem(var C_NPC npc, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_ITEM itm` - instance of the item

### `AI_Teleport`
!!! function "`AI_Teleport`"
    Teleports the NPC to the specified location
    ```dae
    func void AI_Teleport(var C_NPC npc, var string waypoint) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string waypoint` - name of the waypoint or object to teleport to

### `AI_TurnAway`
!!! function "`AI_TurnAway`"
    Makes `slf` turn away from `oth`
    ```dae
    func void AI_TurnAway(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_TurnToNpc`
!!! function "`AI_TurnToNpc`"
    Makes `slf` turn torwards `oth`
    ```dae
    func void AI_TurnToNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_TurnToSound`
!!! function "`AI_TurnToSound`"
    Makes NPC turn to the source of the sound
    ```dae
    func void AI_TurnToSound(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_UnequipArmor`
!!! function "`AI_UnequipArmor`"
    Unequips the current armor
    ```dae
    func void AI_UnequipArmor(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_UnequipWeapons`
!!! function "`AI_UnequipWeapons`"
    Unequips all weapons
    ```dae
    func void AI_UnequipWeapons(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_UseItem`
!!! function "`AI_UseItem`"
    Makes the NPC use an item to the end of its use state
    ```dae
    func void AI_UseItem(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - name of the item instance

### `AI_UseItemToState`
!!! function "`AI_UseItemToState`"
    Makes the NPC use an item until it reaches the target state
    ```dae
    func void AI_UseItemToState(var C_NPC npc, var int iteminstance, var int state) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - name of the item instance
    - `#!dae var int state` - target state (1 for S1 etc. -1 to end the action)

### `AI_UseMob`
!!! function "`AI_UseMob`"
    Uses an intetactive object with the specified schema name until it reaches the target state.    
    If the target state is already present, the NPC will move to the MOB but do nothing
    ```dae
    func int AI_UseMob(var C_NPC npc, var string schemename, var int targetstate) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string schemename` - name of the schema (e.g. `BENCH`)
    - `#!dae var int targetstate` - target state  (1 for S1 etc. -1 to end the action)

    **Return value**  
    The function returns TRUE if the mob was used, FALSE otherwise

### `AI_Wait`
!!! function "`AI_Wait`"
    Makes NPC wait for a specified number of seconds
    ```dae
    func void AI_Wait(var C_NPC npc, var float timesec) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var float timesec` - float number of seconds to wait

### `AI_WaitMS`
!!! function "`AI_WaitMS`"
    Makes NPC wait for a specified number of milliseconds
    ```dae
    func void AI_WaitMS(var C_NPC npc, var int timems) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int timems` - number of milliseconds to wait

### `AI_WaitTillEnd`
!!! function "`AI_WaitTillEnd`"
    Makes `slf` wait until `oth` finishes its current AI command (does not work with AI overlays)
    ```dae
    func void AI_WaitTillEnd(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae other` - instance of the other NPC

## Deprecated

### `AI_Ask`
!!! function "`AI_Ask`"
    Probably relic of the old dialog system
    ```dae
    func void AI_Ask(var C_NPC npc, var func anseryes, var func answerno) 
    ```

### `AI_AskText`
!!! function "`AI_AskText`"
    Probably relic of the old dialog system
    ```dae
    func void AI_AskText(var C_NPC npc, var func funcyes, var func funcno, var string stryes, var string strno) 
    ```

### `AI_WaitForQuestion`
!!! function "`AI_WaitForQuestion`"
    Probably relic of the old dialog system
    ```dae
    func void AI_WaitForQuestion(var C_NPC npc, var func scriptfunc) 
    ```

### `AI_CombatReactToDamage`
!!! function "`AI_CombatReactToDamage`"
    Does nothing
    ```dae
    func void AI_CombatReactToDamage(var instance n0) 
    ```

### `AI_PlayCutscene`
!!! function "`AI_PlayCutscene`"
    Relic of the cutscene system   
    Starts a cutscene with the specified name
    ```dae
    func void AI_PlayCutscene(var C_NPC npc, var string csname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string csname` - string name of the cutscene

### `AI_Quicklook`
!!! function "`AI_Quicklook`"
    `T_QLOOK` animation is missing   
    Makes `slf` looks at `oth` for 2 seconds (only head moves)    
    ```dae
    func void AI_Quicklook(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_TakeMob`
!!! function "`AI_TakeMob`"
    Relic of the mob carrying system
    ```dae
    func void AI_TakeMob(var C_NPC npc, var string mobname) 
    ```

### `AI_DropMob`
!!! function "`AI_DropMob`"
    Relic of the mob carrying system
    ```dae
    func void AI_DropMob(var C_NPC npc) 

### `AI_WhirlAround`
!!! function "`AI_WhirlAround`"
    `S_SURPRISE` animation is missing   
    Makes `slf` quickly turn to `oth` and play a surprise animation
    ```dae
    func void AI_WhirlAround(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

### `AI_WhirlAroundToSource`
!!! function "`AI_WhirlAroundToSource`"
    `S_SURPRISE` animation is missing   
    Makes NPC quickly turn to sound source and play a surprise animation
    ```dae
    func void AI_WhirlAroundToSource(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `AI_LookForItem`
!!! function "`AI_LookForItem`"
    Not used in the original scripts, does nothing   
    NPC searches for the item with the specified instance name
    ```dae
    func void AI_LookForItem(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - instance name of the item

    !!! Warning
        The function is only present in Gothic 1.

## zParserExtender
zParserExtender implements quite a few new [AI external functions](../extenders/zparserextender/externals/ai.md).
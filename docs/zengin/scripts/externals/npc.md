---
title: NPC functions
---
# NPC - character functions
NPC related functions.

## Functions

### `CreateInvItem`
!!! function "`CreateInvItem`"
    Adds the item to the NPC's inventory
    ```dae
    func void CreateInvItem(var C_NPC npc, var int itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int itm` - instance name of the item

    **Globals**  

    - `#!dae item` - set to the created item

### `CreateInvItems`
!!! function "`CreateInvItems`"
    Adds the specified number of items to the NPC's inventory
    ```dae
    func void CreateInvItems(var C_NPC npc, var int itm, var int ammount) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int itm` - instance name of the item
    - `#!dae var int ammount` - number of items to create

### `EquipItem`
!!! function "`EquipItem`"
    Creates and equips the item to the NPC
    ```dae
    func void EquipItem(var C_NPC npc, var int itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int itm` - instance name of the item

### `Npc_CanSeeItem`
!!! function "`Npc_CanSeeItem`"
    Checks if NPC can see item, includes angle check
    ```dae
    func int Npc_CanSeeItem(var C_NPC npc, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_ITEM itm` - instance of the item

    **Return value**  
    The function returns TRUE if can see, FALSE otherwise

### `Npc_CanSeeNpc`
!!! function "`Npc_CanSeeNpc`"
    Checks if `slf` can see `oth`, includes angle check
    ```dae
    func int Npc_CanSeeNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if can see, FALSE otherwise

### `Npc_CanSeeNpcFreeLOS`
!!! function "`Npc_CanSeeNpcFreeLOS`"
    Checks if `slf` can see `oth` without considering angle (line of sight check)
    ```dae
    func int Npc_CanSeeNpcFreeLOS(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if can see, FALSE otherwise

### `Npc_CanSeeSource`
!!! function "`Npc_CanSeeSource`"
    Checks if NPC can see the source of a sound, includes angle check
    ```dae
    func int Npc_CanSeeSource(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if can see, FALSE otherwise

### `Npc_ChangeAttribute`
!!! function "`Npc_ChangeAttribute`"
    Changes the value of an attribute for the NPC
    ```dae
    func void Npc_ChangeAttribute(var C_NPC npc, var int attribute, var int value) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int attribute` - attribute to change (`ATR_` constants)
    - `#!dae var int value` - value to change by

### `Npc_KnowsPlayer`
!!! function "`Npc_KnowsPlayer`"
    Checks if the NPC knows the player (must be set by `Npc_SetKnowsPlayer`)
    ```dae
    func int Npc_KnowsPlayer(var C_NPC npc, var C_NPC player) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_NPC player` - instance of the player

    **Return value**  
    The function returns TRUE if the NPC knows the player, FALSE otherwise

### `Npc_SetKnowsPlayer`
!!! function "`Npc_SetKnowsPlayer`"
    Sets the NPC to know the player
    ```dae
    func void Npc_SetKnowsPlayer(var C_NPC npc, var C_NPC player) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_NPC player` - instance of the player

### `Npc_CheckInfo`
!!! function "`Npc_CheckInfo`"
    Checks if the NPC has valid information (C_INFO) for the player
    ```dae
    func int Npc_CheckInfo(var C_NPC npc, var int important) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int important` - 1 to check for important information, 0 for unimportant

    **Return value**  
    The function returns TRUE if the NPC has information, FALSE otherwise

### `NPC_GiveInfo`
!!! function "`NPC_GiveInfo`"
    Checks if the NPC has valid information (C_INFO) for the player, and if so, plays them
    ```dae
    func int NPC_GiveInfo(var C_NPC npc, var int important) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int important` - 1 to check for important information, 0 for unimportant

    **Return value**  
    The function returns TRUE if the NPC has information, FALSE otherwise

### `Npc_KnowsInfo`
!!! function "`Npc_KnowsInfo`"
    Checks if the NPC knows the specified C_INFO
    ```dae
    func int Npc_KnowsInfo(var C_NPC npc, var int infoinstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int infoinstance` - C_INFO instance name

    **Return value**  
    The function returns TRUE if the NPC knows the info, FALSE otherwise

### `Npc_ClearAIQueue`
!!! function "`Npc_ClearAIQueue`"
    Clears the AI queue of the NPC
    ```dae
    func void Npc_ClearAIQueue(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `Npc_ClearInventory`
!!! function "`Npc_ClearInventory`"
    Clears the NPC's inventory, leaves only equipped and mission items
    ```dae
    func void Npc_ClearInventory(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    !!! Warning
        This function is only available in Gothic 2

### `Npc_HasSpell`
!!! function "`Npc_HasSpell`"
    Checks if the NPC has a specified spell in inventory
    ```dae
    func int Npc_HasSpell(var C_NPC npc, var int spellid) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int spellid` - ID of the spell

    **Return value**  
    The function returns TRUE if the NPC has the spell, FALSE otherwise

### `Npc_ExchangeRoutine`
!!! function "`Npc_ExchangeRoutine`"
    Exchanges the NPC's daily routine
    ```dae
    func void Npc_ExchangeRoutine(var C_NPC npc, var string routine) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string routine` - name of the new routine

### `Npc_GetActiveSpell`
!!! function "`Npc_GetActiveSpell`"
    Returns the active spell for the NPC (self or other)
    ```dae
    func int Npc_GetActiveSpell(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns spell ID, -1 if no active spell

### `Npc_GetActiveSpellCat`
!!! function "`Npc_GetActiveSpellCat`"
    Gets the category/type of the spell that the NPC currently has active
    ```dae
    func int Npc_GetActiveSpellCat(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to check

    **Return value**  
    The function returns category ID of the currently active spell

### `Npc_GetActiveSpellIsScroll`
!!! function "`Npc_GetActiveSpellIsScroll`"
    Checks if the spell currently active on the NPC's hand is from a scroll
    ```dae
    func int Npc_GetActiveSpellIsScroll(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to check

    **Return value**  
    The function returns TRUE if active spell is from a scroll, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Npc_SetActiveSpellInfo`
!!! function "`Npc_SetActiveSpellInfo`"
    Sets the instance to which the NPC transforms into, durring the transformation spell
    ```dae
    func int Npc_SetActiveSpellInfo(var C_NPC npc, var int instancename) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int instancename` - name of the instance the NPC transforms into

    **Return value**  
    The function returns nothing, external is wrongly defined as int

### `Npc_GetAttitude`
!!! function "`Npc_GetAttitude`"
    Gets the attitude of the `slf` towards the `oth`
    ```dae
    func int Npc_GetAttitude(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns attitude value (`ATT_` constants)

### `Npc_GetPermAttitude`
!!! function "`Npc_GetPermAttitude`"
    Gets the permanent attitude of the `slf` towards the `oth`
    ```dae
    func int Npc_GetPermAttitude(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns permanent attitude value (`ATT_` constants)

### `Npc_GetBodyState`
!!! function "`Npc_GetBodyState`"
    Gets the body state of the NPC
    ```dae
    func int Npc_GetBodyState(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns current body state (`BS_` constants)

### `Npc_GetComrades`
!!! function "`Npc_GetComrades`"
    Gets the number of NPCs with the same guild as `npc` within `PERC_ASSESSENEMY` range
    ```dae
    func int Npc_GetComrades(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns number of NPCs with the same guild within range

### `Npc_GetDetectedMob`
!!! function "`Npc_GetDetectedMob`"
    Gets the schema name of the MOB used by the NPC
    ```dae
    func string Npc_GetDetectedMob(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns schema name of the MOB (e.g. `BEDHIGH`)

### `Npc_IsDetectedMobOwnedByNpc`
!!! function "`Npc_IsDetectedMobOwnedByNpc`"
    Checks if MOB used by `slf` is owned by `oth`
    ```dae
    func int Npc_IsDetectedMobOwnedByNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if the MOB is owned by the other NPC, FALSE otherwise

### `Npc_IsDetectedMobOwnedByGuild`
!!! function "`Npc_IsDetectedMobOwnedByGuild`"
    Checks if MOB used by `npc` is owned by the guild
    ```dae
    func int Npc_IsDetectedMobOwnedByGuild(var C_NPC npc, var int guild) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int guild` - guild ID

    **Return value**  
    The function returns TRUE if the MOB is owned by the guild, FALSE otherwise

### `Npc_GetDistToItem`
!!! function "`Npc_GetDistToItem`"
    Gets the distance between the NPC and an item (in cm)
    ```dae
    func int Npc_GetDistToItem(var C_NPC npc, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_ITEM itm` - instance of the item

    **Return value**  
    The function returns distance between NPC and item in cm

### `Npc_GetDistToNpc`
!!! function "`Npc_GetDistToNpc`"
    Gets the distance between two NPCs (in cm)
    ```dae
    func int Npc_GetDistToNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns distance between NPCs in cm

### `Npc_GetDistToPlayer`
!!! function "`Npc_GetDistToPlayer`"
    Gets the distance between the NPC and the player (in cm)
    ```dae
    func int Npc_GetDistToPlayer(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns distance between NPC and player in cm

### `Npc_GetDistToWP`
!!! function "`Npc_GetDistToWP`"
    Gets the distance between the NPC and a waypoint (in cm)
    ```dae
    func int Npc_GetDistToWP(var C_NPC npc, var string wpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string wpname` - name of the waypoint

    **Return value**  
    The function returns distance between NPC and waypoint in cm

### `Npc_GetEquippedArmor`
!!! function "`Npc_GetEquippedArmor`"
    Gets the equipped armor of the NPC
    ```dae
    func C_ITEM Npc_GetEquippedArmor(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns C_ITEM instance of the equipped armor, NULL if no armor

### `Npc_GetEquippedMeleeWeapon`
!!! function "`Npc_GetEquippedMeleeWeapon`"
    Gets the equipped melee weapon of the NPC
    ```dae
    func C_ITEM Npc_GetEquippedMeleeWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns C_ITEM instance of the equipped melee weapon, NULL if no weapon

### `Npc_GetEquippedRangedWeapon`
!!! function "`Npc_GetEquippedRangedWeapon`"
    Gets the equipped ranged weapon of the NPC
    ```dae
    func C_ITEM Npc_GetEquippedRangedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns C_ITEM instance of the equipped ranged weapon, NULL if no weapon

### `Npc_GetGuildAttitude`
!!! function "`Npc_GetGuildAttitude`"
    Gets the guild-based attitude between two NPCs based on their guild memberships.   
    This represents how members of different guilds feel about each other.
    ```dae
    func int Npc_GetGuildAttitude(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC whose guild attitude should be checked
    - `#!dae var C_NPC oth` - second NPC to check attitude against

    **Return value**  
    The function returns attitude value between the guilds of the two NPCs

### `Npc_GetHeightToItem`
!!! function "`Npc_GetHeightToItem`"
    Gets the height difference between the NPC and an item (in cm)
    ```dae
    func int Npc_GetHeightToItem(var C_NCP npc, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NCP npc` - instance of the NPC
    - `#!dae var C_ITEM itm` - instance of the item

    **Return value**  
    The function returns height difference between NPC and item in cm

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetHeightToNpc`
!!! function "`Npc_GetHeightToNpc`"
    Gets the height difference between two NPCs (in cm)
    ```dae
    func int Npc_GetHeightToNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns height difference between NPCs in cm

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetInvItem`
!!! function "`Npc_GetInvItem`"
    Checks if the NPC has an item in its inventory
    ```dae
    func int Npc_GetInvItem(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - instance name of the item

    **Globals**  

    - `#!dae item` - set to the item if found

    **Return value**  
    The function returns TRUE if the NPC has the item, FALSE otherwise

### `Npc_GetInvItemBySlot`
!!! function "`Npc_GetInvItemBySlot`"
    Checks if the NPC has an item in slot
    ```dae
    func int Npc_GetInvItemBySlot(var C_NPC npc, var int category, var int slotnr) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int category` - category of the item
    - `#!dae var int slotnr` - slot number

    **Globals**  

    - `#!dae item` - set to the item if found

    **Return value**  
    The function returns TRUE if the NPC has the item, FALSE otherwise

### `Npc_RemoveInvItem`
!!! function "`Npc_RemoveInvItem`"
    Removes the item from the NPC's inventory
    ```dae
    func int Npc_RemoveInvItem(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - instance name of the item

    **Return value**  
    The function returns TRUE if the item was removed, FALSE otherwise

### `Npc_RemoveInvItems`
!!! function "`Npc_RemoveInvItems`"
    Removes the specified number of items from the NPC's inventory
    ```dae
    func int Npc_RemoveInvItems(var C_NPC npc, var int iteminstance, var int ammount) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - instance name of the item
    - `#!dae var int ammount` - number of items to remove

    **Return value**  
    The function returns TRUE if the items were removed, FALSE otherwise

### `Npc_GetLastHitSpellCat`
!!! function "`Npc_GetLastHitSpellCat`"
    Gets the category of the last spell that hit/affected this NPC.
    ```dae
    func int Npc_GetLastHitSpellCat(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to check spell category for

    **Return value**  
    The function returns category ID of the last spell that hit the NPC

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetLastHitSpellID`
!!! function "`Npc_GetLastHitSpellID`"
    Gets the ID of the last spell that hit/affected this NPC.
    ```dae
    func int Npc_GetLastHitSpellID(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to check spell hits for

    **Return value**  
    The function returns ID of the last spell that hit the NPC, returns spell number that can be matched against spell definitions

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetLookAtTarget`
!!! function "`Npc_GetLookAtTarget`"
    Gets the NPC the `npc` is looking at
    ```dae
    func C_NPC Npc_GetLookAtTarget(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns NPC the `npc` is looking at

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetNearestWP`
!!! function "`Npc_GetNearestWP`"
    Gets the nearest waypoint to the NPC
    ```dae
    func string Npc_GetNearestWP(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns name of the nearest waypoint

### `Npc_GetNextWP`
!!! function "`Npc_GetNextWP`"
    Gets the second nearest waypoint to the NPC
    ```dae
    func string Npc_GetNextWP(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns name of the second nearest waypoint

### `Npc_GetPortalGuild`
!!! function "`Npc_GetPortalGuild`"
    Gets the guild assigned to the room (portal) the NPC is in
    ```dae
    func int Npc_GetPortalGuild(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns guild assigned to the portal, -1 if no guild

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetPortalOwner`
!!! function "`Npc_GetPortalOwner`"
    Gets the owner of the room (portal) the NPC is in
    ```dae
    func C_NPC Npc_GetPortalOwner(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns instance of the owner NPC, NULL if no owner

    !!! Warning
        This function is only available in Gothic 2

### `Npc_GetReadiedWeapon`
!!! function "`Npc_GetReadiedWeapon`"
    Gets the readied weapon of the NPC
    ```dae
    func C_ITEM Npc_GetReadiedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns C_ITEM instance of the readied weapon, NULL if no weapon

### `Npc_GetStateTime`
!!! function "`Npc_GetStateTime`"
    Gets the state time of the NPC
    ```dae
    func int Npc_GetStateTime(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns state time in seconds

### `Npc_SetStateTime`
!!! function "`Npc_SetStateTime`"
    Sets the state time of the NPC
    ```dae
    func void Npc_SetStateTime(var C_NPC npc, var int timesec) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int timesec` - new state time in seconds

### `Npc_GetTalentSkill`
!!! function "`Npc_GetTalentSkill`"
    Gets the talent skill of the NPC (major talent value)
    ```dae
    func int Npc_GetTalentSkill(var C_NPC npc, var int talent) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int talent` - talent ID (`NPC_TALENT_` constants)

    **Return value**  
    The function returns skill value

### `Npc_GetTalentValue`
!!! function "`Npc_GetTalentValue`"
    Gets the talent value of the NPC (additional talent value)
    ```dae
    func int Npc_GetTalentValue(var C_NPC npc, var int talent) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int talent` - talent ID (`NPC_TALENT_` constants)

    **Return value**  
    The function returns talent value

### `Npc_SetTalentSkill`
!!! function "`Npc_SetTalentSkill`"
    Sets the talent skill of the NPC (major talent value)
    ```dae
    func void Npc_SetTalentSkill(var C_NPC npc, var int talent, var int value) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int talent` - talent ID (`NPC_TALENT_` constants)
    - `#!dae var int value` - new skill value

### `Npc_SetTalentValue`
!!! function "`Npc_SetTalentValue`"
    Sets the talent value of the NPC (additional talent value)
    ```dae
    func void Npc_SetTalentValue(var C_NPC npc, var int talent, var int value) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int talent` - talent ID (`NPC_TALENT_` constants)
    - `#!dae var int value` - new talent value

### `Npc_HasRangedWeaponWithAmmo`
!!! function "`Npc_HasRangedWeaponWithAmmo`"
    Checks if the NPC has equiped ranged weapon and ammo to use it
    ```dae
    func int Npc_HasRangedWeaponWithAmmo(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has ranged weapon with ammo, FALSE otherwise

### `Npc_HasEquippedWeapon`
!!! function "`Npc_HasEquippedWeapon`"
    Checks if the NPC has equiped any weapon
    ```dae
    func int Npc_HasEquippedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has equiped any weapon, FALSE otherwise

### `Npc_HasEquippedMeleeWeapon`
!!! function "`Npc_HasEquippedMeleeWeapon`"
    Checks if the NPC has equiped melee weapon
    ```dae
    func int Npc_HasEquippedMeleeWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has equiped melee weapon, FALSE otherwise

### `Npc_HasEquippedRangedWeapon`
!!! function "`Npc_HasEquippedRangedWeapon`"
    Checks if the NPC has equiped ranged weapon
    ```dae
    func int Npc_HasEquippedRangedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has equiped ranged weapon, FALSE otherwise

### `Npc_HasEquippedArmor`
!!! function "`Npc_HasEquippedArmor`"
    Checks if the NPC has equiped armor
    ```dae
    func int Npc_HasEquippedArmor(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has equiped armor, FALSE otherwise

### `Npc_HasReadiedWeapon`
!!! function "`Npc_HasReadiedWeapon`"
    Checks if the NPC has readied weapon
    ```dae
    func int Npc_HasReadiedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has readied weapon, FALSE otherwise

### `Npc_HasReadiedMeleeWeapon`
!!! function "`Npc_HasReadiedMeleeWeapon`"
    Checks if the NPC has readied melee weapon
    ```dae
    func int Npc_HasReadiedMeleeWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has readied melee weapon, FALSE otherwise

### `Npc_HasReadiedRangedWeapon`
!!! function "`Npc_HasReadiedRangedWeapon`"
    Checks if the NPC has readied ranged weapon
    ```dae
    func int Npc_HasReadiedRangedWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC has readied ranged weapon, FALSE otherwise

### `Npc_IsWayBlocked`
!!! function "`Npc_IsWayBlocked`"
    Checks if NPCs way is blocked (has enough space to move forward)
    ```dae
    func int Npc_IsWayBlocked(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the way is blocked, FALSE otherwise

### `Npc_IsAiming`
!!! function "`Npc_IsAiming`"
    Checks if `slf` is aiming at `oth`
    ```dae
    func int Npc_IsAiming(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if the NPC is aiming, FALSE otherwise

### `Npc_IsInFightMode`
!!! function "`Npc_IsInFightMode`"
    Cheks if NPC is in specified fight mode
    ```dae
    func int Npc_IsInFightMode(var C_NPC npc, var int mode) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int mode` - fight mode (`FMODE_` constants)

    **Return value**  
    The function returns TRUE if the NPC is in the fight mode, FALSE otherwise

### `Npc_SetAttitude`
!!! function "`Npc_SetAttitude`"
    Sets the attitude of the NPC
    ```dae
    func void Npc_SetAttitude(var C_NPC npc, var int attitude) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int attitude` - attitude value (`ATT_` constants)

### `Npc_SetTempAttitude`
!!! function "`Npc_SetTempAttitude`"
    Sets the temporary attitude of the NPC
    ```dae
    func void Npc_SetTempAttitude(var C_NPC npc, var int attitude) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int attitude` - attitude value (`ATT_` constants)

### `Npc_SetToFightMode`
!!! function "`Npc_SetToFightMode`"
    Sets the NPC to fight mode with the specified weapon (weapon is created)
    ```dae
    func void Npc_SetToFightMode(var C_NPC npc, var int weapon) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int weapon` - instance name of the weapon

### `Npc_SetToFistMode`
!!! function "`Npc_SetToFistMode`"
    Sets the NPC to fist fight mode (no weapon) e.g. for monsters
    ```dae
    func void Npc_SetToFistMode(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `Npc_AreWeStronger`
!!! function "`Npc_AreWeStronger`"
    Checks if `slf` and friends (we) are stronger than `oth` and friends (enemy)   
    Calculeted based on the following formula: `enemiesLevel >= 2*weLevel`
    ```dae
    func int Npc_AreWeStronger(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if we are stronger, FALSE otherwise

### `Npc_IsVoiceActive`
!!! function "`Npc_IsVoiceActive`"
    Checks if the NPC is currently talking
    ```dae
    func int Npc_IsVoiceActive(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is talking, FALSE otherwise

### `Npc_HasBodyFlag`
!!! function "`Npc_HasBodyFlag`"
    Checks if the NPC has a specified body flag
    ```dae
    func int Npc_HasBodyFlag(var C_NPC npc, var int flag) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int flag` - body flag (`BS_FLAG_` constants)

    **Return value**  
    The function returns TRUE if the NPC has the flag, FALSE otherwise

### `Npc_SetTarget`
!!! function "`Npc_SetTarget`"
    Sets the current target for the NPC
    ```dae
    func void Npc_SetTarget(var C_NPC npc, var C_NPC target) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var C_NPC target` - instance of the new target

### `Npc_GetTarget`
!!! function "`Npc_GetTarget`"
    Gets the target of the NPC
    ```dae
    func int Npc_GetTarget(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Globals**  

    - `#!dae other` - set to the target of the NPC

    **Return value**  
    The function returns TRUE if the target is set successfully, FALSE otherwise

### `Npc_GetNextTarget`
!!! function "`Npc_GetNextTarget`"
    Searches for a target for the NPC.
    ```dae
    func int Npc_GetNextTarget(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Globals**  

    - `#!dae other` - set to the target of the NPC if found

    **Return value**  
    The function returns TRUE if the target is found, FALSE otherwise

### `Npc_IsNextTargetAvailable`
!!! function "`Npc_IsNextTargetAvailable`"
    Checks if target is available for the NPC, if so, it is adopted as the internal target.
    ```dae
    func int Npc_IsNextTargetAvailable(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the target is available, FALSE otherwise

### `Npc_SetTrueGuild`
!!! function "`Npc_SetTrueGuild`"
    Sets the true guild of the NPC
    ```dae
    func int Npc_SetTrueGuild(var C_NPC npc, var int guild) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int guild` - guild ID

    **Return value**  
    The function returns nothing, external is wrongly defined as int

### `Npc_GetTrueGuild`
!!! function "`Npc_GetTrueGuild`"
    Gets the true guild of the NPC
    ```dae
    func int Npc_GetTrueGuild(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns true guild ID

### `Npc_IsOnFP`
!!! function "`Npc_IsOnFP`"
    Checks if the NPC is on the specified freepoint
    ```dae
    func int Npc_IsOnFP(var C_NPC npc, var string fpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string fpname` - name of the freepoint (could be only the middle part of the name: `FP_` + `fpname` + `_01`)

### `Npc_PlayAni`
!!! function "`Npc_PlayAni`"
    Makes the NPC play the specified animation
    ```dae
    func void Npc_PlayAni(var C_NPC npc, var string aniname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string aniname` - name of the animation UPPERCASE

### `Npc_StopAni`
!!! function "`Npc_StopAni`"
    Makes the NPC stop the specified animation
    ```dae
    func void Npc_StopAni(var C_NPC npc, var string aniname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string aniname` - name of the animation UPPERCASE

    !!! Warning
        This function is only available in Gothic 2

### `Npc_IsNear`
!!! function "`Npc_IsNear`"
    Checks if `oth` is within 5 meters from `slf`
    ```dae
    func int Npc_IsNear(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if the NPC is near, FALSE otherwise

### `Npc_IsPlayer`
!!! function "`Npc_IsPlayer`"
    Checks if the NPC is a player
    ```dae
    func int Npc_IsPlayer(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is a player, FALSE otherwise

### `Npc_IsInState`
!!! function "`Npc_IsInState`"
    Checks if the NPC is in the specified ZS state
    ```dae
    func int Npc_IsInState(var C_NPC npc, var func state) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var func state` - ZS state function

    **Return value**  
    The function returns TRUE if the NPC is in the state, FALSE otherwise

### `Npc_WasInState`
!!! function "`Npc_WasInState`"
    Checks if the NPC was in the specified ZS state
    ```dae
    func int Npc_WasInState(var C_NPC npc, var func state) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var func state` - ZS state function

    **Return value**  
    The function returns TRUE if the NPC was in the state, FALSE otherwise

### `Npc_IsInRoutine`
!!! function "`Npc_IsInRoutine`"
    Checks if the NPC is in the specified routine ZS state
    ```dae
    func int Npc_IsInRoutine(var C_NPC npc, var func state) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var func state` - routine ZS state function

    **Return value**  
    The function returns TRUE if the NPC is in the state, FALSE otherwise

### `Npc_HasDetectedNpc`
!!! function "`Npc_HasDetectedNpc`"
    Checks if `slf` has detected `oth`
    ```dae
    func int Npc_HasDetectedNpc(var C_NPC slf, var C_NPC oth) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC

    **Return value**  
    The function returns TRUE if the NPC has detected the other NPC, FALSE otherwise

### `Npc_WasPlayerInMyRoom`
!!! function "`Npc_WasPlayerInMyRoom`"
    Checks if the player was in the room (portal) of the NPC before the last room change
    ```dae
    func int Npc_WasPlayerInMyRoom(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the player was in the room assigned to the NPC, FALSE otherwise

### `Npc_IsInPlayersRoom`
!!! function "`Npc_IsInPlayersRoom`"
    Checks if the NPC is in the room (portal) assigned to the player
    ```dae
    func int Npc_IsInPlayersRoom(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is in the room assigned to the player, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Npc_IsPlayerInMyRoom`
!!! function "`Npc_IsPlayerInMyRoom`"
    Checks if the Player is in the room (portal) assigned to the NPC
    ```dae
    func int Npc_IsPlayerInMyRoom(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the player is in the room assigned to the NPC, FALSE otherwise

### `Npc_IsDrawingWeapon`
!!! function "`Npc_IsDrawingWeapon`"
    Checks if the NPC is drawing a weapon or spell, but by the `oCMsgWeapon` and `oCMsgMagic` events. Not sure if it works
    ```dae
    func int Npc_IsDrawingWeapon(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is drawing a weapon, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Npc_IsDrawingSpell`
!!! function "`Npc_IsDrawingSpell`"
    Checks if the NPC is drawing a spell, but by the `oCMsgMagic` events. Not sure if it works
    ```dae
    func int Npc_IsDrawingSpell(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns spell ID if the NPC is drawing a spell, -1 otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Npc_RefuseTalk`
!!! function "`Npc_RefuseTalk`"
    Checks if the NPC refuses to talk
    ```dae
    func int Npc_RefuseTalk(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC refuses to talk, FALSE otherwise

### `Npc_SetRefuseTalk`
!!! function "`Npc_SetRefuseTalk`"
    Sets the NPC to refuse to talk for a specified time
    ```dae
    func void Npc_SetRefuseTalk(var C_NPC npc, var int timesec) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int timesec` - time in seconds

### `Npc_HasItems`
!!! function "`Npc_HasItems`"
    Checks if the NPC has a specified item in inventory
    ```dae
    func int Npc_HasItems(var C_NPC npc, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int iteminstance` - instance of the item

    **Return value**  
    The function returns amount of the item in inventory, 0 if not found

### `Npc_OwnedByNpc`
!!! function "`Npc_OwnedByNpc`"
    Checks if `itm` is owned by the NPC
    ```dae
    func int Npc_OwnedByNpc(var C_ITEM itm, var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_ITEM itm` - instance of the item
    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the item is owned by the NPC, FALSE otherwise

### `Npc_OwnedByGuild`
!!! function "`Npc_OwnedByGuild`"
    Checks if `itm` is owned by the guild
    ```dae
    func int Npc_OwnedByGuild(var C_ITEM itm, var int guild) 
    ```

    **Parameters**  

    - `#!dae var C_ITEM itm` - instance of the item
    - `#!dae var int guild` - int guild ID

    **Return value**  
    The function returns TRUE if the item is owned by the guild, FALSE otherwise

### `Npc_PerceiveAll`
!!! function "`Npc_PerceiveAll`"
    Makes the NPC perceive all objects in the sense range
    ```dae
    func void Npc_PerceiveAll(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `Npc_SetPercTime`
!!! function "`Npc_SetPercTime`"
    Sets the perception time of the NPC
    ```dae
    func void Npc_SetPercTime(var C_NPC npc, var float time) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var float time` - float time in seconds

### `Npc_PercEnable`
!!! function "`Npc_PercEnable`"
    Enables the perception of the NPC
    ```dae
    func void Npc_PercEnable(var C_NPC npc, var int percid, var func function) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int percid` - perception ID
    - `#!dae var func function` - function associated with the perception

### `Npc_PercDisable`
!!! function "`Npc_PercDisable`"
    Disables the perception of the NPC
    ```dae
    func void Npc_PercDisable(var C_NPC npc, var int percid) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int percid` - perception ID

### `Npc_SendPassivePerc`
!!! function "`Npc_SendPassivePerc`"
    Sends a passive perception to the `slf`
    ```dae
    func void Npc_SendPassivePerc(var C_NPC slf, var int percid, var C_NPC oth, var C_NPC vic) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var int percid` - perception ID
    - `#!dae var C_NPC oth` - instance of the other NPC
    - `#!dae var C_NPC vic` - instance of the victim NPC

### `Npc_SendSinglePerc`
!!! function "`Npc_SendSinglePerc`"
    Sends a single perception to the `target` (executes the perception function)
    ```dae
    func void Npc_SendSinglePerc(var C_NPC sender, var C_NPC target, var int percid) 
    ```

    **Parameters**  

    - `#!dae var C_NPC sender` - instance of the other NPC
    - `#!dae var C_NPC target` - instance of the NPC
    - `#!dae var int percid` - perception ID

### `Npc_IsDead`
!!! function "`Npc_IsDead`"
    Checks if the NPC is dead
    ```dae
    func int Npc_IsDead(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is dead, FALSE otherwise

### `Npc_GiveItem`
!!! function "`Npc_GiveItem`"
    Takes the item from the `giver` inventory and gives it to the `taker`
    ```dae
    func void Npc_GiveItem(var C_NPC giver, var int iteminstance, var C_NPC taker) 
    ```

    **Parameters**  

    - `#!dae var C_NPC giver` - instance of the giver NPC
    - `#!dae var int iteminstance` - instance name of the item
    - `#!dae var C_NPC taker` - instance of the taker NPC

### `Rtn_Exchange`
!!! function "`Rtn_Exchange`"
    Changes the current daily routine of the `self` to the specified new routine
    ```dae
    func void Rtn_Exchange(var string oldroutine, var string newroutine) 
    ```

    **Parameters**  

    - `#!dae var string oldroutine` - name of the old routine (have to be active)
    - `#!dae var string newroutine` - name of the new routine

## Deprecated

### `Npc_CheckAvailableMission`
!!! function "`Npc_CheckAvailableMission`"
    Relic of the old mission system
    ```dae
    func int Npc_CheckAvailableMission(var C_NPC npc, var int missionstate, var int important) 
    ```

### `Npc_CheckOfferMission`
!!! function "`Npc_CheckOfferMission`"
    Relic of the old mission system
    ```dae
    func int Npc_CheckOfferMission(var C_NPC npc, var int important) 
    ```

### `Npc_CheckRunningMission`
!!! function "`Npc_CheckRunningMission`"
    Relic of the old mission system
    ```dae
    func int Npc_CheckRunningMission(var C_NPC npc, var int important) 
    ```

### `Npc_CreateSpell`
!!! function "`Npc_CreateSpell`"
    Supposed to add spell the mag book
    ```dae
    func void Npc_CreateSpell(var C_NPC npc, var int spellnr) 
    ```

    **Parameters**  

    - `#!dae self` - instance of the NPC
    - `#!dae var int spellnr` - spell number

### `Npc_LearnSpell`
!!! function "`Npc_LearnSpell`"
    Supposed to add spell to the mag book if NPC doesn't know it
    ```dae
    func void Npc_LearnSpell(var C_NPC npc, var int spellnr) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int spellnr` - spell number

### `Npc_GetActiveSpellLevel`
!!! function "`Npc_GetActiveSpellLevel`"
    Not used in the original scripts, gets the level of the spell currently active on the NPC's hand, although it is unknown what 'level' means
    ```dae
    func int Npc_GetActiveSpellLevel(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to check

    **Return value**  
    The function returns level of the active spell

### `Npc_IsInCutscene`
!!! function "`Npc_IsInCutscene`"
    Relic of the cutscene system    
    Checks if the NPC is in a cutscene
    ```dae
    func int Npc_IsInCutscene(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns TRUE if the NPC is in a cutscene, FALSE otherwise

### `Npc_StartItemReactModules`
!!! function "`Npc_StartItemReactModules`"
    Relic of the old trade system   
    Checks `slf` itemreact modules of the `itm` form `oth`
    ```dae
    func int Npc_StartItemReactModules(var C_NPC slf, var C_NPC oth, var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC
    - `#!dae var C_ITEM itm` - instance of the item

    **Return value**  
    The function returns TRUE if the itemreact modules are found, FALSE otherwise

### `Npc_HasOffered`
!!! function "`Npc_HasOffered`"
    Relic of the old trade system   
    Checks `slf` offered `oth` the item
    ```dae
    func int Npc_HasOffered(var C_NPC slf, var C_NPC oth, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC
    - `#!dae var C_NPC oth` - instance of the other NPC (player)
    - `#!dae var int iteminstance` - instance name of the item

    **Return value**  
    The function returns TRUE if the itemreact modules are found, FALSE otherwise

### `Npc_MemoryEntry`
!!! function "`Npc_MemoryEntry`"
    Not used in the original scripts, the idea was that it created a news/memory entry that allows NPCs to track and react to witnessed events.   
    ```dae
    func void Npc_MemoryEntry(var C_NPC witness, var int source, var C_NPC offender, var int newsid, var C_NPC vic) 
    ```

    **Parameters**  

    - `#!dae var C_NPC witness` - instance of the NPC who will receive this memory
    - `#!dae var int source` - type of the news/event
    - `#!dae var C_NPC offender` - instance of the NPC who performed the action
    - `#!dae var int newsid` - ID of the event type
    - `#!dae var C_NPC vic` - instance of the NPC affected by the action (victim)

### `Npc_MemoryEntryGuild`
!!! function "`Npc_MemoryEntryGuild`"
    Not used in the original scripts, creates a guild-related news/memory entry that allows NPCs to track and react to witnessed events.   
    Similar to Npc_MemoryEntry() but marks the news as guild-related, meaning it affects guild attitudes and reactions rather than just individual NPCs.
    ```dae
    func void Npc_MemoryEntryGuild(var C_NPC witness, var int source, var C_NPC offender, var int newsid, var C_NPC vic) 
    ```

    **Parameters**  

    - `#!dae var C_NPC witness` - instance of the NPC who will receive this memory 
    - `#!dae var int source` - type of the news/event
    - `#!dae var C_NPC offender` - instance of the NPC who performed the action
    - `#!dae var int newsid` - ID of the event type
    - `#!dae var C_NPC vic` - instance of the NPC affected by the action (victim)

### `Npc_HasNews`
!!! function "`Npc_HasNews`"
    Not used in the original scripts, checks if NPC has a specific news entry in their memory
    ```dae
    func int Npc_HasNews(var C_NPC slf, var int newsID, var C_NPC offender, var C_NPC vic) 
    ```

    **Parameters**  

    - `#!dae var C_NPC slf` - instance of the NPC to check
    - `#!dae var int newsID` - ID of the news to find
    - `#!dae var C_NPC offender` - optional (can be NULL) offender to match
    - `#!dae var C_NPC vic` - optional (can be NULL) victim to match

    **Return value**  
    The function returns news number >0 if found, 0 if not found

### `Npc_IsNewsGossip`
!!! function "`Npc_IsNewsGossip`"
    Not used in the original scripts, checks if a specific news entry is gossip (heard from others) vs witnessed
    ```dae
    func int Npc_IsNewsGossip(var C_NPC npc, var int newsNumber) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - NPC owning the news
    - `#!dae var int newsNumber` - ID number of the news entry to check

    **Return value**
    The function returns >0 if news is gossip, 0 if directly witnessed

### `Npc_GetNewsWitness`
!!! function "`Npc_GetNewsWitness`"
    Not used in the original scripts, gets the NPC who witnessed the specified news event
    ```dae
    func C_NPC Npc_GetNewsWitness(var C_NPC npc, var int newsNumber) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - NPC owning the news
    - `#!dae var int newsNumber` - ID number of the news entry

    **Return value**  
    The function returns C_NPC instance of the witness

### `Npc_GetNewsVictim`
!!! function "`Npc_GetNewsVictim`"
    Not used in the original scripts, gets the victim of the specified news event
    ```dae
    func C_NPC Npc_GetNewsVictim(var C_NPC npc, var int newsNumber) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - NPC owning the news
    - `#!dae var int newsNumber` - ID number of the news entry

    **Return value**  
    The function returns C_NPC instance of the victim

/// [deprecated] Not used in the original scripts, gets the victim of the specified news event.
/// @param npc NPC owning the news
/// @param newsNumber ID number of the news entry
/// @return C_NPC instance of the victim
func C_NPC Npc_GetNewsVictim(var C_NPC npc, var int newsNumber) {};

### `Npc_GetNewsOffender`
!!! function "`Npc_GetNewsOffender`"
    Not used in the original scripts, gets the offender of the specified news event
    ```dae
    func C_NPC Npc_GetNewsOffender(var C_NPC npc, var int newsNumber) 
    ```

    **Parameters**
    - `#!dae var C_NPC npc` - NPC owning the news
    - `#!dae var int newsNumber` - ID number of the news entry
    
    **Return value**
    The function returns C_NPC instance of the offender

### `Npc_DeleteNews`
!!! function "`Npc_DeleteNews`"
    Not used in the original scripts, deletes a specific news entry from an NPC's memory
    ```dae
    func int Npc_DeleteNews(var C_NPC npc, var int newsNumber) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - NPC whose news entry should be deleted
    - `#!dae var int newsNumber` - ID number of the news entry to delete

    **Return value**  
    The function returns TRUE if the news was successfully deleted, FALSE otherwise

## zParserExtender 
zParserExtender implements quite a few new [NPC external functions](../extenders/zparserextender/externals/npc.md).
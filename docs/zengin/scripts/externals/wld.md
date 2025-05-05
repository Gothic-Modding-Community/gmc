---
title: WLD functions
---
# WLD - world manipulation functions
Functions related to the world. 

## Functions

### `Wld_AssignRoomToGuild`
!!! function "`Wld_AssignRoomToGuild`"
    Assigns a room to a guild
    ```dae
    func void Wld_AssignRoomToGuild(var string room, var int guild) 
    ```

    **Parameters**  

    - `#!dae var string room` - name of the room as defined in the portal
    - `#!dae var int guild` - guild ID

### `Wld_AssignRoomToNpc`
!!! function "`Wld_AssignRoomToNpc`"
    Assigns a room to a specific NPC
    ```dae
    func void Wld_AssignRoomToNpc(var string room, var C_NPC owner) 
    ```

    **Parameters**  

    - `#!dae var string room` - name of the room as defined in the portal
    - `#!dae var C_NPC owner` - instance of the room owner

### `Wld_DetectItem`
!!! function "`Wld_DetectItem`"
    Detects an item with the specified flags
    ```dae
    func int Wld_DetectItem(var C_NPC npc, var int flags) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int flags` - item flags

    **Globals**  

    - `#!dae item` - set to the item if detected

    **Return value**  
    The function returns TRUE if the item is found, FALSE otherwise

### `Wld_DetectNpc`
!!! function "`Wld_DetectNpc`"
    Detects an NPC based on instance name, guild and AI state
    ```dae
    func int Wld_DetectNpc(var C_NPC npc, var int instancename, var func state, var int guild) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the detector NPC
    - `#!dae var int instancename` - instance name of the detected NPC (`-1` for any)
    - `#!dae var func state` - ZS state function of the detected NPC
    - `#!dae var int guild` - guild ID of the detected NPC (`-1` for any)

    **Globals**  

    - `#!dae other` - set to the detected NPC

    **Return value**  
    The function returns TRUE if the NPC is detected, FALSE otherwise

### `Wld_DetectNpcEx`
!!! function "`Wld_DetectNpcEx`"
    Detects an NPC based on instance name, guild and AI state with oprion to ignore player
    ```dae
    func int Wld_DetectNpcEx(var C_NPC npc, var int instancename, var func state, var int guild, var int detectplayer) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the detector NPC
    - `#!dae var int instancename` - instance name of the detected NPC (-1 for any)
    - `#!dae var func state` - ZS state function of the detected NPC
    - `#!dae var int guild` - guild ID of the detected NPC (-1 for any)
    - `#!dae var int detectplayer` - `1` to detect player, `0` to ignore player

    **Globals**  

    - `#!dae other` - set to the detected NPC

    **Return value**  
    The function returns TRUE if the NPC is detected, FALSE otherwise

### `Wld_DetectNpcExAtt`
!!! function "`Wld_DetectNpcExAtt`"
    Detects an NPC based on instance name, guild, AI state and attitude with oprion to ignore player
    ```dae
    func int Wld_DetectNpcExAtt(var C_NPC npc, var int instancename, var func state, var int guild, var int detectplayer, var int attitude) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the detector NPC
    - `#!dae var int instancename` - instance name of the detected NPC (-1 for any)
    - `#!dae var func state` - ZS state function of the detected NPC
    - `#!dae var int guild` - guild ID of the detected NPC (-1 for any)
    - `#!dae var int detectplayer` - `1` to detect player, `0` to ignore player
    - `#!dae var int attitude` - attitude of the detected NPC (`ATT_` constants)

    **Globals**  

    - `#!dae other` - set to the detected NPC

    **Return value**  
    The function returns TRUE if the NPC is detected, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Wld_DetectPlayer`
!!! function "`Wld_DetectPlayer`"
    Checks if the player is detected by the NPC
    ```dae
    func int Wld_DetectPlayer(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Globals**  

    - `#!dae other` - set to the detected player

    **Return value**  
    The function returns TRUE if the player is detected, FALSE otherwise

### `Wld_ExchangeGuildAttitudes`
!!! function "`Wld_ExchangeGuildAttitudes`"
    Exchanges the guild attitude table
    ```dae
    func void Wld_ExchangeGuildAttitudes(var string tablename) 
    ```

    **Parameters**  

    - `#!dae var string tablename` - name of the new attitude table

### `Wld_GetDay`
!!! function "`Wld_GetDay`"
    Gets the current day, start day is 0
    ```dae
    func int Wld_GetDay() 
    ```

    **Return value**  
    The function returns current day

### `Wld_GetFormerPlayerPortalGuild`
!!! function "`Wld_GetFormerPlayerPortalGuild`"
    Gets the guild of the room (portal) the player was in before the last room change
    ```dae
    func int Wld_GetFormerPlayerPortalGuild() 
    ```

    **Return value**  
    The function returns owner guild ID of the previous room the player was in

### `Wld_GetFormerPlayerPortalOwner`
!!! function "`Wld_GetFormerPlayerPortalOwner`"
    Gets the owner of the room (portal) the player was in before the last room change
    ```dae
    func C_NPC Wld_GetFormerPlayerPortalOwner() 
    ```

    **Return value**  
    The function returns instance of the room owner of the previous room the player was in, NULL if no owner

### `Wld_GetPlayerPortalGuild`
!!! function "`Wld_GetPlayerPortalGuild`"
    Gets the owner guild of the room (portal) the player is currently in
    ```dae
    func int Wld_GetPlayerPortalGuild() 
    ```

    **Return value**  
    The function returns owner guild ID of the current room the player is in

### `Wld_GetPlayerPortalOwner`
!!! function "`Wld_GetPlayerPortalOwner`"
    Gets the owner of the active room (portal) the player is currently in
    ```dae
    func C_NPC Wld_GetPlayerPortalOwner() 
    ```

    **Return value**  
    The function returns instance of the room owner of the current room the player is in, NULL if no owner

### `Wld_InsertItem`
!!! function "`Wld_InsertItem`"
    Inserts an item into the world at the specified spawn point
    ```dae
    func void Wld_InsertItem(var int iteminstance, var string spawnpoint) 
    ```

    **Parameters**  

    - `#!dae var int iteminstance` - instance ID of the item
    - `#!dae var string spawnpoint` - name of the spawn point (waypoint or object)

### `Wld_InsertNpc`
!!! function "`Wld_InsertNpc`"
    Inserts an NPC into the world at the specified spawn point
    ```dae
    func void Wld_InsertNpc(var int npcinstance, var string spawnpoint) 
    ```

    **Parameters**  

    - `#!dae var int npcinstance` - instance ID of the NPC
    - `#!dae var string spawnpoint` - name of the spawn point (waypoint or object)

    **Globals**  

    - `#!dae self` - set to the inserted NPC

### `Wld_InsertNpcAndRespawn`
!!! function "`Wld_InsertNpcAndRespawn`"
    Inserts an NPC into the world and sets a respawn delay, if the NPC dies it will respawn after the specified delay
    ```dae
    func void Wld_InsertNpcAndRespawn(var int instancename, var string spawnpoint, var int spawndelay) 
    ```

    **Parameters**  

    - `#!dae var int instancename` - instance name of the NPC
    - `#!dae var string spawnpoint` - name of the spawn point (waypoint or object)
    - `#!dae var int spawndelay` - spawn delay in game hours

### `Wld_InsertObject`
!!! function "`Wld_InsertObject`"
    Inserts an `oCMob` with specified visual into the world at the specified spawn point
    ```dae
    func void Wld_InsertObject(var string visual, var string spawnpoint) 
    ```

    **Parameters**  

    - `#!dae var string visual` - name of the visual (with the extension)
    - `#!dae var string spawnpoint` - name of the spawn point (waypoint or object)

### `Wld_IsFPAvailable`
!!! function "`Wld_IsFPAvailable`"
    Checks if a free point near the NPC is available
    ```dae
    func int Wld_IsFPAvailable(var C_NPC npc, var string fpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string fpname` - name of the freepoint (could be only the middle part of the name: `FP_` + `fpname` + `_01`)

    **Return value**  
    The function returns TRUE if the freepoint is available, FALSE otherwise

### `Wld_IsMobAvailable`
!!! function "`Wld_IsMobAvailable`"
    Checks if a MOB is available near the NPC and is unoccupied
    ```dae
    func int Wld_IsMobAvailable(var C_NPC npc, var string schemename) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string schemename` - name of the MOB schema (e.g. `BENCH`)

    **Return value**  
    The function returns TRUE if the MOB is available, FALSE otherwise

### `Wld_IsNextFPAvailable`
!!! function "`Wld_IsNextFPAvailable`"
    Checks if the next free point is available
    ```dae
    func int Wld_IsNextFPAvailable(var C_NPC npc, var string fpname) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string fpname` - name of the freepoint (could be only the middle part of the name: `FP_` + `fpname` + `_01`)

    **Return value**  
    The function returns TRUE if the next freepoint is available, FALSE otherwise

### `Wld_IsRaining`
!!! function "`Wld_IsRaining`"
    Checks if it is raining
    ```dae
    func int Wld_IsRaining() 
    ```

    **Return value**  
    The function returns TRUE if it is raining, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

### `Wld_IsTime`
!!! function "`Wld_IsTime`"
    Checks if the current world time is between the specified times
    ```dae
    func int Wld_IsTime(var int hour1, var int min1, var int hour2, var int min2) 
    ```

    **Parameters**  

    - `#!dae var int hour1` - start hour
    - `#!dae var int min1` - start minute
    - `#!dae var int hour2` - end hour
    - `#!dae var int min2` - end minute

    **Return value**  
    The function returns TRUE if the current time is between the specified times, FALSE otherwise

### `Wld_PlayEffect`
!!! function "`Wld_PlayEffect`"
    Plays a visual effect (VFX)
    ```dae
    func void Wld_PlayEffect(var string effect, var instance origin, var instance target, var int effectlevel, var int damage, var int damagetype, var int isprojectile) 
    ```

    **Parameters**  

    - `#!dae var string effect` - name of the visual effect
    - `#!dae var instance origin` - instance of the effect origin object
    - `#!dae var instance target` - instance of the effect target object
    - `#!dae var int effectlevel` - level of the effect
    - `#!dae var int damage` - damage value
    - `#!dae var int damagetype` - type of damage
    - `#!dae var int isprojectile` - if TRUE, the effect passes through static objects

### `Wld_StopEffect`
!!! function "`Wld_StopEffect`"
    Stops a visual effect (VFX)
    ```dae
    func void Wld_StopEffect(var string effect) 
    ```

    **Parameters**  

    - `#!dae var string effect` - name of the visual effect

    !!! Warning
        This function is only available in Gothic 2

### `Wld_RemoveItem`
!!! function "`Wld_RemoveItem`"
    Removes a specific item object from the world
    ```dae
    func int Wld_RemoveItem(var C_ITEM itm) 
    ```

    **Parameters**  

    - `#!dae var C_ITEM itm` - C_ITEM instance of the item

    **Return value**  
    The function returns TRUE if the item was removed, FALSE otherwise

### `Wld_RemoveNpc`
!!! function "`Wld_RemoveNpc`"
    Removes an NPC from the game world
    ```dae
    func void Wld_RemoveNpc(var int instancename) 
    ```

    **Parameters**  

    - `#!dae var int instancename` - instance name of the NPC to remove

### `Wld_SendTrigger`
!!! function "`Wld_SendTrigger`"
    Sends a trigger message to the specified VOB
    ```dae
    func void Wld_SendTrigger(var string vobname) 
    ```

    **Parameters**  

    - `#!dae var string vobname` - name of the VOB

### `Wld_SendUntrigger`
!!! function "`Wld_SendUntrigger`"
    Sends an untrigger message to the specified VOB
    ```dae
    func void Wld_SendUntrigger(var string vobname) 
    ```

    **Parameters**  

    - `#!dae var string vobname` - name of the VOB

### `Wld_SetGuildAttitude`
!!! function "`Wld_SetGuildAttitude`"
    Sets the guild attitude value between two guilds. Used for monster guilds as human guilds use attitude table
    ```dae
    func void Wld_SetGuildAttitude(var int guild1, var int attitude, var int guild2) 
    ```

    **Parameters**  

    - `#!dae var int guild1` - ID of the first guild
    - `#!dae var int attitude` - attitude value (`ATT_` constants)
    - `#!dae var int guild2` - ID of the second guild

### `Wld_GetGuildAttitude`
!!! function "`Wld_GetGuildAttitude`"
    Gets the guild attitude value between two guilds.
    ```dae
    func int Wld_GetGuildAttitude(var int guild1, var int guild2) 
    ```

    **Parameters**  

    - `#!dae var int guild1` - ID of the first guild
    - `#!dae var int guild2` - ID of the second guild

    **Return value**  
    The function returns attitude value as `ATT_` constant

### `Wld_SetMobRoutine`
!!! function "`Wld_SetMobRoutine`"
    Sets a daily routine for the object, the Trigger/Untrigger message is sent if it is later than the specified time
    ```dae
    func void Wld_SetMobRoutine(var int hour1, var int min1, var string objname, var int state) 
    ```

    **Parameters**  

    - `#!dae var int hour1` - start hour
    - `#!dae var int min1` - start minute
    - `#!dae var string objname` - name of the object
    - `#!dae var int state` - 1 for Trigger, 0 for Untrigger

### `Wld_SetObjectRoutine`
!!! function "`Wld_SetObjectRoutine`"
    Sets a daily routine for the object, the Trigger/Untrigger message is sent if it is later than the specified time
    ```dae
    func void Wld_SetObjectRoutine(var int hour1, var int min1, var string objname, var int state) 
    ```

    **Parameters**  

    - `#!dae var int hour1` - start hour
    - `#!dae var int min1` - start minute
    - `#!dae var string objname` - name of the object
    - `#!dae var int state` - 1 for Trigger, 0 for Untrigger

### `Wld_SetTime`
!!! function "`Wld_SetTime`"
    Sets the world time to the specified hour and minute
    ```dae
    func void Wld_SetTime(var int hour, var int min) 
    ```

    **Parameters**  

    - `#!dae var int hour` - int hour to set
    - `#!dae var int min` - int minute to set

### `Wld_SpawnNpcRange`
!!! function "`Wld_SpawnNpcRange`"
    Spawns an NPC within a specified range around `npc`
    ```dae
    func void Wld_SpawnNpcRange(var C_NPC npc, var int instancename, var int num, var float range) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC to spawn around
    - `#!dae var int instancename` - instance name of the spawned NPC
    - `#!dae var int num` - number of NPCs to spawn
    - `#!dae var float range` - spawn range in cm

### `Wld_GetMobState`
!!! function "`Wld_GetMobState`"
    Gets the state of the MOB used by the NPC
    ```dae
    func int Wld_GetMobState(var C_NPC npc, var string schemename) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string schemename` - name of the schema (e.g. `BENCH`)


## zParserExtender 
zParserExtender implements quite a few new [WLD external functions](../extenders/zparserextender/externals/wld.md).
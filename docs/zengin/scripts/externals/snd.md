# Snd functions
Sound related functions.

## Functions

### `Snd_GetDistToSource`
!!! function "`Snd_GetDistToSource`"
    Calculates the distance beetwen the npc and the source of the last played sound
    ```dae
    func int Snd_GetDistToSource(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Return value**  
    The function returns distance between the NPC and the source of the last sound in cm

### `Snd_IsSourceItem`
!!! function "`Snd_IsSourceItem`"
    Check whether the source of the last sound was item
    ```dae
    func int Snd_IsSourceItem(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Globals**  

    - `#!dae item` - set to the source if it was an item

    **Return value**  
    The function returns TRUE if the source was an item, FALSE otherwise

### `Snd_IsSourceNpc`
!!! function "`Snd_IsSourceNpc`"
    Check whether the source of the last sound was npc
    ```dae
    func int Snd_IsSourceNpc(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

    **Globals**  

    - `#!dae other` - set to the source if it was an NPC

    **Return value**  
    The function returns TRUE if the source was an NPC, FALSE otherwise

### `Snd_Play`
!!! function "`Snd_Play`"
    Plays a sound
    ```dae
    func void Snd_Play(var string sndName) 
    ```

    **Parameters**  

    - `#!dae var string sndName` - C_SFX instance name

### `Snd_Play3D`
!!! function "`Snd_Play3D`"
    Plays a sound at the position of the npc
    ```dae
    func void Snd_Play3D(var C_NPC npc, var string sndName) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string sndName` - C_SFX instance name

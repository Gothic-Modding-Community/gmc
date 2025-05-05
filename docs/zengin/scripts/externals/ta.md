---
title: TA functions
---

# TA - routine functions
Functions for setting NPC daily routines.

## Functions

### `TA`
!!! function "`TA`"
    Sets the NPC daily routine
    ```dae
    func void TA(var C_NPC npc, var int start_h, var int stop_h, var func state, var string waypoint) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int start_h` - start hour
    - `#!dae var int stop_h` - stop hour
    - `#!dae var func state` - state function (ZS_*)
    - `#!dae var string waypoint` - name of the waypoint

### `TA_Min`
!!! function "`TA_Min`"
    Sets the NPC daily routine with minute precision
    ```dae
    func void TA_Min(var C_NPC npc, var int start_h, var int start_m, var int stop_h, var int stop_m, var func state, var string waypoint) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var int start_h` - start hour
    - `#!dae var int start_m` - start minute
    - `#!dae var int stop_h` - stop hour
    - `#!dae var int stop_m` - stop minute
    - `#!dae var func state` - state function (ZS_*)
    - `#!dae var string waypoint` - name of the waypoint

## Deprecated

### `TA_CS`
!!! function "`TA_CS`"
    Relic of the cutscene system   
    Sets a cutscene routine for the NPC
    ```dae
    func void TA_CS(var C_NPC npc, var string csname, var string rolename) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC
    - `#!dae var string csname` - name of the cutscene
    - `#!dae var string rolename` - role of the NPC in the cutscene

### `TA_BeginOverlay`
!!! function "`TA_BeginOverlay`"
    Not used in the original scripts, starts a daily routine overlay
    ```dae
    func void TA_BeginOverlay(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `TA_EndOverlay`
!!! function "`TA_EndOverlay`"
    Not used in the original scripts, ends a daily routine overlay
    ```dae
    func void TA_EndOverlay(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

### `TA_RemoveOverlay`
!!! function "`TA_RemoveOverlay`"
    Not used in the original scripts, removes an active daily routine overlay
    ```dae
    func void TA_RemoveOverlay(var C_NPC npc) 
    ```

    **Parameters**  

    - `#!dae var C_NPC npc` - instance of the NPC

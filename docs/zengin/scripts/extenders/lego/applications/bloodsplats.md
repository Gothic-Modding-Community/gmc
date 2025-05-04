---
title: Bloodsplats
description: LeGo package for displaying bloodsplats on a screen when player is hit
---
# Bloodsplats

!!! info inline end
    **Dependencies:**<br/>
    - [Floats](../../ikarus/floats.md)<br/>
    - [View](../tools/view.md)<br/>
    - [Random](../tools/random.md)<br/>
    - [Anim8](anim8.md)<br/>
    **Implementation:**<br/>
    [:material-github: Bloodsplats.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Bloodsplats.d)

If this package is activated, red blood splatters will appear on the screen when the hero takes damage. For this, the damage perception for the hero is redirected to `_B_HeroDamage()`. To use the Bloodsplats, the enclosed textures must be available. Also, the VFX "HERO_HURT" (also included) should be entered in the `VfxInst.d` to create an even better hit effect. All textures used here are from [CGTextures.com](http://CGTextures.com). If you use Bloodsplats in your modification, this site must be noted in the credits.

!!! Tip
    See [user constants](../userconstants.md#bloodsplats) to edit behavior of this packet.

## Initialization
Initialize with `LeGo_Bloodsplats` flag.
```dae
LeGo_Init(LeGo_Bloodsplats);
```
## Functions

### `Bloodsplat`
!!! function "`Bloodsplat`"
    Puts a blood splatter on the screen.
    ```dae
    func void Bloodsplat(var int damage)
    ```
    **Parameters**

    - `#!dae var int damage`  
        The damage (affects the size of the splatter)

### `Bloodsplats_Rage`
!!! function "`Bloodsplats_Rage`"
    Pretty pointless feature that smears the entire screen.
    ```dae
    func void Bloodsplats_Rage()
    ```

### `Npc_GetPercFunc`
!!! function "`Npc_GetPercFunc`"
    `oCNpc::GetPerceptionFunc` engine function wrapper
    ```dae
    func int Npc_GetPercFunc(var C_Npc npc, var int type)
    ```
    **Parameters**

    - `#!dae var C_NPC npc`  
        NPC whose perception is checked
    - `#!dae var int type`  
        Checked perception type (form [`Constant.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L213-L258))

    **Return value**

    The function returns the state of NPCs selected perception.
# setBarPositions

!!! Abstract inline end "Quick overview"
    **Author:** [mud-freak](https://forum.worldofplayers.de/forum/members/25960-mud-freak)  
    **Platform:** G1, G2NotR  
    **Category:** Engine, Interface

**setBarPositions.d** is a script that allows changing position of original gothic bars (HP, Mana, Swim, focus). Changes are directly in the engine, so bars are normally scaled.

## Dependencies
- [Ikarus](../ikarus/index.md)
- [HookEngine](../lego/tools/hook_engine.md)

## Initialization
Call it in the `Init_Global()` or other initialization function. Set the `manaAlwaysOn` and `swimAlwaysOn` to TRUE/FALSE.
```dae
SetBarPositions_Init(manaAlwaysOn, swimAlwaysOn);
```

## Implementation
[:material-forum: setBarPositions.d on WoG forum](https://forum.worldofplayers.de/forum/threads/?p=26426112)

## Usage
To change positions of bars edit the main function `SetBarPosition`. Look at the examples to see how you can adjust it to your preferences.
```dae
func int SetBarPosition(var int barPtr) {
    var oCViewStatusBar bar; bar = _^(barPtr);
    var int x; var int y;

    if (barPtr == MEM_Game.hpBar) {
        // Original
        x = Print_ToVirtual(10, PS_X);                                // 10 px from the left
        y = PS_VMax - Print_ToVirtual(10 + bar.zCView_psizey, PS_Y);  // 10 px from the bottom

    } else if (barPtr == MEM_Game.manaBar) {
        // Original
        x = PS_VMax - Print_ToVirtual(10 + bar.zCView_psizex, PS_X);  // 10 px from the right
        y = PS_VMax - Print_ToVirtual(10 + bar.zCView_psizey, PS_Y);  // 10 px from the bottom

    } else if (barPtr == MEM_Game.swimBar) {
        // Original
        x = (PS_VMax - bar.zCView_vsizex) / 2;                        // Centered
        y = PS_VMax - Print_ToVirtual(10 + bar.zCView_psizey, PS_Y);  // 10 px from the bottom

    } else if (barPtr == MEM_Game.focusBar) {
        // Original
        x = (PS_VMax - bar.zCView_vsizex) / 2;                        // Centered
        y = Print_ToVirtual(10, PS_Y);                                // 10 px from the top
    };

    return x | (y << 14);
};
```

## Examples

### All bars on the left side
```dae


/*
 * EXAMPLE: Stacked on the left
 */
func int SetBarPosition(var int barPtr) {
    var oCViewStatusBar bar; bar = _^(barPtr);
    var int x; var int y;

    if (barPtr == MEM_Game.hpBar) {
        x = Print_ToVirtual(10, PS_X);
        y = PS_VMax - Print_ToVirtual(6 + 3 * (4 + bar.zCView_psizey), PS_Y);

    } else if (barPtr == MEM_Game.manaBar) {
        x = Print_ToVirtual(10, PS_X);
        y = PS_VMax - Print_ToVirtual(6 + 2 * (4 + bar.zCView_psizey), PS_Y);

    } else if (barPtr == MEM_Game.swimBar) {
        x = Print_ToVirtual(10, PS_X);
        y = PS_VMax - Print_ToVirtual(6 + 1 * (4 + bar.zCView_psizey), PS_Y);

    } else if (barPtr == MEM_Game.focusBar) {
        // Original
        x = (PS_VMax - bar.zCView_vsizex) / 2;                        // Centered
        y = Print_ToVirtual(10, PS_Y);                                // 10 px from the top
    };

    return x | (y << 14);
};
```

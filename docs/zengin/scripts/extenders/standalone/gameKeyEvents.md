# gameKeyEvents

!!! Abstract inline end "Quick overview"
    **Author:** [mud-freak](https://forum.worldofplayers.de/forum/members/25960-mud-freak)  
    **Platform:** G1, G2NotR  
    **Category:** Engine, Keys

**gameKeyEvents.d** is a script, which handles key events with the `oCGame::HandleEvent` hook. Better alternative for [`FrameFunction`](../lego/tools/frame_functions.md) with [`MEM_KeyState`](../ikarus/functions/keyboard.md#mem_keystate) with which you don't have to check whether any menu is opened or player is in dialogue or can move etc.

??? trivia "Author's description"
    >I looked up the address within `oCGame::HandleEvent`. I made it into a universally usable script for Gothic 1 and Gothic 2.

    >One could argue now that this is not much different from a `FrameFunction` with `MEM_KeyState`. The difference is that this approach saves the extra work of checking if any menu is open, whether the player is in a dialog, whether the player may move, etc. Also this function is "event driven", meaning it is really only called when a key is pressed/held instead of every frame in vain. So it's arguably more performant.

## Dependencies
- [Ikarus](../ikarus/index.md)
- [HookEngine](../lego/tools/hook_engine.md)

## Initialization
Call `Game_KeyEventInit()` in the `Init_Global()` or other initialization function.
```dae
Game_KeyEventInit();
```

## Implementation
[:material-forum: gameKeyEvents.d on WoG forum](https://forum.worldofplayers.de/forum/threads/1495001-Scriptsammlung-ScriptBin/page4?p=26055992&viewfull=1#post26055992)

## Usage
To add a key pressing detection edit the main function `Game_KeyEvent`.
```dae
func int Game_KeyEvent(var int key, var int pressed) {
    if (key == KEY_LBRACKET) && (pressed) {
        // Here enter your code.
        return TRUE;
    };
    return FALSE;
};
```

- To change detected key rename `KEY_LBRACKET` to your own key e.g. taken from [Ikarus constants](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d#L129-L288).
- To detect pressing a key leave `(pressed)` unchanged but if you want to detect holding change it to `(!pressed)`. That's because 
> pressed is FALSE: key is held, pressed is TRUE: key press onset
- To run code when a key is pressed, paste it or call a function where the comment is.
- To detect more than one key add `else if`.

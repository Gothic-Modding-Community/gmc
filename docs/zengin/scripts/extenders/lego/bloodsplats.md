# Bloodsplats
If this package is activated, red blood splatters will appear on the screen when the hero takes damage. For this, the damage perception for the hero is redirected to `_B_HeroDamage()`. To use the `Bloodsplats`, the enclosed textures must be available. Also, the VFX "HERO_HURT" (also included) should be entered in the `VfxInst.d` to create an even better hit effect. All textures used here are from [CGTextures.com](http://CGTextures.com). If you use `Bloodsplats` in your modification, this site must be noted in the credits.

!!! Tip
    See [user constants](various/userconstants.md#bloodsplats) to edit behavior of this packet.

## Dependencies

- Floats
- View
- [Random](random.md)
- [Anim8](anim8.md)

## Initialization
Initialize with `LeGo_Bloodsplats` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Bloodsplats);
```
## Implementation
[:material-github: Bloodsplats.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Bloodsplats.d)

## Functions

### Bloodsplat
Puts a blood splatter on the screen.
```dae
func void Bloodsplat(int damage) {};
```

- `damage` - the damage (affects the size of the splatter)

### Bloodsplats_Rage
Pretty pointless feature that smears the entire screen.
```dae
func void Bloodsplats_Rage() {};
```

## Animation event blocks
With animations, we often need to perform some other actions, like playing a sound effect, inserting item into NPCs hand or changing an item instance into a different one (turning a raw steel into hot raw steel).

Example:
```c++
ani ("s_RunL" 1 "s_RunL" 0.0 0.1 M. "Hum_RunLoop_M01.asc" F 12 31)
{
	*eventSFXGrnd	(12	"Run")
	*eventSFXGrnd	(21	"Run")
}
```

The example shows the animation and its event block. We place these events into a block surrounded by curly brackets.

There are many events to choose from to choose from, here are some examples:
Sound effects
```c++
*eventSFXGrnd (12 "Run")
*eventSFX     (10 "Swim")
```
Particle effects
```c++
*eventPFX     (12       "ZMODELLANDDUST"   "Bip01")
*eventPFX     (35   1	"BUBBLES"          "BIP01 HEAD"	ATTACH)
*eventPFXStop (45   1)
```
Morph mesh animations
> Heads are animated using morph meshes, this feature is not used as much in the original game, but Chronicles of Myrtana uses it quite a lot. I hope to write about morphMesh animation too in the future.

```c++
*eventMMStartAni (14	"T_HURT")
```
Event tags
```c++
*eventTag (5 "DEF_FIGHTMODE"	"")

*eventTag (0 "DEF_HIT_LIMB"  "ZS_RIGHTHAND")
*eventTag (0 "DEF_OPT_FRAME" "6")
*eventTag (0 "DEF_HIT_END"   "29")
*eventTag (0 "DEF_WINDOW"    "18 35")

*eventTa  (4 "DEF_INSERT_ITEM"   "ZS_LEFTHAND")
*eventTa  (4 "DEF_CREATE_ITEM"   "ZS_RIGHTHAND" "ItMw_1H_Sledgehammer_01")
*eventTa  (9 "DEF_EXCHANGE_ITEM" "ZS_LEFTHAND"  "ItMiSwordbladehot")
*eventTa  (4 "DEF_REMOVE_ITEM")
```


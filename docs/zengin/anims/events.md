---
title: Events
---

!!! example "Acknowledgment"
    This tutorial was possible thanks to Kerrax, VAM and their excelent articles ([MDS](https://worldofplayers.ru/threads/36653/), [EventTags](https://worldofplayers.ru/threads/37708/)) and Avallach from [theModders](http://themodders.org/index.php?topic=13214.0) who provided valuable insight.

## Animation event block overview

We often need to perform some other actions together with our animation, such as playing a sound effect, inserting item into NPC's hand or changing an item instance into a different one, like turning a raw steel into hot raw steel. These actions often need to be done at very **specific** moment during the animation playback, therefore they are defined using **events**(#aniamtion-events) in the event block which follows right after the animation definition. The event block is started and closed by curly brackets.

Example:
```dae
ani ("s_RunL" 1 "s_RunL" 0.0 0.1 M. "Hum_RunLoop_M01.asc" F 12 31) // animation
{ // event block start
    
    *eventSFXGrnd    (12    "Run") // animation event
    *eventSFXGrnd    (24    "Run") // animation event
    ...
    *eventSFXGrnd    (30    "Run") // animation event
} // event block end
```

!!! Warning
    Each animation can define a maximum of 16 events. Should you need more, split the animation into parts and use `next_ani` to chain them together.

## Animation events
Animation events are commands telling engine to do something. Event `*eventSFXGrnd(12 "Run")` will command the engine to play sound `Run` at the very moment (12th frame) the character lands food on the ground. So with that in mind here is the general syntax as well as each animation event in the game.

General Syntax:
```dae
    *EVENTNAME (FRAME KEYWORD "INSTANCE" [OPTIONAL] [A:VALUE] [B:VALUE])
```

`FRAME` - all events specify on what frame int the animation source file `.ASC` should this event happen

`KEYWORD` - some events expect very specific keywords.

`"INSTANCE"` - this indicates parameter is expected to be inside quotes, usually it;s slot/bone or item/sound instance name from the scrips

`[OPTIONAL]` - this is an example of the optional parameter. Optional parameters will be indicated by brackets `[]`, if you don't specify them, the event will use the default value defined by the engine. 

`A:VALUE` - some events that have  more than one optional parameter use a prefix to know which was specified


`NODE_NAME` - will indicate any `NODE` should work, be it bones (`BIP01`...) or `ZS_` slots (`ZS_RIGHTHAND`) 

`SLOT` - this will indicate most likely only `ZS_` slots will work.


!!! Warning
    Events should follow in ascending order by the frame they appear on. i. e. `*eventTag(1 ...)` must come before `*eventTag(2 ...)` 

| Event                                 | Description                                                                         |
|---------------------------------------|-------------------------------------------------------------------------------------|
| [eventCamTremor](#eventcamtremor)     | camera shake                                                                        |
| [eventMMStartAni](#eventmmstartani)   | start morph-mesh                                                                    |
| [eventPFX](#eventpfx)                 | create particle effect                                                              |
| [eventPFXStop](#eventpfxstop)         | destroy particle effect                                                             |
| [eventSwapMesh](#eventswapmesh)       | exchange item meshes between two slots                                              |
| [eventSFX](#eventsfx)                 | create sound effect                                                                 |
| [eventSFXGRND](#eventsfxgrnd)         | create sound effect on the ground                                                   |
| [eventTag](#eventtag)                 | generic event, does action specified in parameters                                  |
| Defined in engine but never used ?    |                                                                                     |
| [eventPFXGRND](#eventpfxgrnd)         | create particle effect on the ground                                                |
| [eventSetMesh](#eventsetmesh)         | ?                                                                                   |
| [modelTag](#modeltag)                 | same as eventTag, but applies to morphmesh?                                         |


### eventCamTremor

Earthquake effect (camera shake)

Example:
```dae
*eventCamTremor (12 1000	500	  2  8 )
```

Syntax:
```dae
*eventCamTremor (FRAME RANGE DURATION MIN_AMPLIFIER MAX_AMPLIFIER)
```

`eventCamTremor` - is a keyword, for camera shake event

Let's describe all the parameters

`FRAME`             - animation frame at which this event starts 

`RANGE`             - range from which the effect will be 'felt' defined in in-game **centimeters** (1000 is 10 meters in-game)

`DURATION`          - duration of the effect in milliseconds

`MIN_AMPLIFIER`     - minimum amount of shaking in in-game centimeters

`MAX_AMPLIFIER`     - the maximum amount of shaking.

### eventMMStartAni

Start the animation of the morph-mesh that is attached to the specified node. Mostly used to start NPC facial animations or to animate bows/crossbows shooting.

Example:
```dae
*eventMMStartAni    (14	"T_HURT")
*eventMMStartAni	(6	"S_SHOOT"	"ZS_RIGHTHAND")
*eventMMStartAni	(6	"S_BOOK_NEXT_PAGE"	"ZS_RIGHTHAND" I:0.5 H:5)
```

Syntax:
```dae
*eventMMStartAni (FRAME "ANI_NAME" ["NODE_NAME"] [I:INTENSITY] [H:HOLD_TIME])
```


`FRAME`             - animation frame at which animation should start 

`ANI_NAME`          - name of the morph-mesh animation (specified in .MMS) file

`NODE_NAME`         - node in the hierarchy, to which morph mesh is attached. If not specified, a default value of `BIP01 HEAD` will be used. 

`I:INTENSITY`       - **float** value to specify blending of morph animation with the current one ?

`H:HOLD_TIME`       - time in seconds, how long will the animation "stay"


Both `INTENSITY` and `HOLD_TIME` can be specified in the MMS script. All gothic morph meshes specify those values in .MMS, therefore behavior when both specified in eventMMStartAni and .MMS file is unknown/untested

## eventPfx

Start particle effect at the specified bone. 

Example:
```dae
*eventPFX	(12     "ZMODELLANDDUST"    "Bip01"	)
*eventPFX	(2  1   "DEMON_ATTACK"      "BIP01 R HAND"	ATTACH)
```

Syntax:
```dae
*eventPFX (FRAME [PFX_HANDLE] "PFX_NAME" "NODE_NAME" [ATTACH])
```

`FRAME`             - animation frame at which particle effect starts

`PFX_NAME`          - name of the PFX instance

`PFX_HANDLE`        - an optional integer value. Specifying this creates a 'handle' and allows stop the PFX later using [eventPFXStop](#eventpfxstop)

`NODE_NAME`         - node in the hierarchy. particle effect will be spawned at the node's position. If not specified, a default value of `BIP01` will be used.

`ATTACH`             - keyword, including this keyword, will make particle effect follow the node specified, otherwise, it will stay where it spawned. 


!!! Tip
    `ATTACH` is used to create demons burning hand during the attack, while without this keyword dust particles are made to stay at the position where NPC landed after falling.


## eventPFXStop

Stops particle effect previously started by [eventPfx](#eventpfx)


Example:
```dae
*eventPFX       (2  1   "DEMON_ATTACK"      "BIP01 R HAND"  ATTACH) // starts pfx with handle 1
...
*eventPFXStop	(70	1) // stops pfx started above
```

Syntax:
```dae
*eventPFXStop (FRAME PFX_HANDLE)
```

`FRAME`             - animation frame at which particle effect should disappear

`PFX_HANDLE`        - an integer value. *Handle* of the particle effect, that should be destroyed. Particle effect must be spawned using the same handle by [eventPfx](#eventpfx) first


## eventSwapMesh

Move mesh from source `NODE` to target node.  Item should be present in the node already. Only mesh of the Items is moved, engine internally still keeps a reference to items in the original slot? Never used in game?

Example:
```dae
*eventSwapMesh (5 "ZS_CROSSBOW" "ZS_LEFTARM")
```

Syntax:
```dae
*eventSWAPMESH		(FRAME "SOURCE_NODE_NAME" "TARGET_NODE_NAME")
```

`FRAME`             - animation frame at which transport of the mesh should happen

`SOURCE_NODE_NAME`        - source node containing the item.

`TARGET_NODE_NAME`        - target node that the item should be moved to.


!!! Note
    In some rare occasions duplicates item 

## eventSfx

Play sound effect. It can be either `SFX` instance from scripts, or `.WAV` file.

Example:
```dae
*eventSFX	(0	"Drown")
*eventSFX	(8	"WHOOSH"	EMPTY_SLOT)
*eventSFX	(8	"BAB_SIGH" R:5000   EMPTY_SLOT)   
```

Syntax:
```dae
*eventPFX (FRAME "SFX_NAME" [R:RANGE] [EMPTY_SLOT])
```

`FRAME`             - animation frame at which particle effect starts

`SFX_NAME`          - name of the SFX instance or `.WAV` file

`R:RANGE`        - an optional integer value. The range from which the effect will be 'heard' defined in in-game **centimeters** (1000 is 10 meters in-game)

`[EMPTY_SLOT]`         - optional keyword. By default audio effects use a single audio channel (slot) per Model. That means every `eventSFX` request will cancel any currently playing effect. If `EMPTY_SLOT` is specified, audio will be played on the next available (empty) audio slot and other sounds will not be interrupted.


!!! Note
    A lot of original game animations contain `EMTPY_SLOT` instead of `EMPTY_SLOT` which was probably unintended. Gothic therefore acts as no keyword was provided, which causes a lot of sound interruptions. Therefore be mindful of spelling when copying original MDS scripts


## eventSfxGrnd

the same as [eventSfx](#eventsfx) with only one difference, the sound effect name is appended with the current material name.

Example:
```dae
*eventSFXGrnd (12 "Run")
```

Syntax:
```dae
*eventSFXGrnd (FRAME "SFX_NAME" [R:RANGE] [EMPTY_SLOT])
```

Depending on the material of the texture, the character is standing on, the game will add one of the following suffixes:


| Spacer Material     | Suffix     | Gothic 1   | Gothic 2a |
|---------------------|------------|------------|-----------|
| `UNDEF`             | _Undef     |     ✔️    |     ✔️    |
| `EARTH`             | _Earth     |     ✔️    |     ✔️    |
| `SAND`              | _Sand      |     ✔️    |     ✔️    |
| `METAL`             | _Metal     |     ✔️    |     ✔️    |
| `WATER`             | _Water     |     ✔️    |     ✔️    |
| `WOOD`              | _Wood      |     ✔️    |     ✔️    |
| `SNOW`              | _Snow      |     ❌    |     ✔️    |
| `STONE`             | _Stone     |     ✔️    |     ✔️    |
| default             | _Stone     |     ✔️    |     ✔️    |


NPC running on grass texture, with material set to EARTH in world editor,  will play sound `Run_Earth` by using `*eventSFXGrnd (12 "Run")` in run animation. `_Earth` suffix is determined and added by the engine.


## eventTag

This is a generic type of event that does different actions based on the first parameter after the frame parameter. It was probably later in development to extend MDS functionality without the need to expand parser itself.
All parameters except `FRAME` are passed inside quotes Further parameters are specific for every `EVENT_TAG_TYPE`. 

!!! Waning
    eventTag contrary to other events is validated only at runtime. If parameters are wrong, it won't work or might crash the game

Syntax:
```dae
*eventTag (FRAME "EVENT_TAG_TYPE" "PARAMETER_1"  "PARAMETER_2" ... "PARAMETER_N")
```

`FRAME` - Frame at which the event will execute. This parameter is always first and the same for all `eventTags`

`EVENT_TAG_TYPE` - a type of event = action that should happen. 

Here is a list of event tag types:

| EVENT TAG TYPE                                    | Description                                   
|---------------------------------------------------|-------------------------------------------------------|                       
| [DEF_CREATE_ITEM](#def_create_item)               | Creates item into slot                                  |
| [DEF_INSERT_ITEM](#def_insert_item)               | Inserts item to slot from inventory                   |
| [DEF_REMOVE_ITEM](#def_remove_item)               | Removes item from slot to inventory                   |
| [DEF_DESTROY_ITEM](#def_destroy_item)             | Destroys item in slot                                 |
| [DEF_PLACE_ITEM](#def_place_item)                 | ~~Places item from slot into mob slot~~  Destroys item in slot   |
| [DEF_EXCHANGE_ITEM](#def_exchange_item)           | Removes item in slot and replaces with new item                   |
| [DEF_FIGHTMODE](#def_fightmode)                   | Sets npc into weapon stance                           |
| [DEF_PLACE_MUNITION](#def_place_munition)         | Inserts munition into slot                            |
| [DEF_REMOVE_MUNITION](#def_remove_munition)       | Remove munition back to inventory                     |
| [DEF_DRAWSOUND](#def_drawsound)                   | Plays weapon drawing sound based on weapon material   |
| [DEF_UNDRAWSOUND](#def_undrawsound)               | Plays weapon sheating sound based on weapon material  |
| [DEF_SWAPMESH](#def_swapmesh)                     | Moves items visual to different slot visually         |
| [DEF_DRAWTORCH](#def_drawtorch)                   | Inserts torch                                         |
| [DEF_INV_TORCH](#def_inv_torch)                   | Moves torch to different slot temporarily             |
| [DEF_DROP_TORCH](#def_drop_torch)                 | Drops torch from slot to world                        |
| [DEF_HIT_LIMB](#def_hit_limb)                     | Defines node which deals damage                       |
| [DEF_DIR](#def_dir)                               | Defines attack direction                              |
| [DEF_DAM_MULTIPLIER](#def_dam_multiplier)         | Defines damage mutliplier                             |
| [DEF_PAR_FRAME](#def_par_frame)                   | Defines frame range for blocking                      |
| [DEF_OPT_FRAME](#def_opt_frame)                   | Defines damage frames                                 |
| [DEF_HIT_END](#def_hit_end)                       | Defines last frame to continue combo                  |
| [DEF_WINDOW](#def_window)                         | Defines frame for combo continuation                  |

#### DEF_CREATE_ITEM

Creates a new item instance and inserts it into the specified slot. Item is not inserted permanently but only for the duration of interaction. 

Example:
```dae
*eventTag    (4    "DEF_CREATE_ITEM"    "ZS_RIGHTHAND"    "ItMw_1H_Mace_L_04")
```

Syntax:
```dae
*eventTag (FRAME "DEF_CREATE_ITEM" "SLOT" "ITEM_INSTANCE")
```


`SLOT`         - a name of the `ZS_` slot, write in UPPERCASE

`ITEM_INSTANCE`     - item instance from the scripts


!!! Warning
    This event tag most likely works only during Mob/Item interaction

#### DEF_INSERT_ITEM

Insert the interaction item into the specified slot. 

 - during mob interaction, inserted item instance is of instance taken from **UseWithItem** mob property.
 - during item interaction (i.e. drink potion) item that started the **SceneName** will be inserted. 

In the example below: `(1)` inserts `ItMiSwordrawhot` that is defined in spacer into `ZS_LEFTHAND`, then `(2)` spawns `ItMw_1H_Mace_L_04` (hammer) into `ZS_RIGHTHAND` for anvil interaction.

Example:
```{ .dae  }
ani    ("t_BSANVIL_S0_2_S1"    1    "s_BSANVIL_S1"    0.0    0.0    M.    "Hum_BSAnvil_Jue00.asc"    F    4    9)
{
    *eventTag    (4    "DEF_INSERT_ITEM"    "ZS_LEFTHAND")    // (1)
    *eventTag    (4    "DEF_CREATE_ITEM"    "ZS_RIGHTHAND"    "ItMw_1H_Mace_L_04")    // (2)
}
```


Syntax:
```dae
*eventTag (FRAME "DEF_INSERT_ITEM" "SLOT")
```


`SLOT`         - a name of the `ZS_` slot, use UPPERCASE

`ITEM_INSTANCE`     - item instance from the scripts

!!! Warning
    This event tag most likely works only during Mob/Item interaction

!!! Note ""
    The well-known Gothic bug: 
    
    If player gets hit while drinking a potion, the effect of the potion is applied, but the potion remains in the inventory - the reason for the bug is that the potion item is inserted into hand using  `DEF_INSERT_ITEM` and would be removed from the world at the end of the drinking animation, while the potion's effect (a script function that increases stats) is applied at the very beginning of the animation. When the player is hit, the drinking animation is interrupted, and the engine does not remove the item from the world.

#### DEF_REMOVE_ITEM

Remove an item inserted into a slot via `DEF_INSERT_ITEM` from the slot back into the **inventory**. 

Example:
```dae
*eventTag (0 "DEF_REMOVE_ITEM")
```

Syntax:
```dae
*eventTag (FRAME "DEF_REMOVE_ITEM")
```

!!! Warning
    This event tag most likely works only during Mob/Item interaction

#### DEF_DESTROY_ITEM

Destroys an item inserted into a slot via `DEF_INSERT_ITEM`. The item is **removed** from the world.

Example:
```dae
*eventTag (0 "DEF_DESTROY_ITEM")
```

Syntax:
```dae
*eventTag (FRAME "DEF_DESTROY_ITEM")
```

!!! Warning
    This event tag most likely works only during Mob/Item interaction

#### DEF_PLACE_ITEM

Remove the item inserted via eventTag `DEF_INSERT_ITEM` from the slot and the world. In terms of its action, eventTag `DEF_PLACE_ITEM` is a synonym for `DEF_DESTROY_ITEM`. 
Possibly fixed by SystemPack. See intended use.

Example:
```dae
*eventTag (0 "DEF_PLACE_ITEM")
```

Syntax:
```dae
*eventTag (FRAME "DEF_PLACE_ITEM")
```

!!! Warning
    This event tag most likely works only during Mob/Item interaction

??? Example "Intended use"
    Presumably, the eventTag `DEF_PLACE_ITEM` was intended to have different behavior: If an NPC interacts with a MOB that has a `ZS_SLOT` node, then move the item inserted via `DEF_INSERT_ITEM` from the NPC node into the `ZS_SLOT` node on the MOB. An example would be orc priest hearts in the Temple of the Sleeper, Gothic 1.

    ```dae
    // Sleeper Portal
    ani ("t_SPORTAL_Stand_2_S0"     1    "s_SPORTAL_S0"     0.0    0.0    M.    "Hum_SleeperPortal_M01.asc"    F    0    19)
    ani ("s_SPORTAL_S0"             1    "s_SPORTAL_S0"     0.0    0.0    M.    "Hum_SleeperPortal_M01.asc"    F    20    20)
    ani ("t_SPORTAL_S0_2_Stand"     1    ""                 0.0    0.2    M.    "Hum_SleeperPortal_M01.asc"    R    0    19)
    ani ("t_SPORTAL_S0_2_S1"        1    "s_SPORTAL_S1"     0.0    0.0    M.    "Hum_SleeperPortal_M01.asc"    F    21    90    FPS:10)
    {
        *eventTag    (60    "DEF_INSERT_ITEM"    "ZS_RIGHTHAND")    // (1)
        *eventTag    (90    "DEF_PLACE_ITEM")    // (2)
    }
    ani ("s_SPORTAL_S1"             1    "s_SPORTAL_S1"     0.0    0.0    M.    "Hum_SleeperPortal_M01.asc"    F    91    91)
    ani ("t_SPORTAL_S1_2_Stand"     1    ""                 0.0    0.2    M.    "Hum_SleeperPortal_M01.asc"    F    90    100)
    ```

    During animation on 60th frame,`(1)` inserts orc priest sword from the inventory, and `(2)` on 90th frame, presumably, should have left the sword inserted into the heart sticking out. There is `ZS_SLOT` present to indicate the location of the sword after insertion into the heart.

    In reality, `(2)` simply removes the sword from the world like `DEF_DESTROY_ITEM`. This was most likely an unrealized idea. In G2, eventTag `DEF_PLACE_ITEM` is not used.  

#### DEF_EXCHANGE_ITEM

Replace an item in a slot with another item. Item present in the slot is removed from the slot and the world, new item specified in parameters is created and inserted in the same slot.

Example:
```dae
*eventTag (37 "DEF_EXCHANGE_ITEM" "ZS_LEFTHAND" "ItMiSwordrawhot")
```

Syntax:
```dae
*eventTag (FRAME "DEF_EXCHANGE_ITEM" "SLOT" "ITEM_INSTANCE")
```

`SLOT`         - a name of the `ZS_` slot, use UPPERCASE

`ITEM_INSTANCE`     - item instance from the scripts

!!! Warning
    This event tag most likely works only during Mob/Item interaction

#### DEF_FIGHTMODE

Set fight mode for the model. Used in transition animations to weapon stances like `t_1h_2_1hRun`.

Example:
```dae
*eventTag (5 "DEF_FIGHTMODE" "FIST")
```

Syntax:
```dae
*eventTag (FRAME "DEF_FIGHTMODE" "FIGHT_MODE")
```

`FIGHT_MODE` - fight modes are defined in the engine and can be one of the following:

- `""` - remove weapon
- `"FIST"` - fists
- `"1H"` or `"1HS"` - one-handed weapon
- `"2H"` or `"2HS"` - two-handed weapon
- `"BOW"` - bow
- `"CBOW"` - crossbow
- `"MAG"` - magic

Example: Parameter `1H` sets fight mode for the actor (in the engine), but also exchanges sword from `ZS_SWORD` slot to the `ZS_RIGHTHAND`

#### DEF_PLACE_MUNITION

Place ammunition, from inventory such as an arrow into the specified slot. Used in reloading animations after a bow/crossbow shot.

Example:
```dae
*eventTag (9 "DEF_PLACE_MUNITION" "ZS_RIGHTHAND")
```

Syntax:
```dae
*eventTag (FRAME "DEF_PLACE_MUNITION" "SLOT")
```

`SLOT`         - slot where the ammunition is created. There are only two valid slot names: `"ZS_LEFTHAND"` and `"ZS_RIGHTHAND"`.

Ammunition always corresponds to the equipped ranged weapon instance and its `munition` field in the `C_ITEM` instance

```dae hl_lines="10"
instance ItRw_Sld_Bow(C_Item)
{
    name = "Лук";
    mainflag = ITEM_KAT_FF;
    flags = ITEM_BOW;
    material = MAT_WOOD;
    value = Value_SldBogen;
    damageTotal = Damage_SldBogen;
    damagetype = DAM_POINT;
    munition = ItRw_Arrow;
    cond_atr[2] = ATR_DEXTERITY;
    cond_value[2] = Condition_SldBogen;
    visual = "ItRw_Sld_Bow.mms";
    description = name;
    text[2] = NAME_Damage;
    count[2] = damageTotal;
    text[3] = NAME_Dex_needed;
    count[3] = cond_value[2];
    text[5] = NAME_Value;
    count[5] = value;
};
```

#### DEF_REMOVE_MUNITION

Remove ammunition previously placed by [DEF_PLACE_MUNITION](#def_place_munition) event

Example:
```dae
*eventTag (19 "DEF_REMOVE_MUNITION")
```

Syntax:
```dae
*eventTag (FRAME "DEF_REMOVE_MUNITION")
```

#### DEF_DRAWSOUND

Play weapon drawing sound. Determined by drawn weapon `material` field in the `C_ITEM` instance

 - `“DrawSound_WO.wav”` - for MAT_WOOD;
 - `"DrawSound_ME.wav"` - for MAT_METAL.


Example:
```dae
*eventTag (19 "DEF_DRAWSOUND")
```

Syntax:
```dae
*eventTag (FRAME "DEF_DRAWSOUND")
```

#### DEF_UNDRAWSOUND

Play weapon sheathing sound. Determined by drawn weapon `material` field in the `C_ITEM` instance

 - `"UndrawSound_WO.wav”` - for MAT_WOOD;
 - `"UndrawSound_ME.wav"` - for MAT_METAL.


Example:
```dae
*eventTag (19 "DEF_UNDRAWSOUND")
```

Syntax:
```dae
*eventTag (FRAME "DEF_UNDRAWSOUND")
```

#### DEF_SWAPMESH

Swap items in the specified slots.

Example:
```dae
*eventTag (5 "DEF_SWAPMESH" "ZS_CROSSBOW" "ZS_LEFTHAND")
```

Syntax:
```dae
*eventTag (FRAME "DEF_SWAPMESH" "SLOT1" "SLOT2")
```

`SLOT1` - name of the slot with item to be exchanged.

`SLOT2` - name of the slot with item to be exchanged. 

!!! Warning
    In case `SLOT1` or `SLOT2` is equal to `"ZS_LEFTHAND"` or `"ZS_RIGHTHAND"`, the engine will attempt to put the model into fight mode similar to [DEF_FIGHTMODE](#def_fightmode) event. This can lead to game freezing.

!!! Tip
    This event is similar to the [*eventSwapMesh](#eventswapmesh). The main difference is [*eventSwapMesh](#eventswapmesh) will swap only visuals (meshes) of the items, while [eventTag DEF_SWAPMESH](#def_swapmesh) will swap items and their slot references.
    After a game reload, meshes would reset their positions if swapped using [*eventSwapMesh](#eventswapmesh). Additionally [*eventSwapMesh](#eventswapmesh) does not try to set the model into fight mode.

#### DEF_DRAWTORCH

Does nothing? never used.

Example:
```dae
*eventTag (5 "DEF_DRAWTORCH")
```

Syntax:
```dae
*eventTag (FRAME "DEF_DRAWTORCH")
```

#### DEF_INV_TORCH

Temporarily return torch into inventory, for the duration of mob/item interaction. Does nothing if a torch is not present in `ZS_LEFTHAND`.
Used before interacting with mobs like bed, or before performing eating animations that require a left hand.


Example:
```dae
*eventTag (5 "DEF_INV_TORCH")
```

Syntax:
```dae
*eventTag (FRAME "DEF_INV_TORCH")
```

#### DEF_DROP_TORCH

Drop the torch onto the ground if present in `ZS_LEFTHAND`.

Example:
```dae
*eventTag (5 "DEF_DROP_TORCH")
```

Syntax:
```dae
*eventTag (FRAME "DEF_DROP_TORCH")
```

#### DEF_HIT_LIMB

Set which node is dealing damage to others. This node is then used in calculations for collisions. Up to four slots can be specified.

Example:
```dae
// humans - fist attacks
*eventTag (0	 "DEF_HIT_LIMB"		"BIP01 R HAND")
// humans - sword attacks
*eventTag (0 "DEF_HIT_LIMB" "ZS_RIGHTHAND")
// animals 
eventTag (0 "DEF_HIT_LIMB"    "BIP01 HEAD")
```

Syntax:
```dae
*eventTag (FRAME "DEF_HIT_LIMB" "SLOT1" "SLOT2" "SLOT3" "SLOT4")
```

#### DEF_DIR

Set the direction of the attack. Enemy block animation is determined by this information. Not used.

Example:
```dae
*eventTag (0 "DEF_DIR"	"O")
*eventTag (0 "DEF_DIR"	"L")
*eventTag (0 "DEF_DIR"	"OUOL") // combo attack - top, under, 
```

Syntax:
```dae
*eventTag (FRAME "DEF_DIR" "DIRECTIONS")
```

`DIRECTIONS` - can be up to 10 characters, each character defines one attack direction during combo attack, default is `O` - capital letter `O`, not zero `0`. Possible values are

- `O` - (oben) from top/ over

- `U` - (unter) from under

- `R` - from right

- `L` - from left

If the enemy is trying to block an attack with a defined direction it will choose a matching animation adding a direction suffix like `t_1hParade_U` for opponent's attack direction `U`

!!! Note
    Sadly this feature was unused in Gothic 1. All attacks use `O` direction and only defined animations for blocking are for said `t_1hParade_O` But can be easily restored with a few new animations and MDS file edits.
    In Gothic 2, blocking animation uses zero `0` instead of `O` which might indicate the feature no longer works.


#### DEF_DAM_MULTIPLIER

Set damage multiplier. For the attack animation. The damage will be multiplied by a provided number regardless of whether the attack is a critical attack or not.

Example:
```dae
*eventTag (0 "DEF_DAM_MULTIPLIER"    "0.2")
*eventTag (0 "DEF_DAM_MULTIPLIER"    "2.0")
```

Syntax:
```dae
*eventTag (FRAME "DEF_DAM_MULTIPLIER" "MULTIPLIER")
```

`MULTIPLIER` - float value inside quotes 

#### DEF_PAR_FRAME

Set frame range during which damage is blocked. If not provided whole animation is blocking damage.

Example:
```dae
*eventTag (0 "DEF_PAR_FRAME"    "1 8")
```

Syntax:
```dae
*eventTag (FRAME "DEF_PAR_FRAME" "START_FRAME_END_FRAME")
```

`START_FRAME_END_FRAME` - Two integer numbers inside quotes. if `"0 0"` is provided, the animation will be blocking it's whole duration

#### DEF_OPT_FRAME

Set frames during which damage collisions should be evaluated. Damage is checked for collision with ["hit limb"](#def_hit_limb). This event usually comes in pair with eventTags [DEF_WINDOW](#def_window) and [DEF_HIT_END](#def_hit_end)

Example:
```dae
*eventTag (0 "DEF_OPT_FRAME" "6") // on hit attack, hit on 6th frame
*eventTag (0 "DEF_OPT_FRAME"  "6 30") // 2 attack combo, hit at 6th and 30th frame
```

Syntax:
```dae
*eventTag (FRAME "DEF_OPT_FRAME" "HIT_FRAME1 HIT_FRAME2 ... HIT_FRAME10")
```

`HIT_FRAME1 HIT_FRAME2 ... HIT_FRAME10` - specify 1 and up to 10 integers separated by space inside quotes. Each number represents frame at which damage should be done. Number of provided hit frames determines number of combos (max 10 possible).


#### DEF_HIT_END

Set frames at which the combo is “cut off” if you do not press the “up” key (G1) or the left mouse button (G2) during the attack. Gothic has bug that in this case we will hear all the sound effects following this frame, and the animation ends with the character’s characteristic twitching.
The number of frames specified in this entry must match the number of frames of the [eventTag DEF_OPT_FRAME](#def_opt_frame). 

Example:
```dae
*eventTag (0  "DEF_HIT_END"   "32") 
*eventTag (0  "DEF_HIT_END"   "27 48 75")      
```

Syntax:
```dae
*eventTag (FRAME "DEF_HIT_END" "HIT_END1 HIT_END2 ... HIT_END10")
```

`HIT_END1 HIT_END2 ... HIT_END10` - specify 1 and up to 10 integers separated by space inside quotes. After this frame combo cannot be continued and model will continue animation until the current `DEF_WINDOW -` 1`. Which is usually animation returning to idle stance

#### DEF_WINDOW

Set a “window” in the animation - an interval of frames during which you need to press the “up” (G1) or the left mouse button (G2) to continue the combo strike.

Example:
```dae
*eventTag (0 "DEF_WINDOW"    "9 19") // one combo with window from 9-19 (can be chained)
*eventTag (0  "DEF_WINDOW"    "10 23 32 41 58 70") // 3 combos with windows 10-23 then 32-41, 58-70
```

Syntax:
```dae
*eventTag (FRAME "DEF_WINDOW" "HIT_1_WINDOW_START HIT_1_WINDOW_END HIT_2_WINDOW_START HIT_2_WINDOW_END  ...")
```

`HIT_1_WINDOW_START HIT_1_WINDOW_END HIT_2_WINDOW_START HIT_2_WINDOW_END` - specify 1 and up to 20? integers separated by space inside quotes. A window consists of a start and end frame, therefore for each DEF_OPT_FRAME, you must provide 2 numbers.

- `HIT_WINDOW_START` - First value of the pair defines frame from which attack can continue.
- `HIT_WINDOW_END` - Second value is a little confusing. It defines **START** of the next attack animation. Ability to continue combo stops at [DEF_HIT_END](#def_hit_end) frames. Usually there are few frames of animation, where characters returns to idle position. `HIT_WINDOW_END` should be one frame after characters return to idle stance, which should also be first frame of the next attack


#### Attack eventTags explained

This is original attack combo from Gothic 1

```dae
ani	("s_1hAttack"   1   "s_1hAttack"    0.0	0.1	M.  "Hum_1hAttackComboT3_M05.asc"   F	1	114)
{
    *eventTag		(0 "DEF_HIT_LIMB"	"ZS_RIGHTHAND")
    *eventTag		(0 "DEF_OPT_FRAME"	"4 36 73 107") 
    *eventTag		(0 "DEF_HIT_END"	"31 63 95 113")
    *eventTag		(0 "DEF_WINDOW"		"10 33 42 65 78 97 110 113")
    *eventSFX		(4	"Whoosh"	EMPTY_SLOT	)
    *eventSFX		(72	"BACK"	EMPTY_SLOT	)
}

```

I will edit it slightly to make it more readable. Let's focus on the DEF_OPT_FRAME, DEF_HIT_END, 

```dae
ani	("s_1hAttack"   1   "s_1hAttack"    0.0	0.1	M.  "Hum_1hAttackComboT3_M05.asc"   F	1	114)
{
    ...
    *eventTag		(0 "DEF_OPT_FRAME"	"4         36         73         107         ") 
    *eventTag		(0 "DEF_HIT_END"	"      31         63       95             113")
    *eventTag		(0 "DEF_WINDOW"		"   10   33     42  65   78  97     110   113")
    ...
}
```

Let's focus only on the first combo.

```dae
ani	("s_1hAttack"   1   "s_1hAttack"    0.0	0.1	M.  "Hum_1hAttackComboT3_M05.asc"   F	1	114)
{
    ...
    *eventTag		(0 "DEF_OPT_FRAME"	"4          ...") 
    *eventTag		(0 "DEF_HIT_END"	"      31   ...")
    *eventTag		(0 "DEF_WINDOW"		"   10   33 ...")
    ...
}
```

| Frames        | Animation                                                 |  Description                                                                                  |
|---------------|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| 1       | animation start                                           |                                                                                                     |
| 1..4    | swing of the sword                                        |                                                                                                     |
| 4       | sword is in the front of the model                        | `DEF_OPT_FRAME` - test damage collisions at this frame                                              |
|  4..10  | end of the sword swing                                    |                                                                                                     |
| 10      | model stands ready to start next swing                    | `DEF_WINDOW` - user can press key to advance combo from this frame.                                 |
| 10..31  | slight idle 'shake'                                       | if player continues combo, animation playback will jump to the frame 33 (`DEF_WINDOW` second pair), from the animation perspective, next attack starts from pose similar to frame 10. If perfect inputs would be provided, animation would continue perfectly. |
| 31      |                                                           | `DEF_HIT_END` - ends user input.                                                                    |
| 31..32  | model returns to the idle position                        |                                                                                                     |
| 32      | idle position, standing with sword in hand                | animation will end here, if combo not continued (`DEF_WINDOW` second pair - 1)                      |
| 33      | first frame of the next attack (similar to frame 10)      | `DEF_WINDOW` second pair, start of next attack                                                      |





## eventPfxGrnd

Not used anywhere in the original game. Could possibly spawn particle effect like [eventPfx](#eventpfx) but with an added suffix similar to how [eventSfxGrnd](#eventsfxgrnd) works. Needs to be investigated.

Syntax:
```dae
*eventPFXGRND (FRAME)
```

## eventSetMesh

Unknown

Syntax:
```dae
*eventSETMESH (FRAME "NODE_NAME")
```

## modelTag

Should work similarly to [eventTag](#eventtag), but can be defined inside aniEnum block and applies to all animations of the Model.

Syntax:
```dae
*modelTag (FRAME "EVENT_TAG_TYPE" "PARAMETER1" "PARAMETER2" "PARAMETER3" "PARAMETER4" ... )
```
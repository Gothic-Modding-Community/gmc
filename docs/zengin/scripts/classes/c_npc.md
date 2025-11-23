---
title: C_NPC
---

# C_NPC Daedalus class

Class `C_Npc` describes the character and monsters. The playable character is also an NPC.

!!! Tip
    You can call externals inside the instance of `C_NPC` class e.g. to give an item or customize look of the NPC.

    ```dae
    instance PC_HERO (C_NPC)
    {
        // ...
        CreateInvItems (self, ItFo_Wine, 10);
        // ...
    };
    ```

## Class definition
`C_Npc` class definition differs between Gothic 1 and Gothic 2 Addon.

=== "G1"

    Class definition as it is defined in [`Scripts/Content/_intern/Classes.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Classes.d#L11-L59) script file.

    ??? "C_Npc Daedalus class"
        ```dae
        class C_Npc 
        {
            var int     id;                                 // NPC id
            var string 	name[5];                            // NPC name
            var string 	slot;			                    // Slot (deprecated)
            var int		npcType;			                // NPC type
            var int	    flags;			                    // NPC flags
            var int     attribute[ATR_INDEX_MAX];			// Attribute values
            var int		protection[PROT_INDEX_MAX];			// Protection values
            var int		damage[DAM_INDEX_MAX];			    // Damage values
            var int		damagetype;                         // Type of damage
            var int	    guild;                              // NPC guild
            var int	    level;                              // NPC level
            var func    mission[MAX_MISSIONS];			    // Missions (deprecated)
            var int		fight_tactic;			            // NPC fight tactic
            var int	    weapon;			                    // Current comabt mode
            var int		voice;			                    // SVM voice assigned to the NPC
            var int		voicePitch;			                // Pitch of the voice
            var int		bodymass;			                // Body mass (deprecated)

            // Routine	
            var func	daily_routine;                      // Starting daily routine of the NPC
            var func    start_aistate;                      // Starting AI state of the NPC

            // Respawn
            var string	spawnPoint;                         // Spawn point (deprecated)
            var int		spawnDelay;                         // Spawn delay (deprecated)

            // Senses
            var int 	senses;                             // NPC senses
            var int 	senses_range;                       // NPC senses range

            // AI
            var int		aivar[50];						    // AI variables
            var string	wp;			                        // Currently tracked waypoint

            // Experience
            var int		exp;                                // Experience points
            var int		exp_next;                           // Experience points needed for the next level
            var int		lp;                                 // Learning points
        };	
        ```

=== "G2A"

    Class definition as it is defined in [`Scripts/Content/_intern/Classes.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Classes.d#L12-L68) script file.

    ??? "C_Npc Daedalus class"
        ```dae
        class C_Npc 
        {
            var int     id;                                 // NPC id
            var string 	name[5];                            // NPC name
            var string 	slot;			                    // Slot (deprecated)
            var string	effect;                             // Visual effect
            var int		npcType;			                // NPC type
            var int	    flags;			                    // NPC flags
            var int     attribute[ATR_INDEX_MAX];			// Attribute values
            var int 	hitChance[MAX_HITCHANCE];           // Fight skill values
            var int		protection[PROT_INDEX_MAX];			// Protection values
            var int		damage[DAM_INDEX_MAX];			    // Damage values
            var int		damagetype;                         // Type of damage
            var int	    guild;                              // NPC guild
            var int	    level;                              // NPC level
            var func    mission[MAX_MISSIONS];			    // Missions (deprecated)
            var int		fight_tactic;			            // NPC fight tactic
            var int	    weapon;			                    // Current comabt mode
            var int		voice;			                    // SVM voice assigned to the NPC
            var int		voicePitch;			                // Pitch of the voice
            var int		bodymass;			                // Body mass (deprecated)

            // Routine	
            var func	daily_routine;                      // Starting daily routine of the NPC
            var func    start_aistate;                      // Starting AI state of the NPC

            // Respawn
            var string	spawnPoint;                         // Spawn point (deprecated)
            var int		spawnDelay;                         // Spawn delay (deprecated)

            // Senses
            var int 	senses;                             // NPC senses
            var int 	senses_range;                       // NPC senses range

            // AI
            var int		aivar[100];						    // AI variables
            var string	wp;			                        // Currently tracked waypoint
            				
            // Experience
            var int		exp;                                // Experience points
            var int		exp_next;                           // Experience points needed for the next level
            var int		lp;                                 // Learning points

            var int		bodyStateinterruptableOverride;		// Possibility to interrupt the current body state
            var int     noFocus;							// Disable focus on the NPC
        };		
        ```

## Class members

| variable                          | Type   | Description                                                                         |
|-----------------------------------|--------|-------------------------------------------------------------------------------------|
| [id](#id)                         | int    | NPC id                                                                              |
| [name](#name)                     | string | NPC name                                                                            |
| [slot](#slot)                     | string | Slot (deprecated)                                                                   |
| [effect](#effect)                 | string | Visual effect (only in G2A)                                                         |
| [npcType](#npctype)               | int    | NPC type                                                                            |
| [flags](#flags)                   | int    | NPC flags                                                                           |
| [attribute](#attribute)           | int    | NPC attribute values                                                                |
| [hitChance](#hitchance)           | int    | NPC fight skill values (only in G2A)                                                |
| [protection](#protection)         | int    | NPC protection against damage types                                                 |
| [damage](#damage)                 | int    | NPC damage values                                                                   |
| [damagetype](#damagetype)         | int    | NPC damage type                                                                     |
| [guild](#guild)                   | int    | NPC guild                                                                           |
| [level](#level)                   | int    | NPC level                                                                           |
| [mission](#mission)               | func   | Missions (deprecated)                                                               |
| [fight_tactic](#fight_tactic)     | int    | NPC fight tactic                                                                    |
| [weapon](#weapon)                 | int    | Current comabt mode                                                                 |
| [voice](#voice)                   | int    | SVM voice assigned to the NPC                                                       |
| [voicePitch](#voicepitch)         | int    | Pitch of the voice                                                                  |
| [bodymass](#bodymass)             | int    | Body mass (deprecated)                                                              |
| [daily_routine](#daily_routine)   | func   | Starting daily routine of the NPC                                                   |
| [start_aistate](#start_aistate)   | func   | Starting AI state of the NPC                                                        |
| [spawnPoint](#spawnpoint)         | string | Spawn point (deprecated)                                                            |
| [spawnDelay](#spawndelay)         | int    | Spawn delay (deprecated)                                                            |
| [senses](#senses)                 | int    | NPC senses                                                                          |
| [senses_range](#senses_range)     | int    | NPC senses range                                                                    |       
| [aivar](#aivar)                   | int    | NPC AI variables                                                                    |
| [wp](#wp)                         | string | Currently tracked waypoint                                                          |
| [exp](#exp)                       | int    | Experience points                                                                   |
| [exp_next](#exp_next)             | int    | Experience points needed for the next level                                         |
| [lp](#lp)                         | int    | Learning points                                                                     |
| [bodyStateinterruptableOverride](#bodystateinterruptableoverride) | int    | Possibility to interrupt the current body state (only in G2A)  |
| [noFocus](#nofocus)               | int    | Disable focus on the NPC (only in G2A)                                              |



## Class member overview
Description of the class member variables.

### id
Unique identification number used for human NPCs.

### name
Name of the NPC. Only the first name from array is used.

### slot
!!! Danger "Deprecated setting"
    Slot.
    
### effect
VFX visual effect aplied to the NPC. The effect must be defined as `CFx_Base` instance.

!!! Warning
    This property is only available in Gothic 2 Addon.

### npcType
Type of NPC. 

=== "G1"
    NPC type constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L71-L86) file.

    ```dae
    const int NPCTYPE_AMBIENT		= 0; // Ambient NPC
    const int NPCTYPE_MAIN			= 1; // Main NPC
    const int NPCTYPE_GUARD			= 2; // Guard NPC
    const int NPCTYPE_FRIEND		= 3; // Friend
    const int NPCTYPE_MINE_AMBIENT  = 4; // Ambient NPC in mines
    const int NPCTYPE_MINE_GUARD	= 5; // Guard NPC in mines
    const int NPCTYPE_OW_AMBIENT	= 6; 
    const int NPCTYPE_OW_GUARD		= 7;
    const int NPCTYPE_ROGUE			= 8; // Rogue/Bandit
    ```
    
=== "G2A"    

    NPC type constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L529-L540) file.

    ```dae
    const int NPCTYPE_AMBIENT		= 0; // Ambient NPC
    const int NPCTYPE_MAIN			= 1; // Main NPC
    const int NPCTYPE_FRIEND		= 2; // Friend
    const int NPCTYPE_OCAMBIENT		= 3; // Ambient NPC in Valley of Mines
    const int NPCTYPE_OCMAIN		= 4; // Main NPC in Valley of Mines
    const int NPCTYPE_BL_AMBIENT	= 5; // Ambient NPC in Bandit Camp
    const int NPCTYPE_TAL_AMBIENT	= 6;
    const int NPCTYPE_BL_MAIN		= 7; // Main NPC in Bandit Camp
    ```

### flags
NPC flags. 

=== "G1"
    NPC flag constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L21-L25) file.
    
    ```dae
    CONST INT NPC_FLAG_FRIEND	=  1 << 0;	// Friend (not used)
    CONST INT NPC_FLAG_IMMORTAL	=  1 << 1;	// Immmortal
    ```

=== "G2A"
    NPC flag constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L44-L49) file.

    ```dae
    CONST INT NPC_FLAG_FRIEND	=  1 << 0;	// Friend (not used)
    CONST INT NPC_FLAG_IMMORTAL	=  1 << 1;	// Immmortal
    CONST INT NPC_FLAG_GHOST	=  1 << 2;	// Ghost effect
    ```

### attribute
Array of NPC attribute values.

Attribute constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L28-L42) file.

```dae
const int ATR_HITPOINTS				=  0;	// Hitpoints
const int ATR_HITPOINTS_MAX			=  1;	// Maximum Hitpoints
const int ATR_MANA					=  2;	// Mana
const int ATR_MANA_MAX				=  3;	// Maximum Mana

const int ATR_STRENGTH				=  4;	// Strength
const int ATR_DEXTERITY				=  5;	// Dexterity
const int ATR_REGENERATEHP			=  6;	// Health regeneration (deprecated)
const int ATR_REGENERATEMANA		=  7;   // Mana regeneration (deprecated)

const int ATR_INDEX_MAX				=  8;
```

!!! Note
    Some attributes are associated with [`C_MENU_ITEM`](c_menuitem.md#predefined-instances) predefined instances.

    | Attribute               | Menu item instance          |
    |-------------------------|-----------------------------|
    | ATR_STRENGTH            | `MENU_ITEM_ATTRIBUTE_1`     |
    | ATR_DEXTERITY           | `MENU_ITEM_ATTRIBUTE_2`     |
    | ATR_MANA                | `MENU_ITEM_ATTRIBUTE_3`     |
    | ATR_HITPOINTS           | `MENU_ITEM_ATTRIBUTE_4`     |   

### hitChance
Array of NPC skill for fighting with different types of weapons.

NPC talents constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L945-L949) file.

```dae
const int NPC_TALENT_1H					= 1; // One-handed weapons
const int NPC_TALENT_2H					= 2; // Two-handed weapons
const int NPC_TALENT_BOW				= 3; // Bows
const int NPC_TALENT_CROSSBOW			= 4; // Crossbows
```


!!! Warning
    This property is only available in Gothic 2 Addon.

### protection
Array of NPC protection values against different types of damage.

Protection constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L200-L211) file.

```dae
CONST INT PROT_BARRIER      = DAM_INDEX_BARRIER; // Protection form magic barrier
CONST INT PROT_BLUNT		= DAM_INDEX_BLUNT;   // Protection from blunt weapons (hammers, maces)
CONST INT PROT_EDGE			= DAM_INDEX_EDGE;    // Protection from edged weapons (swords, axes, rapiers)
CONST INT PROT_FIRE			= DAM_INDEX_FIRE;    // Protection from fire
CONST INT PROT_FLY			= DAM_INDEX_FLY;     // Protection from knockback
CONST INT PROT_MAGIC		= DAM_INDEX_MAGIC;   // Protection from magic
CONST INT PROT_POINT		= DAM_INDEX_POINT;   // Protection from point damage (bows, crossbows)
CONST INT PROT_FALL			= DAM_INDEX_FALL;    // Protection from fall damage

CONST INT PROT_INDEX_MAX	= DAM_INDEX_MAX;     // Number of protection types
```

### damage
Array of maximum damage values inflicted by the NPC for different types of damage. Used with [`damagetype`](#damagetype) property.

Damage type constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L163-L174) file.

### damagetype
Type of damage inflicted by the NPC. Used with [`damage`](#damage) property. 

!!! Tip
    You can combine multiple damage types using the bitwise OR operator `|`.

Damage type constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L163-L174) file.

### guild
NPC guild. Guilds differ between Gothic 1 and Gothic 2 Addon, but could be devided into two main groups - `human` and `animal`.

=== "G1"
    Guild constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L305-L356) file.

    Relations between human guilds are specified in `GIL_ATTITUDES` array inside the [`Scripts/Content/Story/Guilds.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/Story/Guilds.d) file.

=== "G2A"
    Guild constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L297-L379) file.

    Relations between human guilds are specified in `GIL_ATTITUDES` array inside the [`Scripts/Content/AI/Human/Guilds.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/Human/Guilds.d) file.

!!! Info
    General parameters for each guild are specified inside the instance of the `C_GilValues` class.

### level
Current level of the NPC.

=== "G1"
    Logic for hero leveling is implemented in the [`B_GiveXP`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/Story/B/B_GiveXP.d) function.

=== "G2A"
    Logic for hero leveling is implemented in the [`B_GivePlayerXP`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/Story/B_Story/B_GivePlayerXP.d) function.

!!! Note
    This property is available in menu as `MENU_ITEM_LEVEL` predefined instance of the [`C_MENU_ITEM`](c_menuitem.md#predefined-instances) class.

### mission
!!! Danger "Deprecated setting"
    Array of missions assigned to the NPC.

### fight_tactic
NPC fight tactic. Tactics are described by the `C_FightAI` class instances and each tactic has its own index.

=== "G1"
    Fight tactic constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L88-L120) file.

=== "G2A"
    Fight tactic constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L464-L505) file.

### weapon
Current combat mode of the NPC. Property is never used in the game scripts but should work with following constants.

```dae
const int WEAPON_NONE   = 0; // Unarmed
const int WEAPON_FIST   = 1; // Fist
const int WEAPON_DAG    = 2; // Dagger
const int WEAPON_1H     = 3; // One-handed weapon
const int WEAPON_2H     = 4; // Two-handed weapon
const int WEAPON_BOW    = 5; // Bow
const int WEAPON_CBOW   = 6; // Crossbow
const int WEAPON_MAGIC  = 7; // Magic
```

### voice
Voice assigned to the NPC. This is used for [`C_SVM`](c_svm.md) instances.

For example, if the NPC has `voice` property set to `1`, it will use the `SVM_1` instance of the `C_SVM` class.

```dae
instance SVM_1(C_SVM)
{
  // ...  
};
```

### voicePitch
Pitch of the voice. Accepts values from `-5` to `5`. 

!!! Note
    When the pitch is lowered, the playback speed is decreased and overlaing may occur.

### bodymass
!!! Danger "Deprecated setting"
    Body mass of the NPC.

### daily_routine
Function defining the starting daily routine of the NPC.

All routine functions start with the `Rtn_` prefix and end with NPC id as suffix. For example, the `Start` routine of the npc with id `1` will be defined like this:

```dae
func void Rtn_Start_1()
{
    // ...
};
```

Instide the function body should be `TA_` function calls defining the routine actions. It is important to remember that the routine have to contain at least two functions.

```dae
func void Rtn_Start_1()
{
    TA_SmallTalk (07,00,21,00, "OC1");
    TA_SmallTalk (21,00,07,00, "OC1");
};
```

To Change the daily routine use the [`Npc_ExchangeRoutine`](../externals/npc.md#npc_exchangeroutine) function.

### start_aistate
Function defining the starting AI state of the NPC. Used mainly for monsters and animals that do not have a daily routine.

### spawnPoint
!!! Danger "Deprecated setting"
    Spawn point of the NPC.

### spawnDelay
!!! Danger "Deprecated setting"
    Spawn delay of the NPC.

### senses
Active NPC senses. Used with [`senses_range`](#senses_range) property.

Senses constants are defined in [`Scripts/Content/_intern/Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/_intern/Constants.d#L222-L227) file.

```dae
CONST INT SENSE_SEE		= 1 << 0; // Vision
CONST INT SENSE_HEAR	= 1 << 1; // Hearing
CONST INT SENSE_SMELL	= 1 << 2; // Smell
```

### senses_range
Range of active NPC [senses](#senses) in cm. 

### aivar
Array of NPC AI variables. Used inside the NPC AI scripts.

=== "G1"
    Array has 50 elements.

    Aivar constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L1-L69) file.

=== "G2A"
    Array has 100 elements.

    Aivar constants are defined in [`Scripts/Content/AI/AI_Intern/AI_Constants.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/Content/AI/AI_Intern/AI_Constants.d#L1-L339) file.

### wp
Currently tracked waypoint. Used with the pathfinding system.

### exp
Current experience points of the NPC. 

See [`level`](#level) property for more information about leveling.

!!! Note
    This property is available in menu as `MENU_ITEM_EXP` predefined instance of the [`C_MENU_ITEM`](c_menuitem.md#predefined-instances) class.


### exp_next
Experience points needed for the next level. 

See [`level`](#level) property for more information about leveling.

!!! Note
    This property is available in menu as `MENU_ITEM_LEVEL_NEXT` predefined instance of the [`C_MENU_ITEM`](c_menuitem.md#predefined-instances) class.

### lp
Current learning points of the NPC. Optained when the NPC levels up. 

See [`level`](#level) property for more information about leveling.

!!! Note
    This property is available in menu as `MENU_ITEM_LEARN` predefined instance of the [`C_MENU_ITEM`](c_menuitem.md#predefined-instances) class.

### bodyStateinterruptableOverride
Possibility to interrupt the current body state.

!!! Warning
    This property is only available in Gothic 2 Addon.

### noFocus
Disable focus on the NPC. The NPC will not be highlighted when the player looks at it.

!!! Warning
    This property is only available in Gothic 2 Addon.

[^1]: Heavily inspired by the amazing documentation site [Gothic library](http://gothic-library.ucoz.org/)
# Trialoge
This package allows you to create conversations with any number of NPCs and control the camera during the dialog.

## Dependencies

- [AI_Function](../tools/ai_function.md)

## Initialization
Initialize with `LeGo_Trialoge` flag.
```dae
LeGo_Init(LeGo_Trialoge);
```
## Implementation
[:material-github: Trialoge.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)

## Functions

### `EquipWeapon`
Sektenspinner's function. (Taken from the forum.) 
```dae
func void EquipWeapon(var C_NPC slf, var int ItemInstance)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC to have a weapon equipped
- `#!dae var int ItemInstance`  
    Weapon instance to be equipped

### `Npc_GetArmor`
Returns NPC's equipped armor.
```dae
func int Npc_GetArmor(var C_NPC slf)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC to get the armor from

**Return value**

The function returns instance of armor worn by the NPC.

### `Npc_GetMeleeWeapon`
Returns NPC's equipped melee weapon.
```dae
func int Npc_GetMeleeWeapon(var C_NPC slf)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC to get the weapon from

**Return value**

The function returns instance of melee weapon equipped by the NPC.

### `DiaCAM_Update`
Sektenspinner's function that updates the dialogue camera. (Used internally.)
```dae
func void DiaCAM_Update()
```

### `DiaCAM_Disable`
Completely disable the dialogue cameras.
```dae
func void DiaCAM_Disable()
```

### `DiaCAM_Enable`
Resets the dialogue cameras to the default settings.
```dae
func void DiaCAM_Enable()
```
### `TRIA_Wait`
Makes `self` and `other` wait for each other, e.g. for `AI_GotoWP` actions for synchronization. 
```dae
func void TRIA_Wait()
```

### `TRIA_Invite`
Invites an NPC into a conversation. Must be called before `TRIA_Start`.
```dae
func void TRIA_Invite(var C_NPC slf)
```
**Parameters**

- `#!dae var C_NPC slf`  
    The invited NPC

### `TRIA_Start`
Starts trialogues. Before that, all NPCs should be invited by `TRIA_Invite`.
```dae
func void TRIA_Start()
```

### `TRIA_Barrier`
Similar to `TRIA_Wait` but applies to all participating NPCs.
```dae
func void TRIA_Barrier()
```

### `TRIA_Next`
Sets the called npc to `self`.
```dae
func void TRIA_Next(var C_NPC n0)
```
**Parameters**

- `#!dae var C_NPC n0`  
    NPC to set to `self`

### `TRIA_Cam`
Starts a tracking shot. 
```dae
func void TRIA_Cam(var string evt)
```
**Parameters**

- `#!dae var string evt`  
    The name of the tracking shot in Spacer. If `""` is passed, the running trace shot will be aborted.

### `TRIA_Finish`
Ends an ongoing trialogue. Must always be called at the end, otherwise no further trialogues can be started.
```dae
func void TRIA_Finish()
```

## Examples

### A Simple Trialogue
The following conversation is resolved via the trialogues:

1. **Arto:** I'm sorry Hero, but you can't pass here.
2. **Hero:** Why not?
3. **Horka:** The city has been closed.
4. **Hero:** I have some gold with me, can we trade?
5. **Squelto:** No. We are not open to bribery.
6. **Hero:** Sure?
7. **Arto:** I have to ask you to leave now.
8. **Hero:** Well...
```dae
instance TRIA_Test (C_INFO)
{
    npc         = PAL_100_Friend;
    nr          = 10;
    condition   = TRIA_Test_condition;
    information = TRIA_Test_info;
    important   = FALSE;
    permanent   = 1;
    description = "TRIALOGTEST";
};

func int TRIA_Test_condition()
{
    return TRUE;
};

func void TRIA_Test_info()
{
    var C_NPC Arto; Arto       = Hlp_GetNpc(PAL_100_Friend); // He is the owner of dialogue
    var C_NPC Horka; Horka     = Hlp_GetNpc(PAL_101_Horka);
    var C_NPC Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);
   
    TRIA_Invite(Horka);   // Invite Horka into this dialogue
    TRIA_Invite(Squelto); // Invite Squelto into this dialog
    TRIA_Start();         // Start the conversation
    // The hero and Arto do not have to/may not be invited. They are in dialogue anyway.
   
    // Hero now talks to Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    DIAG_Reset();
   
    AI_Output (self, other, "TRIA_TEST_00"); //Sorry hero, but you can't pass here.
   
    // Hero now talks to Horka (self = Horka, other = Hero)
    TRIA_Next(Horka);
   
    AI_Output (other, self, "TRIA_TEST_01"); //Why not?
   
    AI_GotoNpc(self, other);
    AI_TurnToNpc(other, self);
   
    AI_Output (self, other, "TRIA_TEST_02"); //The city has been closed.
   
    // Hero looks around conspiratorially during the next sentence
    DIAG("Nervous", 1, 2);
   
    AI_Output (other, self, "TRIA_TEST_03"); //I have some gold with me, can we trade?
   
    // Hero should now move normally again
    DIAG_Reset();
   
    // Start tracking shot
    TRIA_Cam("CAMERASTART");
   
    // Hero now talks to Squelto (self = Squelto, other = Hero)
    TRIA_Next(Squelto);
   
    AI_TurnToNpc(other, self);
   
    DIAG("No", 0, 1);
    AI_Output (self, other, "TRIA_TEST_04"); //No. We are not open to bribery.
   
    // Hero talks to Arto again (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    // Hero should now articulate questioningly
    DIAG("NotSure", 0, 1);
   
    AI_Output (other, self, "TRIA_TEST_05"); //Sure?
   
    AI_TurnToNpc(other, self);
   
    // tracking shot end
    TRIA_Cam("");
   
    // Arto should react angrily
    DIAG("Angry", 0, 4);
   
    AI_Output (self, other, "TRIA_TEST_06"); //I have to ask you to leave now
   
    // Hero should now move normally again
    DIAG_Reset();
   
    AI_Output (other, self, "TRIA_TEST_07"); //Well...
   
    TRIA_Finish(); // End
};
```
!!! Note
    In addition, here are still [Dialoggestures](dialoggestures.md) used.

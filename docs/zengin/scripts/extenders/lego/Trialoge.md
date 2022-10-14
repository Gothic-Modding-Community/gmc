# Trialoge
This package allows you to create conversations with any number of NPC's and control the camera during the dialog.

## Dependencies

- AI_Function

## Initialization
Initialize with `LeGo_Trialoge` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Trialoge);
```
## Implementation
[:material-github: Trialoge.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)

## Functions

### EquipWeapon
Sektenspinner's function. (Taken from the forum.) 
```dae
func void EquipWeapon(var c_npc slf, var int ItemInstance) {};
```

- `slf` - NPC to have a weapon equipped
- `ItemInstance` - weapon instance to be equipped

### Npc_GetArmor
Returns NPC's equipped armor.
```dae
func int Npc_GetArmor(var c_npc slf) {};
```

- `slf` - NPC to get the armour from
- `return` - armor instance

### Npc_GetMeleeWeapon
Returns NPC's equipped melee weapon.
```dae
func int Npc_GetMeleeWeapon(var c_npc slf) {};
```

- `slf` - NPC to get the weapon from

### DiaCAM_Update
Sektenspinner's function. Updates the dialogue camera. (Used internally.)
```dae
func void DiaCAM_Update() {};
```

### DiaCAM_Disable
Completely disable the dialogue cameras.
```dae
func void DiaCAM_Disable() {};
```

### DiaCAM_Enable
Resets the dialogue cameras to the default settings.
```dae
func void DiaCAM_Enable() {};
```
### TRIA_Wait
Makes `self` and `other` wait for each other, e.g. for `AI_GotoW`P actions for synchronization. 
```dae
func void TRIA_Wait() {};
```

### TRIA_Invite
Invites an NPC into a conversation. Must be called before `TRIA_Start`.
```dae
func void TRIA_Invite(c_npc slf) {};
```

- `slf` - The invited NPC

### TRIA_Start
Starts trialogues. Before that, all NPC's should be invited by `TRI_Invite`.
```dae
func void TRIA_Start() {};
```

### TRIA_Barrier
Similar to `TRIA_Wait` but applies to all participating NPCs.
```dae
func void TRIA_Barrier() {};
```

### TRIA_Next
Sets the called npc to `self`.
```dae
func void TRIA_Next(c_npc n0) {};
```

- `n0` - can be addressed with `self`

### TRIA_Cam
Starts a tracking shot. 
```dae
func void TRIA_Cam(string evt) {};
```

- `evt` - the name of the tracking shot in Spacer. If `""` is passed, the running trace shot will be aborted

### TRIA_Finish
Ends an ongoing trialogue. Must always be called at the end, otherwise no further trialogues can be started.
```dae
func void TRIA_Finish() {};
```

## Examples

### A Simple Trialogue
The following conversation is resolved via the trialogues:

   1. **Arto:**    Sorry hero, but you can't pass here
   2. **Hero:**    Why not?
   3. **Horka:**   The city has been closed.
   4. **Hero:**    I have some gold with me, can we trade?
   5. **Squelto:** No. We are not open to bribery.
   6. **Hero:**    Sure?
   7. **Arto:**    I have to ask you to leave now
   8. **Hero:**    Well...
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
    var c_npc Arto; Arto       = Hlp_GetNpc(PAL_100_Friend); // He is the owner of dialogue
    var c_npc Horka; Horka     = Hlp_GetNpc(PAL_101_Horka);
    var c_npc Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);
   
    TRIA_Invite(Horka);   // Invite Horka into this dialogue
    TRIA_Invite(Squelto); // Invite Squelto into this dialog
    TRIA_Start();         // Start the conversation
    // The hero and Arto do not have to/may not be invited. They are in dialogue anyway.
   
    // Hero now talks to Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    DIAG_Reset();
   
    AI_Output (self, other, "TRIA_TEST_00"); //Sorry hero, but you can't pass here
   
    // Hero now talks to Horka (self = Horka, other = Hero)
    TRIA_Next(Horka);
   
    AI_Output (other, self, "TRIA_TEST_01"); //Why not?
   
    AI_GotoNpc(self, other);
    AI_TurnToNpc(other, self);
   
    AI_Output (self, other, "TRIA_TEST_02"); //The city has been closed.
   
    // Held looks around conspiratorially during the next sentence
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
    In addition, here are still dialog gestures used (the page will be added later).

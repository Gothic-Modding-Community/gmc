# Trialoge
This package allows you to create conversations with any number of Npcs and control the camera during the dialog.

## Dependencies

- Ikarus
- AI_Function

## Initialization
Initialize with `LeGo_Trialoge` flag.
```c++
LeGo_Init(LeGo_Trialoge)
```
## Implementation
[:material-github: Trialoge.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)
## Functions
### EquipWeapon
Sektspinner function. (Taken from the forum.) 
```c++
void EquipWeapon(c_npc slf, int ItemInstance)
```
### Npc_GetArmor
Helper function. Here the name says it all.
```c++
int Npc_GetArmor(c_npc slf)
```
### Npc_GetMeleeWeapon
Helper function. Here the name says it all.
```c++
int Npc_GetMeleeWeapon(c_npc slf)
```
### DiaCAM_Update
Sektspinner function. Updates the dialogue camera. (Used internally.)
```c++
void DiaCAM_Update()
```
### DiaCAM_Disable
Completely disable the dialogue cameras.
```c++
void DiaCAM_Disable()
```
### DiaCAM_Enable
Resets the dialogue cameras to default settings.
```c++
void DiaCAM_Enable()
```
### TRIA_Wait
Makes self and other wait for each other, e.g. for AI_GotoWP actions for synchronization. 
```c++
void TRIA_Wait()
```
### TRIA_Invite
Invites an Npc into a conversation. Must be called before `TRIA_Start`.
```c++
void TRIA_Invite(c_npc slf)
```
- `slf` - The invited npc
### TRIA_Start
Starts trialogues. Before that, all npcs should be invited by `TRI_Invite`.
```c++
void TRIA_Start()
```
### TRIA_Barrier
Similar to `TRIA_Wait` but applies to all participating NPCs.
```c++
void TRIA_Barrier()
```
### TRIA_Next
Sets the called npc to 'self'.
```c++
void TRIA_Next(c_npc n0)
```
- `n0` - Can be addressed with `self`
### TRIA_Cam
Starts a tracking shot. 
```c++
void TRIA_Cam(string evt)
```
- `evt` - the name of the tracking shot in the spacer. If "" is passed, the running trace shot will be aborted
### TRIA_Finish
Ends ongoing trialogues. Must always be called at the end, otherwise no further trialogues can be started.
```c++
void TRIA_Finish()
```
## Examples
### A Simple Trialogue
The following conversation is resolved via the trialogues:

   1. Arto: Sorry hero, but you can't pass here
   2. Hero: Why not?
   3. Horka: The city has been closed.
   4. Hero: I have some gold with me, can we trade?
   5. Squelto: No. We are not open to bribery.
   6. Hero: Sure?
   7. Arto: I have to ask you to leave now
   8. Hero: Well...
```c++
instance TRIA_Test (C_INFO)
{
 npc = PAL_100_Friend;
 nr = 10;
 condition = TRIA_Test_condition;
 information = TRIA_Test_info;
 important = FALSE;
 permanent = 1;
 description = "TRIALOGTEST";
};

func int TRIA_Test_condition()
{
 return TRUE;
};

func void TRIA_Test_info()
{
 var c_npc Arto; Arto = Hlp_GetNpc(PAL_100_Friend); // He is owner of dialogue
 var c_npc Horka; Horka = Hlp_GetNpc(PAL_101_Horka);
 var c_npc Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);

 TRIA_Invite(Horka); // Invite Horka into this dialogue
 TRIA_Invite(Squelto); // Invite Squelto into this dialog
 TRIA_Start(); // Start the conversation
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
In addition, here are still dialog gestures used (the page will be added later).

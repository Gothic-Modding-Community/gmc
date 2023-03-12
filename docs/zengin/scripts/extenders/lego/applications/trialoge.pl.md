# Trialogi
Ten pakiet pozwala na tworzenie rozmów z dowolną liczbą NPC i sterowanie kamerą podczas dialogu.

## Zależności

- [AI_Function](../tools/ai_function.md)

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_Trialoge`.
```dae
LeGo_Init(LeGo_Trialoge);
```
## Implementacja
[:material-github: Trialoge.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)

## Funkcje

### `EquipWeapon`
Funkcja Sektenspinnera. (wzięta z forum)
```dae
func void EquipWeapon(var c_npc slf, var int ItemInstance)
```
**Parametry**

- `#!dae var c_npc slf`  
    NPC który wyposaża broń
- `#!dae var int ItemInstance`  
    Instancja broni do wyposażenia

### `Npc_GetArmor`
Pobiera pancerz wyposażony przez NPC.
```dae
func int Npc_GetArmor(var c_npc slf)
```
**Parametry**

- `#!dae var c_npc slf`  
    NPC którego pancerz jest pobierany

**Zwracana wartość**

Funkcja zwaraca instancje pancerza założonego przez NPC.

### `Npc_GetMeleeWeapon`
Pobiera wyposażoną przez NPC broń białą.
```dae
func int Npc_GetMeleeWeapon(var c_npc slf)
```
**Parametry**

- `#!dae var c_npc slf`  
    NPC którego broń jest pobierana

**Zwracana wartość**

Funkcja zwaraca instancje broni białej wyposarzonej przez NPC.

### `DiaCAM_Update`
Funkcja Sektenspinnera. Aktualizuje kamerę dialogową. (Używana wewnętrznie)
```dae
func void DiaCAM_Update()
```

### `DiaCAM_Disable`
Całkowicie wyłącza kamery dialogowe.
```dae
func void DiaCAM_Disable()
```

### `DiaCAM_Enable`
Resetuje kamery dialogowe do ustawień domyślnych.
```dae
func void DiaCAM_Enable()
```
### `TRIA_Wait`
Makes `self` and `other` wait for each other, e.g. for `AI_GotoWP` actions for synchronization. 
```dae
func void TRIA_Wait()
```

### `TRIA_Invite`
Zaprasza NPC do rozmowy. Należy wywołać przed `TRIA_Start`.`TRIA_Start`.
```dae
func void TRIA_Invite(var c_npc slf)
```
**Parametry**

- `#!dae var c_npc slf`  
    Zapraszany NPC

### `TRIA_Start`
Rozpoczyna trialog. Wcześniej wszyscy NPC powinni zostać zaproszeni przez `TRIA_Invite`.
```dae
func void TRIA_Start()
```

### `TRIA_Barrier`
Robi to samo co `TRIA_Wait`, ale dotyczy wszystkich uczestniczących NPC.
```dae
func void TRIA_Barrier()
```

### `TRIA_Next`
Ustawia podanego npc na `self`.
```dae
func void TRIA_Next(var c_npc n0)
```
**Parametry**

- `#!dae var c_npc n0`  
    NPC ustawiany na `self`

### `TRIA_Cam`
Rozpoczyna zdefiniowany wcześniej ruch kamery.
```dae
func void TRIA_Cam(var string evt)
```
**Parametry**

- `#!dae var string evt`  
    Nazwa ruchu kamery w Spacerze. Jeśli `""` zostanie przekazane, ruch kamery zostanie przerwany

### `TRIA_Finish`
Kończy trwający trialog. Musi być zawsze wywoływana na końcu, w przeciwnym razie dalsze trialogi nie będą mogły zostać rozpoczęte.
```dae
func void TRIA_Finish()
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
    In addition, here are still [Dialoggestures](dialoggestures.md) used.

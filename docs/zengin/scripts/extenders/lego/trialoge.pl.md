# Trialog
Ten pakiet pozwala na tworzenie rozmów z dowolną liczbą NPC i sterowanie kamerą podczas dialogu.

## Zależności

- [AI_Function](../lego/ai_function.md)

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_Trialoge`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Trialoge);
```
## Implementacja
[:material-github: Trialoge.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)

## Funkcje

### EquipWeapon
Funkcja Sektenspinnera. (wzięta z forum)
```dae
func void EquipWeapon(var c_npc slf, var int ItemInstance) {};
```

- `slf` - NPC który wyposaża broń
- `ItemInstance` - instancja broni do wyposażenia

### Npc_GetArmor
Zwraca wyposażony NPC pancerz.
```dae
func int Npc_GetArmor(var c_npc slf) {};
```

- `slf` - NPC którego pancerz jest zwracany
- `return` - instanacja pancerza

### Npc_GetMeleeWeapon
Zwraca wyposażoną przez NPC broń ręczną/białą.
```dae
func int Npc_GetMeleeWeapon(var c_npc slf) {};
```

- `slf` - NPC którego broń jest zwracana
- `return` - instanacja broni

### DiaCAM_Update
Funkcja Sektenspinnera. Aktualizuje kamerę dialogową. (Używana wewnętrznie)
```dae
func void DiaCAM_Update() {};
```

### DiaCAM_Disable
Całkowicie wyłącza kamery dialogowe.
```dae
func void DiaCAM_Disable() {};
```

### DiaCAM_Enable
Resetuje kamery dialogowe do ustawień domyślnych.
```dae
func void DiaCAM_Enable() {};
```
### TRIA_Wait
Sprawia, że `self` i `other` czekają na siebie, np. dla synchronizacji po użyciu `AI_GotoWP`.
```dae
func void TRIA_Wait() {};
```

### TRIA_Invite
Zaprasza NPC do rozmowy. Należy wywołać przed `TRIA_Start`.
```dae
func void TRIA_Invite(c_npc slf) {};
```

- `slf` - Zapraszany NPC

### TRIA_Start
Rozpoczyna trialog. Wcześniej wszyscy NPC powinni zostać zaproszeni przez `TRI_Invite`.
```dae
func void TRIA_Start() {};
```

### TRIA_Barrier
Robi to samo co `TRIA_Wait`, ale dotyczy wszystkich uczestniczących NPC.
```dae
func void TRIA_Barrier() {};
```

### TRIA_Next
Ustawia podanego npc na `self`.
```dae
func void TRIA_Next(c_npc n0) {};
```

- `n0` - NPC ustawiany na `self`

### TRIA_Cam
Rozpoczyna zdefiniowany wcześniej ruch kamery.
```dae
func void TRIA_Cam(string evt) {};
```

- `evt` - nazwa ruchu kamery w Spacerze. Jeśli `""` zostanie przekazane, ruch kamery zostanie przerwany

### TRIA_Finish
Kończy trwający trialog. Musi być zawsze wywoływana na końcu, w przeciwnym razie dalsze trialogi nie będą mogły zostać rozpoczęte.
```dae
func void TRIA_Finish() {};
```

## Pryzkłady
### Prosty trialog
Poniższa rozmowa została zrealizowana za pomocą tego pakietu:

1. **Arto:**    Przykro mi, bohaterze, ale nie możesz tędy przejść
2. **Hero:**    Czemu nie?
3. **Horka:**   Miasto zostało zamknięte.
4. **Hero:**    Mam ze sobą trochę złota, możemy się dogadać?
5. **Squelto:** Nie. Nie jesteśmy otwarci na przekupstwo.
6. **Hero:**    Na pewno?
7. **Arto:**    Muszę cię teraz poprosić o odejście.
8. **Hero:**    Dobraa...
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
    var c_npc Arto; Arto       = Hlp_GetNpc(PAL_100_Friend); // Jest właścicielem dialogu
    var c_npc Horka; Horka     = Hlp_GetNpc(PAL_101_Horka);
    var c_npc Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);
   
    TRIA_Invite(Horka);   // Zaprasza Horkę do tego dialogu
    TRIA_Invite(Squelto); // Zaprasza Squelto do tego dialogu
    TRIA_Start();         // Rozpoczyna rozmowe
    // Bohater i Arto(właściciel) nie muszą/nie mogą być zaproszeni.
   
    // Bohater rozmawia teraz z Arto (self = Arto, other = Bohater)
    TRIA_Next(Arto);
   
    DIAG_Reset();
   
    AI_Output (self, other, "TRIA_TEST_00"); //Przykro mi, bohaterze, ale nie możesz tędy przejść
   
    // Bohater rozmawia teraz z Horką (self = Horka, other = Bohater)
    TRIA_Next(Horka);
   
    AI_Output (other, self, "TRIA_TEST_01"); //Czemu nie?
   
    AI_GotoNpc(self, other);
    AI_TurnToNpc(other, self);
   
    AI_Output (self, other, "TRIA_TEST_02"); //Miasto zostało zamknięte.
   
    // Bohater rozgląda się konspiracyjnie podczas następnego zdania
    DIAG("Nervous", 1, 2);
   
    AI_Output (other, self, "TRIA_TEST_03"); //Mam ze sobą trochę złota, możemy się dogadać?
   
    // Bohater powinien poruszać się już normalnie 
    DIAG_Reset();
   
    // Rozpoczyna ruch kamery
    TRIA_Cam("CAMERASTART");
   
    // Bohater rozmawia teraz z Squelto (self = Squelto, other = Bohater)
    TRIA_Next(Squelto);
   
    AI_TurnToNpc(other, self);
   
    DIAG("No", 0, 1);
    AI_Output (self, other, "TRIA_TEST_04"); //Nie. Nie jesteśmy otwarci na przekupstwo.
   
    // Bohater z powrotem rozmawia z Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    // Bohater powinien teraz wypowiadać się pytająco
    DIAG("NotSure", 0, 1);
   
    AI_Output (other, self, "TRIA_TEST_05"); //Na pewno?
   
    AI_TurnToNpc(other, self);
   
    // Koniec ruchu kamery
    TRIA_Cam("");
   
    // Arto powinien agresywnie zareagować
    DIAG("Angry", 0, 4);
   
    AI_Output (self, other, "TRIA_TEST_06"); //Muszę cię teraz poprosić o odejście.
   
    // Bohater powinien znowu poruszać się normalnie 
    DIAG_Reset();
   
    AI_Output (other, self, "TRIA_TEST_07"); //Dobraa...
   
    TRIA_Finish(); // Koniec
};
```
!!! Note
    Dodatkowo w tej rozmowie używane są gesty dialogowe (funkcje `DIAG` i `DIAG_Reset`). Dokumentacja jest w planach.

---
title: Trialoge
description: Pakiet LeGo implementujący trialogi w gothicu
---
# Trialogi

!!! info inline end
    **Zależności:**<br/>
    - [AI_Function](../tools/ai_function.md)<br/>
    **Implementacja:**<br/>
    [:material-github: Trialoge.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Trialoge.d)

Ten pakiet pozwala na tworzenie rozmów z dowolną liczbą NPC i sterowanie kamerą podczas dialogu.

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_Trialoge`.
```dae
LeGo_Init(LeGo_Trialoge);
```
## Funkcje

### `EquipWeapon`
!!! function "`EquipWeapon`"
    Funkcja Sektenspinnera. Sprawia, że NPC wyposaża broń.
    ```dae
    func void EquipWeapon(var C_NPC slf, var int ItemInstance)
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        NPC który wyposaża broń
    - `#!dae var int ItemInstance`  
        Instancja broni do wyposażenia

    **Konfiguracja**

    `#!dae const int EquipWeapon_TogglesEquip = 1`

    Powyższa stała ustala zachowanie funkcji podczas próby założenia już założonej broni:

    - `0` - `EquipWeapon` nic nie zrobi
    - `1` - `EquipWeapon` zdejmie tą broń

### `Npc_GetArmor`
!!! function "`Npc_GetArmor`"
    Pobiera pancerz wyposażony przez NPC.
    ```dae
    func int Npc_GetArmor(var C_NPC slf)
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        NPC którego pancerz jest pobierany

    **Zwracana wartość**

    Funkcja zwraca ID instancji pancerza założonego przez NPC.

### `Npc_GetMeleeWeapon`
!!! function "`Npc_GetMeleeWeapon`"
    Pobiera wyposażoną przez NPC broń białą.
    ```dae
    func int Npc_GetMeleeWeapon(var C_NPC slf)
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        NPC którego broń jest pobierana

    **Zwracana wartość**

    Funkcja zwraca ID instancji broni białej wyposażonej przez NPC.

### `Npc_GetRangedWeapon`
!!! function "`Npc_GetRangedWeapon`"
    Pobiera wyposażoną przez NPC broń dystansową.
    ```dae
    func int Npc_GetRangedWeapon(var C_NPC slf)
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        NPC którego broń jest pobierana

    **Zwracana wartość**

    Funkcja zwraca ID instancji broni dystansowej wyposażonej przez NPC.

### `Npc_TradeItem`
!!! function "`Npc_TradeItem`"
    Podmienia broń założoną przez NPC.
    ```dae
    func void Npc_TradeItem(var c_npc slf, var int itm0, var int itm1) 
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        NPC na którym wykonywana jest operacja
    - `#!dae var int itm0`  
        ID instancji przedmiotu do usunięcia
    - `#!dae var int itm1`  
        ID instancji przedmiotu do stworzenia i założenia

### `DiaCAM_Update`
!!! function "`DiaCAM_Update`"
    Funkcja Sektenspinnera. Aktualizuje kamerę dialogową. (Używana wewnętrznie)
    ```dae
    func void DiaCAM_Update()
    ```

### `DiaCAM_Disable`
!!! function "`DiaCAM_Disable`"
    Całkowicie wyłącza kamery dialogowe.
    ```dae
    func void DiaCAM_Disable()
    ```

### `DiaCAM_Enable`
!!! function "`DiaCAM_Enable`"
    Resetuje kamery dialogowe do ustawień domyślnych.
    ```dae
    func void DiaCAM_Enable()
    ```

### `TRIA_Wait`
!!! function "`TRIA_Wait`"
    Sprawia że `self` i `other` czekają na siebie, np. podczas dla synchronizacji po wywołaniu `AI_GotoWP`. 
    ```dae
    func void TRIA_Wait()
    ```

### `TRIA_Invite`
!!! function "`TRIA_Invite`"
    Zaprasza NPC do rozmowy. Należy wywołać przed `TRIA_Start`.`TRIA_Start`.
    ```dae
    func void TRIA_Invite(var C_NPC slf)
    ```
    **Parametry**

    - `#!dae var C_NPC slf`  
        Zapraszany NPC

### `TRIA_Start`
!!! function "`TRIA_Start`"
    Rozpoczyna trialog. Wcześniej wszyscy NPC powinni zostać zaproszeni przez `TRIA_Invite`.
    ```dae
    func void TRIA_Start()
    ```

### `TRIA_Barrier`
!!! function "`TRIA_Barrier`"
    Robi to samo co `TRIA_Wait`, ale dotyczy wszystkich uczestniczących NPC.
    ```dae
    func void TRIA_Barrier()
    ```

### `TRIA_Next`
!!! function "`TRIA_Next`"
    Ustawia podanego NPC na `self`.
    ```dae
    func void TRIA_Next(var C_NPC n0)
    ```
    **Parametry**

    - `#!dae var C_NPC n0`  
        NPC ustawiany na `self`

### `TRIA_Cam`
!!! function "`TRIA_Cam`"
    Rozpoczyna zdefiniowany wcześniej ruch kamery.
    ```dae
    func void TRIA_Cam(var string evt)
    ```
    **Parametry**

    - `#!dae var string evt`  
        Nazwa ruchu kamery w Spacerze. Jeśli zostanie przekazany pusty ciąg znaków, nastąpi przerwanie ruchu kamery.

### `TRIA_Finish`
!!! function "`TRIA_Finish`"
    Kończy trwający trialog. Musi być zawsze wywoływana na końcu, w przeciwnym razie dalsze trialogi nie będą mogły zostać rozpoczęte.
    ```dae
    func void TRIA_Finish()
    ```

## Przykłady {: id="examples" }

### Prosty Trialog
Poniższa konwersacja zostanie zaimplementowana za pomocą trialogów:

1. **Arto:** Wybacz bohaterze, ale nie możesz tędy przejść.
2. **Bohater:** Dlaczego nie?
3. **Horka:** Miasto zostało zamknięte.
4. **Bohater:** Mam trochę złota przy sobie, możemy pohandlować?
5. **Squelto:** Nie. Nie jesteśmy otwarci na przekupstwo.
6. **Bohater:** Na pewno?
7. **Arto:** Muszę prosić, abyś teraz odszedł.
8. **Bohater:** Niech będzie...
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
    var C_NPC Arto;       Arto = Hlp_GetNpc(PAL_100_Friend); // On jest właścicielem dialogu
    var C_NPC Horka;     Horka = Hlp_GetNpc(PAL_101_Horka);
    var C_NPC Squelto; Squelto = Hlp_GetNpc(PAL_102_Squelto);
   
    TRIA_Invite(Horka);   // Zaproś Horka do dialogu
    TRIA_Invite(Squelto); // Zaproś Squelto do dialogu
    TRIA_Start();         // Rozpocznij rozmowę
    // Bohater i Arto nie muszą być zaproszeni. Domyślnie należą do dialogu.
   
    // Bohater mówi do Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    DIAG_Reset();
   
    AI_Output (self, other, "TRIA_TEST_00"); //Wybacz bohaterze, ale nie możesz tędy przejść.
   
    // Bohater mówi teraz do Horka (self = Horka, other = Hero)
    TRIA_Next(Horka);
   
    AI_Output (other, self, "TRIA_TEST_01"); //Dlaczego nie?
   
    AI_GotoNpc(self, other);
    AI_TurnToNpc(other, self);
   
    AI_Output (self, other, "TRIA_TEST_02"); //Miasto zostało zamknięte.
   
    // Bohater rozgląda się wokoło w trakcie następnej sceny
    DIAG("Nervous", 1, 2);
   
    AI_Output (other, self, "TRIA_TEST_03"); //Mam trochę złota przy sobie, możemy pohandlować?
   
    // Bohater powinien ruszać się teraz znowu normalnie
    DIAG_Reset();
   
    // Rozpocznij ruch kamery
    TRIA_Cam("CAMERASTART");
   
    // Bohater mówi teraz do Squelto (self = Squelto, other = Hero)
    TRIA_Next(Squelto);
   
    AI_TurnToNpc(other, self);
   
    DIAG("No", 0, 1);
    AI_Output (self, other, "TRIA_TEST_04"); //Nie. Nie jesteśmy otwarci na przekupstwo.
   
    // Bohater mówi ponowni do Arto (self = Arto, other = Hero)
    TRIA_Next(Arto);
   
    // Bohater powinien teraz pytająco gestykulować
    DIAG("NotSure", 0, 1);
   
    AI_Output(other, self, "TRIA_TEST_05"); //Na pewno?
   
    AI_TurnToNpc(other, self);
   
    // Zakończ ruch kamery
    TRIA_Cam("");
   
    // Arto powinien zareagować wściekle
    DIAG("Angry", 0, 4);
   
    AI_Output (self, other, "TRIA_TEST_06"); //Muszę prosić, abyś teraz odszedł.
   
    // Bohater powinien ponownie poruszać się normalnie
    DIAG_Reset();
   
    AI_Output (other, self, "TRIA_TEST_07"); //Niech będzie...
   
    TRIA_Finish(); // Koniec
};
```
!!! Note
    Dodatkowo w powyższym przykładzie użyty jest też pakiet [Dialoggestures](dialoggestures.md).

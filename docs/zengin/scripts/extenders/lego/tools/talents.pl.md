---
title: Talenty
---
# Talents - talenty
Ten pakiet robi dwie rzeczy:

1. Zapisuje dowolną liczbę wartości dla określonego NPC (efektywne rozszerzenie tablicy AIVar).
2. Pozwala zidentyfikować NPC za pomocą unikalnego ID.

Pakiet `Talents` używa jednego wolnego AIVara, domyślnie jest to AIVar z numerem 89, który można dostosować w `Userconst.d` [`AIV_TALENT`](../various/userconstants.md#talents).

## Zależności

- [PermMem](permmem.md)

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_PermMem`.
```dae
LeGo_Init(LeGo_PermMem);
```

## Implementacja
[:material-github: Talents.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

## Funkcje

### `NPC_GetID`
Zwraca unikalne ID dla podanego NPC.

```dae
func int NPC_GetID(var C_NPC slf)
```
**Parametry**

- `#!dae var C_NPC slf`  
    NPC

**Zwracana wartość**

Funkcja zwraca unikalne ID dla podanego NPC.

### `NPC_FindByID`
Znajduje wskaźnik NPC o podanym ID.
```dae
func int NPC_FindByID(var int ID)
```
**Parametry**

- `#!dae var int ID`  
    ID postaci

**Zwracana wartość**

Funkcja zwraca wskaźnik podanej postaci (NPC).

### `TAL_CreateTalent`
Tworzy talent, w którym możesz później zapisać wartość dla każdego NPC (tak jak w AIVarze).
```dae
func int TAL_CreateTalent()
```
**Zwracana wartość**

Funkcja zwraca wartość, która jest później wykorzystywana jako ID talentu.

### `TAL_SetValue`
Ustawia nową wartość dla określonego talentu.
```dae
func void TAL_SetValue(var C_NPC npc, var int talent, var int value)
```
**Parametry**

- `#!dae var C_NPC npc`  
    NPC dla którego ustawiana jest wartość
- `#!dae var int talent`  
    ID talentu
- `#!dae var int value`  
    Ustawiana wartość

### TAL_GetValue
Zwraca wartość talentu dla określonego NPC.
```dae
func int TAL_GetValue(var C_NPC npc, var int talent)
```
**Parametry**

- `#!dae var C_NPC npc`  
    NPC, którego wartość talentu jest zwracana
- `#!dae var int talent`  
    ID talentu

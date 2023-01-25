# Talents
Ten pakiet robi dwie rzeczy:

1. zapisuje dowolną liczbę wartości dla określonego NPC (efektywnie rozszerzenie tablicy AIVar).
2. pozwala zidentyfikować NPC za pomocą unikalnego ID.

Pakiet `Talents` używa jednego wolnego AIVara, domyślnie jest to AIVar z mumerem 89, który można dostosować w `Userconst.d` [`AIV_TALENT`](https://github.com/Lehona/LeGo/blob/55ae79a781f79cda649fa42d7f64250befa71212/Userconst.d#L120).

## Zależności

- PermMem

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_PermMem`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_PermMem);
```

## Implementacja
[:material-github: Talents.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

## Funkcje

### NPC_GetID
Zwraca unikalne ID dla podanego NPC.

```dae
func int NPC_GetID(var c_npc slf) {};
```

- `slf` - NPC
- `return` - ID 

### NPC_FindByID
Znajduje pointer NPC o podanym ID.
```dae
func int NPC_FindByID(var int ID) {};
```

- `ID` - ID zwrócone przez `NPC_GetID`
- `return` - pointer NPC

### TAL_CreateTalent
Tworzy talent, w którym możesz później zapisać wartość dla każdego NPC (tak jak w AIVarze).
```dae
func int TAL_CreateTalent() {};
```

- `return` - wartość, która jest później wykorzystywana jako Id talentu

### TAL_SetValue
Ustawia nową wartość dla określonego talentu.
```dae
func void TAL_SetValue(var c_npc npc, var int talent, var int value) {};
```

- `npc` - NPC dla którego ustawiana jest wartość
- `talent` - ID talentu
- `value` - ustawiana wartość

### TAL_GetValue
Zwraca wartość talentu dla określonego NPC.
```dae
func int TAL_GetValue(var c_npc npc, var int talent) {};
```

- `npc` - NPC, którego wartość talentu jest zwracana
- `talent` - ID talentu

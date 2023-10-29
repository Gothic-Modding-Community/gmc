---
title: ItemHelper
---
# ItemHelper - pomocnik do przedmiotów
Ten pakiet jest bardzo prosty - pobiera wskaźnik `oCItem` z instancji `C_ITEM` ważnej dla bieżącego świata i sesji.

!!! Warning
    Upewnij się, że każdy świat ma waypoint o nazwie `TOT` (po niemiecku "martwy"). Ikarus i LeGo potrzebują tego punktu nawigacyjnego, aby odradzać pomocniczych NPC.
    Jest to szczególnie ważne w Gothicu 1, ponieważ jego światy nie mają waypointu `TOT`.

## Zależności
Nie dotyczy.

## Inicjalizacja
Nie dotyczy.

## Implementacja
[:material-github: ItemHelper.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/ItemHelper.d)

## Funkcje

### `Itm_GetPtr`
```dae
func int Itm_GetPtr(var int instance)
```
**Parametry**

- `#!dae var int instance`  
    Instancja `C_ITEM`, z której ma zostać pobrany wskaźnik

**Zwracana wartość**

Funkcja zwraca wskaźnik `oCItem` instancji `C_ITEM`.

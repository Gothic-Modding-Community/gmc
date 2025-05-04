---
title: ItemHelper
description: Pakiet LeGo umożliwiający zmianę instancji `C_ITEM` na pointer `oCItem`
---
# ItemHelper - pomocnik do przedmiotów

!!! info inline end
    **Zależności:**<br/>
    - Brak
    **Implementacja:**<br/>
    [:material-github: ItemHelper.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/ItemHelper.d)

Ten pakiet jest bardzo prosty - pobiera wskaźnik `oCItem` z instancji `C_ITEM` ważnej dla bieżącego świata i sesji.

!!! Warning
    Upewnij się, że każdy świat ma waypoint o nazwie `TOT` (po niemiecku "martwy"). Ikarus i LeGo potrzebują tego punktu nawigacyjnego, aby odradzać pomocniczych NPC.
    Jest to szczególnie ważne w Gothicu 1, ponieważ jego światy nie mają waypointu `TOT`.

## Inicjalizacja
Nie dotyczy.

## Funkcje

### `Itm_GetPtr`
!!! function "`Itm_GetPtr`"
    ```dae
    func int Itm_GetPtr(var int instance)
    ```
    **Parametry**

    - `#!dae var int instance`  
        Instancja `C_ITEM`, z której ma zostać pobrany wskaźnik

    **Zwracana wartość**

    Funkcja zwraca wskaźnik `oCItem` instancji `C_ITEM`.

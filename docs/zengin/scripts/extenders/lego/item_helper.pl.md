# ItemHelper 
Ten pakiet jest bardzo prosty - pobiera wskaźnik `oCItem` z instancji `C_Item` ważnej dla bieżącego świata i sesji.

!!! Warning
    Upewnij się, że każdy świat ma waypoint o nazwie `TOT` (po niemiecku „martwy”). Ikarus i LeGo potrzebują tego punktu nawigacyjnego, aby odradzać pomocniczych NPC.
    Jest to szczególnie ważne w Gothicu 1, ponieważ jego światy nie mają waypointu `TOT`.

## Zależności
Brak

## Inicjalizacja
Brak

## Implementacja
[:material-github: ItemHelper.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/ItemHelper.d)

## Funkcje

### ITM_GetPtr
```dae
func int ITM_GetPtr(var int instance) {};
```

- `instance` - instancja `C_Item`, z której ma zostać pobrany wskaźnik
- `return `- wskaźnik `oCItem` instancji `C_Item`

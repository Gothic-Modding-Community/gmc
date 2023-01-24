# ItemHelper
Ten pakiet jest bardzo prosty - pobiera wska�nik `oCItem` z instancji `C_Item` wa�nej dla bie��cego �wiata i sesji.

!!! Warning
    Upewnij si�, �e ka�dy �wiat ma waypoint o nazwie `TOT` (po niemiecku �martwy�). Ikarus i LeGo potrzebuj� tego punktu nawigacyjnego, aby odradza� pomocniczych NPC.
    Jest to szczeg�lnie wa�ne w Gothicu 1, poniewa� jego �wiaty nie maj� waypointu `TOT`.

## Zale�no�ci
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

- `instance` - instancja `C_Item`, z kt�rej ma zosta� pobrany wska�nik
- `return `- wska�nik `oCItem` instancji `C_Item`

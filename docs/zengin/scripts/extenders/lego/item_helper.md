# ItemHelper
Ten pakiet jest bardzo prosty - pobiera wskaŸnik `oCItem` z instancji `C_Item` wa¿nej dla bie¿¹cego œwiata i sesji.

!!! Warning
    Upewnij siê, ¿e ka¿dy œwiat ma waypoint o nazwie `TOT` (po niemiecku „martwy”). Ikarus i LeGo potrzebuj¹ tego punktu nawigacyjnego, aby odradzaæ pomocniczych NPC.
    Jest to szczególnie wa¿ne w Gothicu 1, poniewa¿ jego œwiaty nie maj¹ waypointu `TOT`.

## Zale¿noœci
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

- `instance` - instancja `C_Item`, z której ma zostaæ pobrany wskaŸnik
- `return `- wskaŸnik `oCItem` instancji `C_Item`

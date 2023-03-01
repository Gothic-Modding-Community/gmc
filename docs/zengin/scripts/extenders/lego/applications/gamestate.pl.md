# Gamestate - stan gry
Pakiet Gamestate pozwala sprawdzić stan gry (rozpoczęcie gry, ładowanie gry lub zmiana poziomu).

## Zależności  
- [EventHandler](../tools/event_handler.md)
- [Saves](../applications/saves.md)

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_Gamestate`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Gamestate);
```
## Implementacja
[:material-github: Gamestate.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Gamestate.d)

## Funkcje

### Gamestate_AddListener
Dodaje listener/handler zmiany stanu gry.
```dae
func void Gamestate_AddListener(var func listener) {};
```

- `listener` - Ta funkcja zostanie wywołana przy zmianie stanu gry. Bieżący stan gry jest przekazywany jako parametr.


### Gamestate_RemoveListener
Usuwa listener zmiany stanu gry.
```dae
func void Gamestate_RemoveListener(var func listener) {};
```

- `listener` - listener do usunięcia.

## Przykłady
Istnieją teraz dwie możliwości: albo zrobisz wszystko bezpośrednio w Init-Global, albo użyjesz EventHandlera.
### Init_Global
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame) 
    {
        MEM_Info("Nowa gra rozpoczęta.");
    }
    else if(Gamestate == Gamestate_Loaded)
    {
        MEM_Info("Ładowanie gry.");
    }
    else if(Gamestate == Gamestate_WorldChange)
    {
        MEM_Info("Zmiana świata.");
    }
    else
    {
        MEM_Info("Brak zmiany stanu gry");
    };
};
```

Może to być przydatne podczas pracy z PermMem, gdzie obiekty PermMem nie muszą być odtwarzane po załadowaniu gry.

Możesz też wymyślić coś takiego:
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame)
    {
        FF_Apply(MyLoop);
        FF_Apply(My2ndLoop);
    };
};
```
Dałoby to taki sam efekt jak:
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    FF_ApplyOnce(MyLoop);
    FF_ApplyOnce(My2ndLoop);
};
```

### Event Handler
Ten przykład nie wymaga większych wyjaśnień.
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    Gamestate_AddListener(MyGamestateListener);
};

func void MyGamestateListener(var int state)
{
    if(state == Gamestate_NewGame)
    {
        MEM_Info("Nowa gra rozpoczęta.");
    }
    else if(state == Gamestate_Loaded)
    {
        MEM_Info("Ładowanie gry.");
    }
    else if(state == Gamestate_WorldChange)
    {
        MEM_Info("Zmiana świata.");
    }
    else
    {
        MEM_Info("Brak zmiany stanu gry.");
    };
};
```
Daje taki sam efekt jak przykład z [`Init_Global`](#init_global) ale dla niektórych może lepiej wyglądać.

!!! Note
    Jest to tłumaczenie artykułu napisanego oryginalnie przez Gottfrieda i Lehone i umieszczonego w oficjalnej [dokumentacji](https://lego.worldofplayers.de/?Beispiele_Gamestate) pakietu LeGo.

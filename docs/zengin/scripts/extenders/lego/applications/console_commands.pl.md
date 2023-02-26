# Console Commands - polecenia konsoli
Ten Pakiet pozwala na tworzenie nowych poleceń konsloli dostępnej po naciśnięciu klawisza F2 w trybie marvin.

## Zależności

- PermMem
- HookEngine

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_ConsoleCommands`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_ConsoleCommands);
```

## Implementacja
[:material-github: ConsoleCommands.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/ConsoleCommands.d)

## Funkcje

### CC_Register
Rejestruje nowe polecenie konsoli.
```dae
func void CC_Register(var func f, var string cmdPrefix, var string description) {};
```

- `f` - Ta funkcja jest wykonywana po wprowadzeniu polecenia `cmdPrefix` w konsoli. Sygnatura funkcji to `func string f(var string p0)`. Przekazany string to wszystko, co zostało określone w konsoli po faktycznym poleceniu. Zwracana wartość jest następnie wyświetlana w konsoli.
- `cmdPrefix` - Jest to polecenie, które można wprowadzić w konsoli.
- `description` - Ten tekst pojawia się obok polecenia (w zSpy), gdy używasz polecenia `help` w konsoli.

### CC_Remove
Usuwa funkcje z konsoli komend.
```dae
func void CC_Remove(var func f) {};
```

- `f`- Ta funkcja zostanie usunięta, a powiązane z nią polecenie przestanie działać.

### CC_Active
Sprawdza dana funkcja jest już częścią polecenia konsoli.
```dae
func int CC_Active(var func f) {};
```

- `f` - sprawdzana funkcja
- `return` - `TRUE` jeśli istnieje odpowiednia funkcja, `FALSE` w każdym innym przypadku.

## Przykłady

### Proste polecenie konsoli
Jako prosty przykład stwórzmy polecenie version, które wyświetli nam wersję modyfikacji. 
Po pierwsze, deklarujemy stałą zmienną `string` do przechowywania informacji o wersji.
```dae
const string Mod_Version = "Wersja modyfikacji - 0.1alpha";
```
Następnie tworzymy nową funkcje.

!!! Note
    Zwróć uwagę na poprawną sygnaturę funkcji. Jeśli nie będzie błędna, polecenie spowoduje awarię gry.

```dae
// Ta funkcja jest wywoływana przez nasze nowe polecenie
func string CC_ModVersion (var string param)
{
    return Mod_Version;
};
```
Następnie musimy zarejestrować polecenie. Dla wygody stworzyłem nową funkcję `RegisterConsoleFunctions`, która inicjuje wszystkie polecenia konsoli. Funkcja jest naprawdę prosta.
```dae
func void RegisterConsoleFunctions()
{
    CC_Register (CC_ModVersion, "wersja_moda", "Wersja mojej modyfikacji.");
};
```
Na koniec musimy wywołać tą funkcje w `INIT_GLOBAL`.
```dae
func void INIT_GLOBAL()
{
    Game_InitGerman(); //tylko w G2

    // Inicjalizacja Ikarusa
    MEM_InitAll();

    // Inicjalizacja LeGo
    LeGo_Init(LeGo_ConsoleCommands);

    // Tutaj rejstrujemy nasze polecenia
    RegisterConsoleFunctions();
    
    
    // Reszta kodu
};
```

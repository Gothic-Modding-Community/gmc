# Bars - paski
Ten pakiet bardzo ułatwia dodawanie nowych pasków, dla wyświetlania np. wytrzymałości.

## Zależności

- PermMem
- View

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_Bars`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Bars);
```
## Implementacja
[:material-github: Bars.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Bars.d)

## Funkcje

!!! Note
    Jeśli prototyp `GothicBar` jest wybrany jako typ początkowy (`GothicBar@` jako konstruktor), paski użytkownika są wizualnie nie do odróżnienia od tych używanych w Gothicu.

### Bar_Create
Tworzy nowy pasek z instancji konstruktora.
```dae
func int Bar_Create(var int inst) {};
```

- `inst` - instancja konstruktora klasy `Bar`
- `return` - handler do nowego paska 

### Bar_Delete
Usuwa pasek z ekranu i pamięci. 
```dae
func void Bar_Delete(var int bar) {};
```

- `bar` - handler zwrócony przez `Bar_Create`

### Bar_SetMax
Zmienia maksymalna wartość paska, ale nie aktualizuje jego długości (tylko `Bar_SetPercent`, `Bar_SetPromille` i `Bar_SetValue` to robią)
```dae
func void Bar_SetMax(var int bar, var int max) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `max` - nowa maksymalna wartość

### Bar_SetValue
Ustawia wartość paska.
```dae
func void Bar_SetValue(var int bar, var int val) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `val` - nowa wartość paska

### Bar_SetPercent
Ustawia wartość paska, ale w procentach (0..100).
```dae
func void Bar_SetPercent(var int bar, var int perc) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `perc` - nowa wartość paska w procentach

### Bar_SetPromille
Ustawia wartość paska, ale w promilach (0..1000).
```dae
func void Bar_SetPromille(var int bar, var int pro) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `pro` - nowa wartość paska w promilach

### Bar_Hide
Ukrywa pasek, ale go nie usuwa.
```dae
func void Bar_Hide(var int bar) {};
```

- `bar` - handler zwrócony przez `Bar_Create`

### Bar_Show
Wyświetla pasek ponownie po użyciu `Bar_Hide`. 
```dae
func void Bar_Show(var int bar) {};
```

- `bar` - handler zwrócony przez `Bar_Create`

### Bar_MoveTo
Przenosi pasek do danej pozycji wirtualnej. 
```dae
func void Bar_MoveTo(var int bar, var int x, var int y) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `x` - nowa pozycja w osi x
- `y` - nowa pozycja w osi y

### Bar_MoveToPxl
Przenosi pasek do danej pozycji wyrażonej w pikselach.
```dae
func void Bar_MoveToPxl(var int bar, var int x, var int y) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `x` - nowa pozycja w osi x
- `y` - nowa pozycja w osi y

### Bar_SetAlpha
Ustawia przezroczystość paska.
```dae
func void Bar_SetAlpha(var int bar, var int alpha) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `alpha` - wartość przezroczystości (0..255) 

### Bar_SetBarTexture
Ustawia teksturę wartości paska.
```dae
func void Bar_SetBarTexture(var int bar, var string barTex) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `barTex` - nowa tekstura

### Bar_SetBackTexture
Ustawia teksturę tła paska.
```dae
func void Bar_SetBackTexture(var int bar, var string backTex) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `backTex` - nowa tekstura

### Bar_Resize
Zmień rozmiar istniejącego paska.
```dae
func void Bar_Resize(var int bar, var int width, var int height) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `width` - nowa szerokość
- `height` - nowa wysokość

### Bar_ResizePxl
Zmień rozmiar istniejącego paska (w pikselach).
```dae
func void Bar_ResizePxl(var int bar, var int x, var int y) {};
```

- `bar` - handler zwrócony przez `Bar_Create`
- `x` - nowa szerokość
- `y` - nowa wysokość

## Przykłady
!!! Note
    Ten pakiet zakłada podstawowe zrozumienie modułu PermMem. 

### Wyświetlenie prostego paska
Na początku tworzymy pasek, który nie robi absolutnie nic.
Powinien wyświetlać się na dole ekranu jako zapełniony w połowie.
```dae
func void Example_1()
{
    var int bar; bar = Bar_Create(GothicBar@); // Tworzy nowy pasek
    Bar_SetPercent(bar, 50);                   // Ustawia jego wartość na 50%
};
```
To tyle. Bez żadnych ustawień? I czym jest ten `GothicBar@`? Spójrzmy na bardziej rozbudowany przykład.

### Dedykowany pasek doświadczenia
Pakiet Bars implementuje klasę `Bar`. Która wygląda tak:
```dae
class Bar
{
    var int x;          // Pozycja na ekranie w osi X (środka paska)
    var int y;          // Pozycja na ekranie w osi Y (środka paska)
    var int barTop;     // Pasek odstępu tła - góra/dół
    var int barLeft;    // Pasek odstępu tła - lewo/prawo
    var int width;      // Szerokość
    var int height;     // Wysokość
    var string backTex; // Tekstura tła
    var string barTex;  // Tekstura wartości paska
    var int value;      // Początkowa wartość
    var int valueMax;   // Maksymalna wartość
};
```
Prototyp `GothicBar` jest paskiem, który naśladuje standardowy pasek używany w grze.
```dae
prototype GothicBar(Bar)
{
    x = Print_Screen[PS_X] / 2;
    y = Print_Screen[PS_Y] - 20;
    barTop = 3;
    barLeft = 7;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga";
    barTex = "Bar_Misc.tga";
    value = 100;
    valueMax = 100;
};
```
O wiele łatwiej jest skonfigurować nową instancję przy użyciu tego prototypu. `GothicBar` bez zmian można znaleźć jako instancję `GothicBar@`, którą użyliśmy do stworzenia paska w powyższym przykładzie.
GothicBar znajduje się na środku ekranu i wygląda tak samo, jak pasek wyświetlany podczas nurkowania, 
ale zróbmy pasek, który znajduje się w lewym górnym rogu obrazu i wyświetla punkty doświadczenia.
Stwórz nową instancję z pomocą `GothicBar` i zmień tylko pozycję. Oczywiście dodaj też pętlę za pomocą pakietu [FrameFunctions](frame_functions.md).
```dae
// Instancja stworzona z pomocą prototypu GothicBar 
instance Bar_1(GothicBar)
{
    x = 100;
    y = 20;
};

func void Example_1()
{
    // Example_1 może być wywołany np. w Init_Global
    FF_ApplyOnce(Loop_1);
};

func void Loop_1()
{
    // Example_1 uruchamia tę pętlę.
    // Tutaj pasek powinien być stworzony raz
    // a potem sparowany z punktami doświadczenia:
    var int MyBar;
    if(!Hlp_IsValidHandle(MyBar))
    {
        MyBar = Bar_Create(Bar_1); // Our Bar_1
    };
    // Reszta jest chyba oczywista:
    Bar_SetMax(MyBar, hero.exp_next);
    Bar_SetValue(MyBar, hero.exp);
};
```
!!! Note
    Jest to tłumaczenie artykułu napisanego oryginalnie przez Gottfrieda i Lehone i umieszczonego w oficjalnej [dokumentacji](https://lego.worldofplayers.de/?Beispiele_Bars) pakietu LeGo.

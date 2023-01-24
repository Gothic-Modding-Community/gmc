# Paski
Ten pakiet bardzo u³atwia dodawanie nowych pasków, dla wyœwietlania np. wytrzyma³oœci/satminy.

## Zale¿noœci

- PermMem
- View

## inicjalizacja
Zainicjuj za pomoc¹ flagi `LeGo_Bars`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Bars);
```
## Implementacja
[:material-github: Bars.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Bars.d)

## Funkcje

!!! Note
    Jeœli prototyp `GothicBar@` jest wybrany jako typ pocz¹tkowy, paski u¿ytkownika s¹ wizualnie nie do odró¿nienia od tych u¿ywanych w Gothicu.

### Bar_Create
Tworzy nowy pasek z instancji konstruktora.
```dae
func int Bar_Create(var int bar) {};
```

- `bar` - instancja konstruktora klasy `Bar`
- `return` - handler do nowego paska 

### Bar_Delete
Usuwa pasek z ekranu i pamiêci. 
```dae
func void Bar_Delete(var int handle) {};
```

- `handle` - handler zwrócony przez `Bar_Create`

### Bar_SetMax
Zmienia maksymalna wartoœæ paksa, ale nie aktualizuje jego d³ugoœci (tylko `Bar_SetPercent`, `Bar_SetPromille` i `Bar_SetValue` to robi¹)
```dae
func void Bar_SetMax(var int handle, var int max) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `max` - nowa maksymalna wartoœæ

### Bar_SetValue
Ustawia wartoœæ paska.
```dae
func void Bar_SetValue(var int handle, var int value) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `value` - nowa wartoœæ paska

### Bar_SetPercent
Ustawia wartoœæ paska, ale w procentach (0..100).
```dae
func void Bar_SetPercent(var int handle, var int percent) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `percent` - nowa wartoœæ paska w procenatch

### Bar_SetPromille
Ustawia wartoœæ paska, ale w promilach (0..1000).
```dae
func void Bar_SetPromille(var int handle, var int promille) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `promille` - nowa wartoœæ paska w promilach

### Bar_Hide
Ukrywa pasek, ale go nie usuwa.
```dae
func void Bar_Hide(var int handle) {};
```

- `handle` - handler zwrócony przez `Bar_Create`

### Bar_Show
Wyœwietla pasek ponownie po u¿yciu `Bar_Hide`. 
```dae
func void Bar_Show(var int handle) {};
```

- `handle` - handler zwrócony przez `Bar_Create`

### Bar_MoveTo
Przenosi pasek do danej pozycji wirtualnej. 
```dae
func void Bar_MoveTo(var int handle, var int x, var int y) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `x` - nowa pozycja w osi x
- `y` - nowa pozycja w osi y

### Bar_SetAlpha
Ustawia przezroczystoœæ paska.
```dae
func void Bar_SetAlpha(var int handle, var int alpha) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `alpha` - wartoœæ przezroczystoœci (0..255) 

### Bar_SetBarTexture
Ustawia texture wartoœci paska.
```dae
func void Bar_SetBarTexture(var int handle, var string texture) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `texture` - nowa textura

### Bar_SetBackTexture
Ustawia texture t³a paska.
```dae
func void Bar_SetBackTexture(var int handle, var string texture) {};
```

- `handle` - handler zwrócony przez `Bar_Create`
- `texture` - nowa textura

## Przyk³ady
!!! Note
    Ten pakiet zak³adada podstawowe zrozumienie modu³u PermMem. 

### Wyœwietlenie prostego paska
Na pocz¹tku tworzymy pasek który nie robi absolutnie nic.
Powinien wyœwietalæ siê na dole ekranu jako zape³niony w po³owie.
```dae
func void Example_1()
{
    var int bar; bar = Bar_Create(GothicBar@); // Tworzy nowy pasek
    Bar_SetPercent(bar, 50);                   //Ustawia jego wartoœæ na 50%
};
```
To tyle. Bez ¿adnych ustawieñ? I czym jest ten `GothicBar`? Spójrzmy na bardziej rozbudowany przyk³ad.

### A dedicated experience bar
Pakiet Bars implementuje klasê `Bar`. Która wygl¹da tak:
```dae
class Bar
{
    var int x;          // Pozycja na ekranie w osi X (œrodka paska)
    var int y;          // Pozycja na ekranie w osi Y (œrodka paska)
    var int barTop;     // Spacing bar - background top/bottom
    var int barLeft;    // Spacing bar - background left/right
    var int width;      // Szerokoœæ
    var int height;     // Wysokoœæ
    var string backTex; // Textura t³a
    var string barTex;  // Textura wartoœci paska
    var int value;      // Pocz¹tkowa wartoœæ
    var int valueMax;   // Maksymalna wartoœæ
};
```
Prototyp`GothicBar` jest paskiem który naœladuje standardowy pasek u¿ywany w grze.
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
O wiele ³atwiej jest skonfigurowaæ now¹ instancjê przy u¿yciu tego prototypu. Standardowy pasek mo¿na ³atwo utworzyæ za pomoc¹ `GothicBar`, jak pokazano w poni¿szym przyk³adzie.
GothicBar znajduje siê na œrodku ekranu i wygl¹da tak samo jak pasek wyœwietlany podczas nurkowania.
Ale zróbmy pasek, który znajduje siê w lewym górnym rogu obrazu i wyœwietla punkty doœwiadczenia.
Stwórz now¹ instancje z pomoc¹ GothicBar i zmieñ tylko pozycjê. Oczywiœcie dodaj te¿ pêtlê za pomoc¹ pakietu FrameFunctions.
```dae
// Instancja stowrzona z pomoc¹ prototypu GothicBar 
instance Bar_1(GothicBar)
{
    x = 100;
    y = 20;
};

func void Przyklad_1()
{
    // Przyklad_1 mo¿e byæ wywo³any np. w Init_Global
    FF_ApplyOnce(Loop_1);
};

func void Loop_1()
{
    // Przyklad_1 uruchamia tê pêtlê.
    // Tutaj pasek powinien byæ stowrzony raz
    // a potem sparowany z punktami doœwiadczenia:
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
    Jest to t³umaczenie artyku³u napisanego oryginalnie przez Gottfrieda i Lehone i umieszczonego w oficjalnej [dokumentacji](https://lego.worldofplayers.de/?Beispiele_Bars) pakietu LeGo

# Paski
Ten pakiet bardzo u�atwia dodawanie nowych pask�w, dla wy�wietlania np. wytrzyma�o�ci/satminy.

## Zale�no�ci

- PermMem
- View

## inicjalizacja
Zainicjuj za pomoc� flagi `LeGo_Bars`.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Bars);
```
## Implementacja
[:material-github: Bars.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Bars.d)

## Funkcje

!!! Note
    Je�li prototyp `GothicBar@` jest wybrany jako typ pocz�tkowy, paski u�ytkownika s� wizualnie nie do odr�nienia od tych u�ywanych w Gothicu.

### Bar_Create
Tworzy nowy pasek z instancji konstruktora.
```dae
func int Bar_Create(var int bar) {};
```

- `bar` - instancja konstruktora klasy `Bar`
- `return` - handler do nowego paska 

### Bar_Delete
Usuwa pasek z ekranu i pami�ci. 
```dae
func void Bar_Delete(var int handle) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`

### Bar_SetMax
Zmienia maksymalna warto�� paksa, ale nie aktualizuje jego d�ugo�ci (tylko `Bar_SetPercent`, `Bar_SetPromille` i `Bar_SetValue` to robi�)
```dae
func void Bar_SetMax(var int handle, var int max) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `max` - nowa maksymalna warto��

### Bar_SetValue
Ustawia warto�� paska.
```dae
func void Bar_SetValue(var int handle, var int value) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `value` - nowa warto�� paska

### Bar_SetPercent
Ustawia warto�� paska, ale w procentach (0..100).
```dae
func void Bar_SetPercent(var int handle, var int percent) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `percent` - nowa warto�� paska w procenatch

### Bar_SetPromille
Ustawia warto�� paska, ale w promilach (0..1000).
```dae
func void Bar_SetPromille(var int handle, var int promille) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `promille` - nowa warto�� paska w promilach

### Bar_Hide
Ukrywa pasek, ale go nie usuwa.
```dae
func void Bar_Hide(var int handle) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`

### Bar_Show
Wy�wietla pasek ponownie po u�yciu `Bar_Hide`. 
```dae
func void Bar_Show(var int handle) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`

### Bar_MoveTo
Przenosi pasek do danej pozycji wirtualnej. 
```dae
func void Bar_MoveTo(var int handle, var int x, var int y) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `x` - nowa pozycja w osi x
- `y` - nowa pozycja w osi y

### Bar_SetAlpha
Ustawia przezroczysto�� paska.
```dae
func void Bar_SetAlpha(var int handle, var int alpha) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `alpha` - warto�� przezroczysto�ci (0..255) 

### Bar_SetBarTexture
Ustawia texture warto�ci paska.
```dae
func void Bar_SetBarTexture(var int handle, var string texture) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `texture` - nowa textura

### Bar_SetBackTexture
Ustawia texture t�a paska.
```dae
func void Bar_SetBackTexture(var int handle, var string texture) {};
```

- `handle` - handler zwr�cony przez `Bar_Create`
- `texture` - nowa textura

## Przyk�ady
!!! Note
    Ten pakiet zak�adada podstawowe zrozumienie modu�u PermMem. 

### Wy�wietlenie prostego paska
Na pocz�tku tworzymy pasek kt�ry nie robi absolutnie nic.
Powinien wy�wietal� si� na dole ekranu jako zape�niony w po�owie.
```dae
func void Example_1()
{
    var int bar; bar = Bar_Create(GothicBar@); // Tworzy nowy pasek
    Bar_SetPercent(bar, 50);                   //Ustawia jego warto�� na 50%
};
```
To tyle. Bez �adnych ustawie�? I czym jest ten `GothicBar`? Sp�jrzmy na bardziej rozbudowany przyk�ad.

### A dedicated experience bar
Pakiet Bars implementuje klas� `Bar`. Kt�ra wygl�da tak:
```dae
class Bar
{
    var int x;          // Pozycja na ekranie w osi X (�rodka paska)
    var int y;          // Pozycja na ekranie w osi Y (�rodka paska)
    var int barTop;     // Spacing bar - background top/bottom
    var int barLeft;    // Spacing bar - background left/right
    var int width;      // Szeroko��
    var int height;     // Wysoko��
    var string backTex; // Textura t�a
    var string barTex;  // Textura warto�ci paska
    var int value;      // Pocz�tkowa warto��
    var int valueMax;   // Maksymalna warto��
};
```
Prototyp`GothicBar` jest paskiem kt�ry na�laduje standardowy pasek u�ywany w grze.
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
O wiele �atwiej jest skonfigurowa� now� instancj� przy u�yciu tego prototypu. Standardowy pasek mo�na �atwo utworzy� za pomoc� `GothicBar`, jak pokazano w poni�szym przyk�adzie.
GothicBar znajduje si� na �rodku ekranu i wygl�da tak samo jak pasek wy�wietlany podczas nurkowania.
Ale zr�bmy pasek, kt�ry znajduje si� w lewym g�rnym rogu obrazu i wy�wietla punkty do�wiadczenia.
Stw�rz now� instancje z pomoc� GothicBar i zmie� tylko pozycj�. Oczywi�cie dodaj te� p�tl� za pomoc� pakietu FrameFunctions.
```dae
// Instancja stowrzona z pomoc� prototypu GothicBar 
instance Bar_1(GothicBar)
{
    x = 100;
    y = 20;
};

func void Przyklad_1()
{
    // Przyklad_1 mo�e by� wywo�any np. w Init_Global
    FF_ApplyOnce(Loop_1);
};

func void Loop_1()
{
    // Przyklad_1 uruchamia t� p�tl�.
    // Tutaj pasek powinien by� stowrzony raz
    // a potem sparowany z punktami do�wiadczenia:
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
    Jest to t�umaczenie artyku�u napisanego oryginalnie przez Gottfrieda i Lehone i umieszczonego w oficjalnej [dokumentacji](https://lego.worldofplayers.de/?Beispiele_Bars) pakietu LeGo

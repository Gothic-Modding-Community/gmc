# BinaryMachines
Ten pakiet pozwala tworzyć i zapisywać własne pliki w dowolnym miejscu w systemie plików.

## Zależności
Brak

## Inicjalizacja
Brak

## Implementacja
[:material-github: BinaryMachines.d na GitHub](https://github.com/Lehona/LeGo/blob/dev/BinaryMachines.d)

## BinaryWriter

### `BW_NewFile`
Tworzy plik o nazwie `file` i otwiera strumień. Nie działa, jeśli strumień jest już otwarty.
```dae
func int BW_NewFile(var string file)
```
**Parametry**

- `#!dae var string file`  
    Nazwa tworzonego pliku

### `BW_Close`
Zamyka aktualny strumień zapisu.
```dae
func void BW_Close()
```

### `BW`
Zapisuje `length` bajtów z `data` do strumienia, maksymalnie 4 bajty.
```dae
func void BW(var int data, var int length)
```
**Parametry**

- `#!dae var int data`  
    Wartość bajtów
- `#!dae var int length`  
    Liczba bajtów

### `BW_Int`
Zapisuje 4 bajty z `data` do strumienia. To samo co `BW(data, 4)`.
```dae
func void BW_Int(var int data)
```
**Parametry**

- `#!dae var int data`  
    Wartość całkowita do zapisania

### `BW_Char`
Zapisuje pierwszy znak z `data` do strumienia. To samo co `BW(Str_GetCharAt(data, 0), 1)`.
```dae
func void BW_Char(var string data)
```
**Parametry**

- `#!dae var string data`  
    Znak do zapisania

### `BW_String`
Zapisuje `data` zakończone znakiem `\0` do strumienia.
```dae
func void BW_String(var string data)
```
**Parametry**

- `#!dae var string data`  
    Ciąg znaków do zapisania

### `BW_Byte`
Zapisuje bajt z `data` do strumienia. To samo co `BW(data, 1)`.
```dae
func void BW_Byte(var int data)
```
**Parametry**

- `#!dae var int data`  
    Wartość bajtowa do zapisania

### `BW_Bytes`
Zapisuje `length` bajtów ze wskaźnika `dataPtr` do strumienia.
```dae
func void BW_Bytes(var int dataPtr, var int length)
```
**Parametry**

- `#!dae var int dataPtr`  
    Wskaźnik danych do zapisania
- `#!dae var int length`  
    Liczba bajtów

### `BW_Text`
Zapisuje ciąg znaków do strumienia bez jego zakończenia. Nie można go już odczytać.
```dae
func void BW_Text(var string data)
```
**Parametry**

- `#!dae var string data`  
    Tekst do zapisania

### `BW_NextLine`
Zapisuje akapit do strumienia.
```dae
func void BW_NextLine()
```

## BinaryReader

### `BR_OpenFile

`
Otwiera plik o nazwie `file` i otwiera strumień. Nie działa, jeśli strumień jest już otwarty.
```dae
func int BR_OpenFile(var string file)
```
**Parametry**

- `#!dae var string file`  
    Plik, który ma być otwarty

### `BR_Close`
Zamyka aktualny strumień odczytu.
```dae
func void BR_Close()
```

### `BR`
Odczytuje bajty ze strumienia.
```dae
func int BR(var int length)
```
**Parametry**

- `#!dae var int length`  
    Liczba bajtów do odczytania (maksymalnie 4)

**Zwracana wartość**

Funkcja zwraca odczytaną wartość bajtów.

### `BR_Int`
Odczytuje 4 bajty ze strumienia. To samo co `BR(4)`.
```dae
func int BR_Int()
```
**Zwracana wartość**

Funkcja zwraca odczytaną liczbę całkowitą.

### `BR_Char`
Odczytuje znak ze strumienia. To samo co `BR(1)`.
```dae
func string BR_Char()
```
**Zwracana wartość**

Funkcja zwraca odczytany znak.

### `BR_String`
Odczytuje ciąg znaków zakończony znakiem `\0` ze strumienia.
```dae
func string BR_String()
```
**Zwracana wartość**

Funkcja zwraca odczytany ciąg znaków.

### `BR_Byte`
Odczytuje bajt ze strumienia.
```dae
func int BR_Byte()
```
**Zwracana wartość**

Funkcja zwraca odczytany bajt.

### `BR_Bytes`
Odczytuje bajty ze strumienia.
```dae
func int BR_Bytes(var int length)
```
**Parametry**

- `#!dae var int length`  
    Liczba bajtów do odczytania

**Zwracana wartość**

Funkcja zwraca wskaźnik do odczytanych bajtów.

### `BR_TextLine`
Odczytuje linię ze strumienia.
```dae
func string BR_TextLine()
```
**Zwracana wartość**

Funkcja zwraca odczytaną linię.

### `BR_Text`
Odczytuje ciąg znaków o podanej długości ze strumienia.
```dae
func string BR_Text(var int length)
```
**Parametry**

- `#!dae var int length`  
    Liczba znaków do odczytania

**Zwracana wartość**

Funkcja zwraca odczytany ciąg znaków.

## Przykłady

### Zapisywanie i wczytywanie zmiennych
```dae
const string filename = "System\MySave.sav";

var string s0; // ciąg znaków
var int    i1; // liczba całkowita
var int    b2; // bajt
var string c3; // znak

func void SaveMyData()

 
{
    if(BW_NewFile(filename))  // Utwórz nowy plik:
    { 
        BW_String(s0);
        BW_Int(i1);
        BW_Byte(b2);
        BW_Char(c3);          // Zapisz dane...
        BW_Close();           // ...i zamknij.
    };
};

func void LoadMyData() {
    if(BR_OpenFile(filename)) // Spróbuj otworzyć plik:
    { 
        s0 = BR_String();
        i1 = BR_Int();
        b2 = BR_Byte();
        c3 = BR_Char();       // Odczytaj wartości...
        BR_Close();           // ...i zamknij.
    }
    else 
    {
        SaveMyData();         // W przeciwnym razie utwórz plik z zapisem.
    };
};
```

### Gratulacje dla gracza
```dae
func void Certificate(var string Username, var int Score) 
{
    var string filename; filename = ConcatStrings(Username, "'s Certificate.txt");
    BW_NewFile(filename); // Nazwa użytkownika + "s Certificate.txt". Plik jest w katalogu Gothic.
    BW_Text("Gratulacje "); BW_Text(Username);
    BW_TextLine("!");

    BW_Text("Zdobyłeś ");
    BW_Text(IntToString(Score)); // Nie BW_Int!
    BW_TextLine(" punktów w tej grze.");

    BW_NextLine();

    BW_Text("Z wyrazami szacunku, Autor");
    BW_Close();

    /*
       Przy wywołaniu:  Certificate("Player", 1000);
       zostanie utworzony plik o nazwie 'Player's Certificate.txt', który zawierać będzie:

        Gratulacje NazwaGracza!
        Zdobyłeś 1000 punktów w tej grze.

        Z wyrazami szacunku, Autor
    */
};
```

### Położenie postaci NPC
```dae
func void BW_NpcPosition(var C_NPC slf) 
{
    var int ptr; ptr = MEM_Alloc(60);                // 16 * 4
    MEM_CopyBytes(MEM_InstToPtr(slf) + 60, ptr, 60); // Skopiuj slf.trafoObjToWorld
    BW_Bytes(ptr, 60);                               // Zapisz skopiowane 60 bajtów
    MEM_Free(ptr);                                   // I posprzątaj...
};

func void BR_NpcPosition(var C_NPC slf) 
{
    var int ptr; ptr = BR_Bytes(60);                 // Odczytaj 60 bajtów
    MEM_CopyBytes(ptr, MEM_InstToPtr(slf) + 60, 60); // Wklej z powrotem do slf
    MEM_Free(ptr);                                   // I posprzątaj ponownie...
};

/*
   Użycie standardowe:
     BW_NewFile(file);
     BW_NpcPosition(hero);
     BW_Close();
*/
```

!!! Uwaga
    Przykłady zostały pierwotnie napisane przez Gottfrieda i [opublikowane](https://forum.worldofplayers.de/forum/threads/969446-Skriptpaket-Ikarus-3/page3?p=16198713#post16198713) na forum World of Gothic.
`
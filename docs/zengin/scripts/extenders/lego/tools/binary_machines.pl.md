---
title: BinaryMachines
description: Pakiet LeGo do tworzenia, zapisywania i odczytywania własnych plików
---
# BinaryMachines

!!! info inline end
    **Zależności:**<br/>
    - Brak
    **Implementacja:**<br/>
    [:material-github: BinaryMachines.d na GitHub](https://github.com/Lehona/LeGo/blob/dev/BinaryMachines.d)

Ten pakiet pozwala tworzyć i zapisywać własne pliki w dowolnym miejscu w systemie plików.

## Inicjalizacja
Brak

## BinaryWriter

### `BW_NewFile`
!!! function "`BW_NewFile`"
    Tworzy plik o nazwie `file` i otwiera strumień. Nie działa, jeśli strumień jest już otwarty.
    ```dae
    func int BW_NewFile(var string file)
    ```
    **Parametry**

    - `#!dae var string file`  
        Nazwa tworzonego pliku

    **Zwracana wartość**

    Funkcja zwraca `TRUE` jeśli plik został pomyślnie utworzony i zainicjalizowany, w przeciwnym razie zwracane jest `FALSE`.

### `BW_Close`
!!! function "`BW_Close`"
    Zamyka aktualny strumień zapisu.
    ```dae
    func void BW_Close()
    ```

### `BW`
!!! function "`BW`"
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
!!! function "`BW_Int`"
    Zapisuje 4 bajty z `data` do strumienia. To samo co `BW(data, 4)`.
    ```dae
    func void BW_Int(var int data)
    ```
    **Parametry**

    - `#!dae var int data`  
        Wartość całkowita do zapisania

### `BW_Char`
!!! function "`BW_Char`"
    Zapisuje pierwszy znak z `data` do strumienia. To samo co `BW(Str_GetCharAt(data, 0), 1)`.
    ```dae
    func void BW_Char(var string data)
    ```
    **Parametry**

    - `#!dae var string data`  
        Znak do zapisania

### `BW_String`
!!! function "`BW_String`"
    Zapisuje `data` zakończone znakiem `\0` do strumienia.
    ```dae
    func void BW_String(var string data)
    ```
    **Parametry**

    - `#!dae var string data`  
        Ciąg znaków do zapisania

### `BW_Byte`
!!! function "`BW_Byte`"
    Zapisuje bajt z `data` do strumienia. To samo co `BW(data, 1)`.
    ```dae
    func void BW_Byte(var int data)
    ```
    **Parametry**

    - `#!dae var int data`  
        Wartość bajtowa do zapisania

### `BW_Bytes`
!!! function "`BW_Bytes`"
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
!!! function "`BW_Text`"
    Zapisuje ciąg znaków do strumienia bez jego zakończenia. Nie można go już odczytać.
    ```dae
    func void BW_Text(var string data)
    ```
    **Parametry**

    - `#!dae var string data`  
        Tekst do zapisania

### `BW_NextLine`
!!! function "`BW_NextLine`"
    Zapisuje akapit do strumienia.
    ```dae
    func void BW_NextLine()
    ```

## BinaryReader

### `BR_OpenFile`
!!! function "`BR_OpenFile`"
    Otwiera plik o nazwie `file` i otwiera strumień. Nie działa, jeśli strumień jest już otwarty.
    ```dae
    func int BR_OpenFile(var string file)
    ```
    **Parametry**

    - `#!dae var string file`  
        Plik, który ma być otwarty

    **Zwracana wartość**

    Funkcja zwraca `TRUE` jeśli plik został pomyślnie otworzony i zainicjalizowany, w przeciwnym razie zwracane jest `FALSE`.

### `BR_Close`
!!! function "`BR_Close`"
    Zamyka aktualny strumień odczytu.
    ```dae
    func void BR_Close()
    ```

### `BR`
!!! function "`BR`"
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
!!! function "`BR_Int`"
    Odczytuje 4 bajty ze strumienia. To samo co `BR(4)`.
    ```dae
    func int BR_Int()
    ```
    **Zwracana wartość**

    Funkcja zwraca odczytaną liczbę całkowitą.

### `BR_Char`
!!! function "`BR_Char`"
    Odczytuje znak ze strumienia. To samo co `BR(1)`.
    ```dae
    func string BR_Char()
    ```
    **Zwracana wartość**

    Funkcja zwraca odczytany znak jako `string`.

### `BR_String`
!!! function "`BR_String`"
    Odczytuje ciąg znaków zakończony znakiem `\0` ze strumienia.
    ```dae
    func string BR_String()
    ```
    **Zwracana wartość**

    Funkcja zwraca odczytany ciąg znaków.

### `BR_Byte`
!!! function "`BR_Byte`"
    Odczytuje bajt ze strumienia.
    ```dae
    func int BR_Byte()
    ```
    **Zwracana wartość**

    Funkcja zwraca odczytany bajt.

### `BR_Bytes`
!!! function "`BR_Bytes`"
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
!!! function "`BR_TextLine`"
    Odczytuje linię ze strumienia.
    ```dae
    func string BR_TextLine()
    ```
    **Zwracana wartość**

    Funkcja zwraca odczytaną linię.

### `BR_Text`
!!! function "`BR_Text`"
    Odczytuje ciąg znaków o podanej długości ze strumienia.
    ```dae
    func string BR_Text(var int length)
    ```
    **Parametry**

    - `#!dae var int length`  
        Liczba znaków do odczytania

    **Zwracana wartość**

    Funkcja zwraca odczytany ciąg znaków.

### `BR_NextLine`
!!! function "`BR_NextLine`"
    Zmienia pozycję odczytu na następny akapit, utworzony za pomocą [`BW_NextLine`](#bw_nextline).
    ```dae
    func void BR_NextLine()
    ```

## Wywołania funkcji silnika

### `WIN_GetLastError`
!!! function "`WIN_GetLastError`"
    Wywołanie [funkcji `GetLastError`](https://learn.microsoft.com/en-us/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) z Win32 API.
    ```dae
    func int WIN_GetLastError()
    ```
    **Zwracana wartość**

    Funkcja zwraca kod ostatniego błędu wątku wywołującego.

### `WIN_CreateFile`
!!! function "`WIN_CreateFile`"
    Wywołanie [funkcji `CreateFileA`](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-createfilea) z Win32 API.
    ```dae
    func int WIN_CreateFile(var string lpFileName,var int dwDesiredAccess,var int dwShareMode,var int lpSecurityAttributes,var int dwCreationDisposition,var int dwFlagsAndAttributes,var int hTemplateFile)
    ```
    **Parametry**

    Pełny opis parametrów można znaleźć [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-createfilea#parameters)

    **Zwracana wartość**

    Informacje o zwracanej wartości znajdziesz [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-createfilea#return-value)

### `WIN_WriteFile`
!!! function "`WIN_WriteFile`"
    Wywołanie [funkcji `WriteFile`](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-writefile) z Win32 API.
    ```dae
    func void WIN_WriteFile(var int hFile,var int lpBuffer,var int nNumberOfBytesToWrite,var int lpNumberOfBytesWritten,var int lpOverlapped)
    ```
    **Parametry**

    Pełny opis parametrów można znaleźć [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-writefile#parameters)

### `WIN_ReadFile`
!!! function "`WIN_ReadFile`"
    Wywołanie [funkcji `ReadFile`](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-readfile) z Win32 API.
    ```dae
    func void WIN_ReadFile(var int hFile,var int lpBuffer,var int nNumberOfBytesToRead,var int lpNumberOfBytesRead,var int lpOverlapped)
    ```
    **Parametry**

    Pełny opis parametrów można znaleźć [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-readfile#parameters)

### `WIN_CloseHandle`
!!! function "`WIN_CloseHandle`"
    Wywołanie [funkcji `CloseHandle`](https://learn.microsoft.com/en-us/windows/win32/api/handleapi/nf-handleapi-closehandle) z Win32 API.
    ```dae
    func void WIN_CloseHandle(var int hObject)
    ```
    **Parametry**

    Pełny opis parametrów można znaleźć [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/handleapi/nf-handleapi-closehandle#parameters)

### `WIN_GetFileSize`
!!! function "`WIN_GetFileSize`"
    Wywołanie [funkcji `GetFileSize`](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getfilesize) z Win32 API.
    ```dae
    func int WIN_GetFileSize(var int hFile,var int lpFileSizeHigh)
    ```
    **Parametry**

    Pełny opis parametrów można znaleźć [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getfilesize#parameters)

    **Zwracana wartość**

    Informacje o zwracanej wartości znajdziesz [tutaj](https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-getfilesize#return-value)

### Constants
Dodatkowo istnieją pewne stałe zdefiniowane do użycia z określonymi wywołaniami funkcji silnika.
```dae
const int CREATE_ALWAYS = 2;
const int OPEN_EXISTING = 3;
const int GENERIC_ALL = 1073741824;
const int GENERIC_READ = -2147483648;
const int FILE_SHARE_READ = 1;
const int FILE_SHARE_WRITE = 2;
const int FILE_SHARE_DELETE = 4;
const int FILE_ATTRIBUTE_NORMAL = 128;
```

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
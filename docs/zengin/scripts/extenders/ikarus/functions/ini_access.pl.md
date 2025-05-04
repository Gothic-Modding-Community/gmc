---
title: Ini File Access
---
# Dostęp do plików konfiguracyjnych
Ta część Ikarusa umożliwia dostęp do `Gothic.ini` i pliku konfiguracyjnego załadowanej modyfikacji.

## Inicjalizacja
Najlepszym sposobem na zainicjowanie Ikarusa jest wywołanie `MEM_InitAll()` w funkcji `Init_Global()`. 
!!! warning
    Jeżeli chcesz używać Ikarusa z Gothiciem 1, najlepiej będzie, jeśli zdefiniujesz własną funkcję `Init_Global()` i wywołasz ją w każdej funkcji inicjującej świat.

```dae
MEM_InitAll();
```

## Implementacja
[:material-github: Ikarus.d na GitHubie](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L4293)

## Funkcje odczytu

### `MEM_GetCommandLine`
!!! function "`MEM_GetCommandLine`"
    Zwraca zawartość linii poleceń przekazaną do Gothica.
    ```dae
    func string MEM_GetCommandLine()
    ```
    **Zwracana wartość**

    Funkcja zwraca zawartość linii poleceń przekazaną do Gothica. Może to wyglądać na przykład tak:

    `"-TIME:7:35 -GAME:TEST_IKARUS.INI -ZREPARSE -ZWINDOW -ZLOG:5,S -DEVMODE -ZMAXFRAMERATE:30"`

### `MEM_GetGothOpt`
!!! function "`MEM_GetGothOpt`"
    Przeszukuje `Gothic.ini` w poszukiwaniu opcji
    ```dae
    func string MEM_GetGothOpt(var string sectionname, var string optionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[GAME]`
    - `#!dae var string optionname`  
        Szukana opcja np. `playLogoVideos`

    **Zwracana wartość**

    Funkcja zwraca wartość opcji w postaci ciągu znaków, albo pustą zmienną, gdy opcja nie istnieje w danej sekcji.

### `MEM_GetModOpt`
!!! function "`MEM_GetModOpt`"
    Przeszukuje ini załadowanej modyfikacji w poszukiwaniu opcji.
    ```dae
    func void MEM_GetModOpt(var string sectionname, var string optionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[INFO]`
    - `#!dae var string optionname`  
        Szukana opcja np. `Title`

    **Zwracana wartość**

    Funkcja zwraca wartość opcji w postaci ciągu znaków, albo pustą zmienną, gdy opcja nie istnieje w danej sekcji.

### `MEM_GothOptSectionExists`
!!! function "`MEM_GothOptSectionExists`"
    Sprawdza, czy dana sekcja istnieje w `Gothic.ini`
    ```dae
    func int MEM_GothOptSectionExists(var string sectionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[GAME]`

    **Zwracana wartość**

    Funkcja zwraca wartość `TRUE` jeśli sekcja istnieje, inaczej `FALSE`.

### `MEM_ModOptSectionExists`
!!! function "`MEM_ModOptSectionExists`"
    Sprawdza, czy dana sekcja istnieje w ini załadowanej modyfikacji.
    ```dae
    func int MEM_ModOptSectionExists(var string sectionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[INFO]`

    **Zwracana wartość**

    Funkcja zwraca wartość `TRUE` jeśli sekcja istnieje, inaczej `FALSE`.

### `MEM_GothOptExists`
!!! function "`MEM_GothOptExists`"
    Sprawdza, czy dana opcja istnieje w `Gothic.ini`
    ```dae
    func int MEM_GothOptExists(var string sectionname, var string optionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[GAME]`
    - `#!dae var string optionname`  
        Szukana opcja np. `playLogoVideos`

    **Zwracana wartość**

    Funkcja zwraca wartość `TRUE` jeśli opcja w danej sekcji istnieje, inaczej `FALSE`.

### `MEM_ModOptExists`
!!! function "`MEM_ModOptExists`"
    Sprawdza, czy dana opcja istnieje w ini załadowanej modyfikacji.
    ```dae
    func int MEM_ModOptExists(var string sectionname, var string optionname)
    ```
    **Parametry**

    - `#!dae var string sectionname`  
        Nazwa sekcji np. `[INFO]`
    - `#!dae var string optionname`  
        Szukana opcja np. `Title`

    **Zwracana wartość**

    Funkcja zwraca wartość `TRUE` jeśli opcja w danej sekcji istnieje, inaczej `FALSE`.

    ## Funkcje zapisu
    !!! Warning
        Plik konfiguracyjny modyfikacji nigdy nie jest zapisywany na dysku, dlatego nie ma oddzielnej funkcji do jego zapisu.

### `MEM_SetGothOpt`
!!! function "`MEM_SetGothOpt`"
    Opcja `option` w sekcji `section` jest ustawiana na `value`. Jeśli sekcja i/lub opcja nie istnieje, zostanie utworzona.
    ```dae
    func void MEM_SetGothOpt(var string section, var string option, var string value)
    ```
    **Parametry**

    - `#!dae var string section`  
        Sekcja, w której znajduje się opcja
    - `#!dae var string option`  
        Opcja do zapisania/nadpisania
    - `#!dae var string value`  
        Wartość, na jaką ustawiana jest opcja

### `MEM_ApplyGothOpt`
!!! function "`MEM_ApplyGothOpt`"
    Stosuje zmiany i zapisuje plik ini na dysku.
    ```dae
    func void MEM_ApplyGothOpt()
    ```

    !!! Tip
        Jeśli wprowadzasz nowe opcje, najlepiej kierować się paroma zasadami. Dobrą praktyką jest nazywanie swoich opcji tak, aby inni mogli je zrozumieć i umieszczanie ich w sekcji o takiej samej nazwie jak twój mod. Nie umieszczaj opcji swojej modyfikacji w sekcji `[GAME]` lub `[PERFORMANCE]`.

## Funkcje klawiszy {: id="key-functions" }
`Gothic.ini` zawiera przypisanie klawiszy fizycznych (np. "W") do klawiszy logicznych (np. "keyUp").

### `MEM_GetKey`
!!! function "`MEM_GetKey`"
    Zwraca podstawowy klawisz przypisany do klawisza logicznego.
    ```dae
    func int MEM_GetKey(var string name)
    ```
    **Parametry**

    - `#!dae var string name`  
        Nazwa klawisza logicznego

    **Zwracana wartość**

    Funkcja zwraca klawisz przypisany do klawisza logicznego.

### `MEM_GetSecondaryKey`
!!! function "`MEM_GetSecondaryKey`"
    Zwraca zapasowy klawisz przypisany do klawisza logicznego.
    ```dae
    func int MEM_GetSecondaryKey(var string name)
    ```
    **Parametry**

    - `#!dae var string name`  
        Nazwa klawisza logicznego

    **Zwracana wartość**

    Funkcja zwraca klawisz przypisany do klawisza logicznego.

### `MEM_SetKeys`
!!! function "`MEM_SetKeys`"
    Ustawia klawisze klawiatury dla podanego klawisza logicznego.
    ```dae
    func void MEM_SetKeys(var string name, var int primary, var int secondary)
    ```
    **Parametry**

    - `#!dae var string name`  
        Nazwa klawisza logicznego
    - `#!dae var int primary`  
        Podstawowy klawisz do przypisania, można go pobrać z pliku [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d).
    - `#!dae var int secondary`  
        Zapasowy klawisz do przypisania, można go pobrać z pliku [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d).

### `MEM_SetKey`
!!! function "`MEM_SetKey`"
    Ustawia podstawowy klawisz klawiatury dla klawisza logicznego.
    ```dae
    func void MEM_SetKey(var string name, var int key)
    ```
    **Parametry**

    - `#!dae var string name`  
        Nazwa klawisza logicznego
    - `#!dae var int key`  
        Podstawowy klawisz do przypisania, można go pobrać z pliku [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d).

### `MEM_SetSecondaryKey`
!!! function "`MEM_SetSecondaryKey`"
    Ustawia zapasowy klawisz klawiatury dla klawisza logicznego.
    ```dae
    func void MEM_SetSecondaryKey(var string name, var int key)
    ```
    **Parametry**

    - `#!dae var string name`  
        Nazwa klawisza logicznego
    - `#!dae var int key`  
        Zapasowy klawisz do przypisania, można go pobrać z pliku [Ikarus_Const_G1](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G1.d) / [Ikarus_Const_G2](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Const_G2.d).

# Dostęp do plików konfiguracyjnych
Ta część Ikarusa umożliwia dostęp do `Gothic.ini` i pliku konfiguracyjnego załadowanej modyfikacji.

## Inicjalizacja
Najlepszym sposobem na zainicjowanie Ikarusa jest wywołanie `MEM_InitAll()` w funkcji `Init_Global()`. 
!!! warning
    Jeżeli chcesz używać Ikarusa z Gothiciem 1, najlepiej będzie, jeśli zdefiniujesz własną funkcję `Init_Global()` i wywołasz ją w każdej funkcji inicjującej świat.

```dae
func void MEM_InitAll () {};
```

## Implementacja
[:material-github: Ikarus.d na GitHubie](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L4293)

## Funkcje odczytu

### MEM_GetGothOpt
Przeszukuje `Gothic.ini` w poszukiwaniu opcji
```dae
func string MEM_GetGothOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - wartość opcji w postaci łańcucha znaków, albo pustą zmienną, gdy opcja nie istnieje w danej sekcji

### MEM_GetModOpt
Przeszukuje ini załadowanej modyfikacji w poszukiwaniu opcji.
```dae
func void MEM_GetModOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - wartość opcji w postaci łańcucha znaków, albo pustą zmienną, gdy opcja nie istnieje w danej sekcji

### MEM_GothOptSectionExists
Sprawdza, czy dana sekcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` jeśli sekcja istnieje, inaczej `FALSE`

### MEM_ModOptSectionExists
Sprawdza, czy dana sekcja istnieje w ini załadowanej modyfikacji.
```dae
func int MEM_ModOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` jeśli sekcja istnieje, inaczej `FALSE`

### MEM_GothOptExists
Sprawdza, czy dana opcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptExists(var string sectionname,
var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` jeśli sekcja istnieje, inaczej `FALSE`

### MEM_ModOptExists
Sprawdza, czy dana opcja istnieje w ini załadowanej modyfikacji.
```dae
func int MEM_ModOptExists(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` jeśli sekcja istnieje, inaczej `FALSE`

## Funkcje zapisu
!!! Warning
    Plik konfiguracyjny modyfikacji nigdy nie jest zapisywany na dysku, dlatego nie ma oddzielnej funkcji do jego zapisu.

### MEM_SetGothOpt
Opcja `option` w sekcji `section` jest ustawiana na `value`. Jeśli sekcja i/lub opcja nie istnieje, zostanie utworzona.
```dae
func void MEM_SetGothOpt(var string section, var string option, var string value) {};
```

- `section` - sekcja, w której znajduje się opcja
- `option` - opcja do zapisania/nadpisania
- `value` - wartość, na jaką ustawiana jest opcja

### MEM_ApplyGothOpt
Stosuje zmiany i zapisuje plik ini na dysku.
```dae
func void MEM_ApplyGothOpt() {};
```

!!! Tip
    Jeśli wprowadzasz nowe opcje, najlepiej kierować się paroma zasadami. Dobrą praktyką jest nazywanie swoich opcji tak, aby inni mogli je zrozumieć i umieszczanie ich w sekcji o takiej samej nazwie jak twój mod. Nie umieszczaj opcji swojej modyfikacji w sekcji `[GAME]` lub `[PERFORMANCE]`.


## Funkcje klawiszy
`Gothic.ini` zawiera przypisanie klawiszy fizycznych (np. "W") do klawiszy logicznych (np. "keyUp").

### MEM_GetKey
Zwraca podstawowy klawisz przypisany do klawisza logicznego.
```dae
func int MEM_GetKey (var string name) {};
```

- `name` - nazwa klawisza logicznego
- `return` - klawisz przypisany do klawisza logicznego

### MEM_GetSecondaryKey
Zwraca zapasowy klawisz przypisany do klawisza logicznego.
```dae
func int MEM_GetSecondaryKey(var string name) {};
```

- `name` - nazwa klawisza logicznego
- `return` - klawisz przypisany do klawisza logicznego

### MEM_SetKeys
Ustawia klawisze klawiatury dla klawisza logicznego.
```dae
func void MEM_SetKeys(var string name, var int primary, var int secondary) {};
```

- `name` - nazwa klawisza logicznego
- `primary` - podstawowy klawisz do przypisania, można go pobrać z pliku Ikarus_Const_G1/G2.
- `secondary` - zapasowy klawisz do przypisania, można go pobrać z pliku Ikarus_Const_G1/G2.

### MEM_SetKey
Ustawia podstawowy klawisz klawiatury dla klawisza logicznego.
```dae
func void MEM_SetKey(var string name, var int key) {};
```

- `name` - nazwa klawisza logicznego
- `key` - podstawowy klawisz do przypisania, można go pobrać z pliku Ikarus_Const_G1/G2.

### MEM_SetSecondaryKey
Ustawia zapasowy klawisz klawiatury dla klawisza logicznego.
```dae
func void MEM_SetSecondaryKey(var string name, var int key) {};
```

- `name` - name of the logical key
- `key` - zapasowy klawisz do przypisania, można go pobrać z pliku Ikarus_Const_G1/G2.

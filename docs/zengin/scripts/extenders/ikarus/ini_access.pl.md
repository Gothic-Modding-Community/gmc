# Dostêp do plików konfiguracyjnych
Ta czêœæ Ikarusa umo¿liwia dostêp do `Gothic.ini` i pliku konfiguracujnego za³adowanej modyfikacji.

## Inicjalizacja
Najlepszym sposobem na zainicjowanie Ikarusa jest wywo³anie `MEM_InitAll()` w funkcji `Init_Global()`. 
!!! warning
    Jeœli chcesz u¿ywac Ikarusa z Gothiciem 1, najlepiej bêdzie jeœli zdefiniujesz w³asna funkcje `Init_Global()` i wywo³asz j¹ przy ka¿dej funkcji inicjalizacji œwiata.

```dae
func void MEM_InitAll () {};
```

## Implementacja
[:material-github: Ikarus.d na GitHubie](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d)

## Funkcje odczytu

### MEM_GetGothOpt
Przeszukuje `Gothic.ini` w poszukiwaniu opcji
```dae
func string MEM_GetGothOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - wartoœæ opcji w posatci zmiennej string, albo pust¹ zmienn¹ gdy opcja nie istnieje w danej sekcji

### MEM_GetModOpt
Przeszukuje ini za³adowanej modyfikacji w poszukiwaniu opcji.
```dae
func void MEM_GetModOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - wartoœæ opcji w posatci zmiennej string, albo pust¹ zmienn¹ gdy opcja nie istnieje w danej sekcji

### MEM_GothOptSectionExists
Sparwdza czy dana sekcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` jeœli skecja istnieje, `FALSE` w ka¿dym innym przypadku

### MEM_ModOptSectionExists
Sparwdza czy dana sekcja istnieje w ini za³adowanej modyfikacji
```dae
func int MEM_ModOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` jeœli skecja istnieje, `FALSE` w ka¿dym innym przypadku

### MEM_GothOptExists
Sprawdza czy dana opcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptExists(var string sectionname,
var string optionname) {};
```

- `sectionname` - nazwa przeszukiwaniej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` jeœli skecja istnieje, `FALSE` w ka¿dym innym przypadku

### MEM_ModOptExists
Sprawdza czy dana opcja istnieje w ini za³adowanej modyfikacji
```dae
func int MEM_ModOptExists(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwaniej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` jeœli skecja istnieje, `FALSE` w ka¿dym innym przypadku

## Funkcje zapisu
!!! Warning
    Plik konfiguracyjny modyfikacji nigdy nie jest zapisywany na dysku, dlatego nie ma oddzielnej funkcji do jego zapisu

### MEM_SetGothOpt
Opcja `option` w sekcji `section` jest ustawiana na `value`. Jeœli sekcja i/lub opcja nie istnieje, zostanie utworzona.
```dae
func void MEM_SetGothOpt(var string section, var string option, var string value) {};
```

- `section` - sekcja w której zlokalizowana jest opcja
- `option` - opcja do zapisania/nadpisania
- `value` - wartoœæ na jak¹ ustawiana jest opcja

### MEM_ApplyGothOpt
Stosuje zmiany i zapisuje plik ini na dysku
```dae
func void MEM_ApplyGothOpt() {};
```

!!! Tip
    Jeœli wprowadzasz nowe opcje, najlepiej kierowaæ siê paroma zasadami. Dobr¹ praktyk¹ jest nazywanie swoich opcji tak aby inni mogli je zrozumieæ i umieszczanie ich w sekcji o takiej samej nazwie jak twój mod. Nie umieszczaj opcji sowjej modyfikacji w sekcji `[GAME]` lub `[PERFORMANCE]`.



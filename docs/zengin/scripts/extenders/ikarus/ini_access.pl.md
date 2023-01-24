# Dost�p do plik�w konfiguracyjnych
Ta cz�� Ikarusa umo�liwia dost�p do `Gothic.ini` i pliku konfiguracujnego za�adowanej modyfikacji.

## Inicjalizacja
Najlepszym sposobem na zainicjowanie Ikarusa jest wywo�anie `MEM_InitAll()` w funkcji `Init_Global()`. 
!!! warning
    Je�li chcesz u�ywac Ikarusa z Gothiciem 1, najlepiej b�dzie je�li zdefiniujesz w�asna funkcje `Init_Global()` i wywo�asz j� przy ka�dej funkcji inicjalizacji �wiata.

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
- `return` - warto�� opcji w posatci zmiennej string, albo pust� zmienn� gdy opcja nie istnieje w danej sekcji

### MEM_GetModOpt
Przeszukuje ini za�adowanej modyfikacji w poszukiwaniu opcji.
```dae
func void MEM_GetModOpt(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwanej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - warto�� opcji w posatci zmiennej string, albo pust� zmienn� gdy opcja nie istnieje w danej sekcji

### MEM_GothOptSectionExists
Sparwdza czy dana sekcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` je�li skecja istnieje, `FALSE` w ka�dym innym przypadku

### MEM_ModOptSectionExists
Sparwdza czy dana sekcja istnieje w ini za�adowanej modyfikacji
```dae
func int MEM_ModOptSectionExists(var string sectionname) {};
```

- `sectionname` - nazwa szukanej sekcji
- `return` - `TRUE` je�li skecja istnieje, `FALSE` w ka�dym innym przypadku

### MEM_GothOptExists
Sprawdza czy dana opcja istnieje w `Gothic.ini`
```dae
func int MEM_GothOptExists(var string sectionname,
var string optionname) {};
```

- `sectionname` - nazwa przeszukiwaniej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` je�li skecja istnieje, `FALSE` w ka�dym innym przypadku

### MEM_ModOptExists
Sprawdza czy dana opcja istnieje w ini za�adowanej modyfikacji
```dae
func int MEM_ModOptExists(var string sectionname, var string optionname) {};
```

- `sectionname` - nazwa przeszukiwaniej sekcji
- `optionname` - nazwa szukanej opcji
- `return` - `TRUE` je�li skecja istnieje, `FALSE` w ka�dym innym przypadku

## Funkcje zapisu
!!! Warning
    Plik konfiguracyjny modyfikacji nigdy nie jest zapisywany na dysku, dlatego nie ma oddzielnej funkcji do jego zapisu

### MEM_SetGothOpt
Opcja `option` w sekcji `section` jest ustawiana na `value`. Je�li sekcja i/lub opcja nie istnieje, zostanie utworzona.
```dae
func void MEM_SetGothOpt(var string section, var string option, var string value) {};
```

- `section` - sekcja w kt�rej zlokalizowana jest opcja
- `option` - opcja do zapisania/nadpisania
- `value` - warto�� na jak� ustawiana jest opcja

### MEM_ApplyGothOpt
Stosuje zmiany i zapisuje plik ini na dysku
```dae
func void MEM_ApplyGothOpt() {};
```

!!! Tip
    Je�li wprowadzasz nowe opcje, najlepiej kierowa� si� paroma zasadami. Dobr� praktyk� jest nazywanie swoich opcji tak aby inni mogli je zrozumie� i umieszczanie ich w sekcji o takiej samej nazwie jak tw�j mod. Nie umieszczaj opcji sowjej modyfikacji w sekcji `[GAME]` lub `[PERFORMANCE]`.



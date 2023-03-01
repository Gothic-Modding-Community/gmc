# Misc - różne
Pakiet Misc wprowadza różne funkcje pomocnicze, które nie pasowały do żadnego innego pakietu.

## Zależności  
Brak

## Inicjalizacja
Brak

## Implementation
[:material-github: Misc.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

## Funkcje

### atan2f
Oblicza arcus tangens kąta między początkiem a punktem (x, y).
```dae
func float atan2f(var int x, var int y) {};
```

- `x` -  współrzędna x
- `y` -  współrzędna y
- `return` - arcus tangens w radianach jako Ikarusowy `float`

### sin
Oblicza sinus kąta podanego w radianach.
```dae
func float sin (var float angle) {};
```

- `angle` - kąt w radianach jak Ikarusowy `float`
- `return` - sinus kąta

### cos
Oblicza cosinus kąta podanego w radianach.
```dae
func float cos (var float angle) {};
```

- `angle` - kąt w radianach jak Ikarusowy `float`
- `return` - cosinus kąta


### tan
Oblicza tangens kąta podanego w radianach.
```dae
func float tan (var float angle) {};
```

- `angle` - kąt w radianach jak Ikarusowy `float`
- `return` - tangens kąta

### asin
Oblicza arcus sinus
```dae
func float asin (var float sine) {};
```

- `sine` - sinus kąta
- `return` - arcus sinus kąta

### acos
Oblicza arcus cosinus
```dae
func float acos (var float cosine) {};
```

- `cosine` - cosinus kąta
- `return` - arcus cosinus kąta


### distance2D
Oblicza odległość między dwoma punktami na płaszczyźnie dwuwymiarowej
```dae
func int distance2D(var int x1, var int x2, var int y1, var int y2) {};
```

- `x1` - współrzędna x pierwszego punktu
- `x2` - współrzędna x drugiego punktu
- `y1` - współrzędna y pierwszego punktu
- `y2` - współrzędna y drugiego punktu
- `return` - odległość między dwoma punktami

### distance2Df
Oblicza odległość między dwoma punktami na płaszczyźnie dwuwymiarowej, jako Ikarusowy `float`
```dae
func float distance2Df(var float x1, var float x2, var float y1, var float y2) {};
```

- `x1` - współrzędna x pierwszego punktu
- `x2` - współrzędna x drugiego punktu
- `y1` - współrzędna y pierwszego punktu
- `y2` - współrzędna y drugiego punktu
- `return` - odległość między dwoma punktami, jako Ikarusowy `float`


---
title: Różne
---
# Misc - różne
Pakiet Misc wprowadza różne funkcje pomocnicze, które nie pasowały do żadnego innego pakietu.

## Zależności  
Nie dotyczy.

## Inicjalizacja
Nie dotyczy.

## Implementacja
[:material-github: Misc.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

## Funkcje

### `atan2f`
Oblicza arcus tangens kąta między początkiem a punktem (x, y).
```dae
func float atan2f(var int x, var int y)
```
**Parametry**

- `#!dae var int x`  
    Współrzędna x
- `#!dae var int y`  
    Współrzędna y

**Zwracana wartość**

Funkcja zwraca arcus tangens w radianach jako ikarusowy `float`

### `sin`
Oblicza sinus kąta podanego w radianach.
```dae
func float sin(var float angle)
```
**Parametry**

- `#!dae var float angle`  
    Kąt w radianach jako ikarusowy `float`

**Zwracana wartość**

Funkcja zwraca sinus kąta.

### `cos`
Oblicza cosinus kąta podanego w radianach.
```dae
func float cos(var float angle)
```
**Parametry**

- `#!dae var float angle`  
    Kąt w radianach jako ikarusowy `float`

**Zwracana wartość**

Funkcja zwraca cosinus kąta.


### `tan`
Oblicza tangens kąta podanego w radianach.
```dae
func float tan(var float angle)
```
**Parametry**

- `#!dae var float angle`  
    Kąt w radianach jako ikarusowy `float`

**Zwracana wartość**

Funkcja zwraca tangens kąta.

### `asin`
Oblicza arcus sinus
```dae
func float asin(var float sine)
```
**Parametry**

- `#!dae var float sine`  
    Sinus kąta jako ikarusowy `float`

**Zwracana wartość**

Funkcja zwraca arcus sinus kąta.

### `acos`
Oblicza arcus cosinus
```dae
func float acos(var float cosine)
```
**Parametry**

- `#!dae var float cosine`  
    Cosinus kąta jako ikarusowy `float`

**Zwracana wartość**

Funkcja zwraca arcus cosinus kąta.


### `distance2D`
Oblicza odległość między dwoma punktami na płaszczyźnie dwuwymiarowej.
```dae
func int distance2D(var int x1, var int x2, var int y1, var int y2)
```
**Parametry**

- `#!dae var int x1`  
    współrzędna x pierwszego punktu
- `#!dae var int x2`  
    współrzędna x drugiego punktu
- `#!dae var int y1`  
    współrzędna y pierwszego punktu
- `#!dae var int y2`  
    współrzędna y drugiego punktu

**Zwracana wartość**

Funkcja zwraca odległość między dwoma punktami.


### `distance2Df`
Oblicza odległość między dwoma punktami na płaszczyźnie dwuwymiarowej, ale na liczbach zmiennoprzecinkowych (float).
```dae
func float distance2Df(var float x1, var float x2, var float y1, var float y2)
```
**Parametry**

- `#!dae var float x1`  
    współrzędna x pierwszego punktu
- `#!dae var float x2`  
    współrzędna x drugiego punktu
- `#!dae var float y1`  
    współrzędna y pierwszego punktu
- `#!dae var float y2`  
    współrzędna y drugiego punktu

**Zwracana wartość**

Funkcja zwraca odległość między dwoma punktami, jako ikarusowy `float`.


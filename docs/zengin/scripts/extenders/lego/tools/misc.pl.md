---
title: Misc
description: Pakiet LeGo implementujący różne funkcje pomocnicze
---
# Misc - różne

!!! info inline end
    **Zależności:**<br/>
    - Nie dotyczy.<br/>
    **Implementacja:**<br/>
    [:material-github: Misc.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

Pakiet Misc wprowadza różne funkcje pomocnicze, które nie pasowały do żadnego innego pakietu.

## Inicjalizacja
Nie dotyczy.

## Stałe
Pakiet Misc implementuje satłą `phi`
```dae
const int phi = 1070141312; // PI/2
```
która w rzeczywistości jest liczbą `pi` podzieloną przez 2 zapisaną jako ikarusowy float.

Decymalnie: `1.5707...`

## Funkcje

### `atan2f`
!!! function "`atan2f`"
    Oblicza arcus tangens kąta między początkiem a punktem (x, y).
    ```dae
    func int atan2f(var int x, var int y)
    ```
    **Parametry**

    - `#!dae var int x`  
        Współrzędna x
    - `#!dae var int y`  
        Współrzędna y

    **Zwracana wartość**

    Funkcja zwraca arcus tangens w radianach, jako ikarusowy `float`.

### `sin`
!!! function "`sin`"
    Oblicza sinus kąta podanego w radianach.
    ```dae
    func int sin(var int angle)
    ```
    **Parametry**

    - `#!dae var int angle`  
        Kąt w radianach jako ikarusowy `float`

    **Zwracana wartość**

    Funkcja zwraca sinus kąta, jako ikarusowy `float`.

### `cos`
!!! function "`cos`"
    Oblicza cosinus kąta podanego w radianach.
    ```dae
    func int cos(var int angle)
    ```
    **Parametry**

    - `#!dae var int angle`  
        Kąt w radianach jako ikarusowy `float`

    **Zwracana wartość**

    Funkcja zwraca cosinus kąta, jako ikarusowy `float`.

### `tan`
!!! function "`tan`"
    Oblicza tangens kąta podanego w radianach.
    ```dae
    func int tan(var int angle)
    ```
    **Parametry**

    - `#!dae var int angle`  
        Kąt w radianach jako ikarusowy `float`

    **Zwracana wartość**

    Funkcja zwraca tangens kąta, jako ikarusowy `float`.

### `asin`
!!! function "`asin`"
    Oblicza arcus sinus
    ```dae
    func int asin(var int sine)
    ```
    **Parametry**

    - `#!dae var int sine`  
        Sinus kąta jako ikarusowy `float`

    **Zwracana wartość**

    Funkcja zwraca arcus sinus kąta, jako ikarusowy `float`.

### `acos`
!!! function "`acos`"
    Oblicza arcus cosinus
    ```dae
    func int acos(var int cosine)
    ```
    **Parametry**

    - `#!dae var int cosine`  
        Cosinus kąta jako ikarusowy `float`

    **Zwracana wartość**

    Funkcja zwraca arcus cosinus kąta, jako ikarusowy `float`.

### `distance2D`
!!! function "`distance2D`"
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
!!! function "`distance2Df`"
    Oblicza odległość między dwoma punktami na płaszczyźnie dwuwymiarowej, ale na liczbach zmiennoprzecinkowych (float).
    ```dae
    func int distance2Df(var int x1, var int x2, var int y1, var int y2)
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

    Funkcja zwraca odległość między dwoma punktami, jako ikarusowy `float`.

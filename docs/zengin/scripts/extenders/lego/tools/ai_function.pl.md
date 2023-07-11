---
title: Funkcje AI
---
# AI Function - Funkcje AI
Ten pakiet umożliwia wywoływanie funkcji opóźnionych w czasie poprzez kolejkowanie ich w kolejce AI danego NPC. Może to być bardzo przydatne przy pisaniu przerywników filmowych na silniku lub implementacji nowych rutyn.

## Zależności

- [HookEngine](hook_engine.md)

## Inicjalizacja
Zainicjuj za pomocą flagi `LeGo_AI_Function`.
```dae
LeGo_Init(LeGo_AI_Function);
```
## Implementacja
[:material-github: AI_Function.d na GitHubie](https://github.com/Lehona/LeGo/blob/dev/AI_Function.d)

## Functions
Funkcja `function` jest wywoływana z opóźnieniem: dołącza do kolejki AI `slf`.
```dae
func void AI_Function(var C_NPC slf, var func function)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC, do którego kolejki AI dołącza funkcja
- `#!dae var func function`  
    Funkcja wywoływana z opóźnieniem

Dodatkowo istnieją pewne przeciążenia `AI_Function`, które pozwalają na wywoływanie funkcji z parametrami.
```dae
func void AI_Function_I  (var C_NPC slf, var func function, var int    param) {}; // Int
func void AI_Function_N  (var C_NPC slf, var func function, var int    param) {}; // Instance (e.g. NPC)
func void AI_Function_S  (var C_NPC slf, var func function, var string param) {}; // String
func void AI_Function_II (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Int, Int
func void AI_Function_NN (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Instance, Instance
func void AI_Function_SS (var C_NPC slf, var func function, var string param1, var string param2) {}; // String, String
func void AI_Function_IS (var C_NPC slf, var func function, var int    param1, var string param2) {}; // Int, String
func void AI_Function_SI (var C_NPC slf, var func function, var string param1, var int    param2) {}; // String, Int
func void AI_Function_NS (var C_NPC slf, var func function, var int    param1, var string param2) {}; // Instance, String
func void AI_Function_SN (var C_NPC slf, var func function, var string param1, var int    param2) {}; // String, Istance
func void AI_Function_IN (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Int, Instance
func void AI_Function_NI (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Instance, Int
```
Nie można wywoływać funkcji z więcej niż dwoma parametrami, ale parametry można przekazywać pośrednio przez zmienne globalne.

W wywołanej funkcji dostęp do `slf` można uzyskać w następujący sposób:
```dae
var oCNpc slf; slf = _^(ECX);
```
!!! Info
    Od LeGo 2.7.2 globalna instancja `self` jest dostarczana poprawnie i może być używana bezpośrednio.

## Przykłady

### Kolejkowanie prostej funkcji
Zanim funkcja zostanie wywołana, każdy NPC powinien najpierw zakończyć swoją kolejkę AI.

Tutaj bohater ma biec do Waypointu i dopiero po dotarciu na miejsce ma rozpocząć się ruch kamery.
```dae
func void Example1() {
    Npc_ClearAIQueue(hero);
    AI_GotoWP(hero, "MYWAYPOINT");

    AI_Function_S(hero, Wld_SendTrigger, "CAMERASTART");
};
```
Gdy tylko bohater dotrze do Waypointu, wywoływane jest `Wld_SendTrigger("CAMERASTART");`.
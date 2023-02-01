# Timer
Timer is a better alternative to the timers that Gothic offers. The [FrameFunctions](frame_functions.md) and Anim8 packages are already based on it. It isn't possible to modify the current time, as this would only cause difficulties.

## Dependencies
No dependencies

## Initialization
Initialize with `LeGo_Timer` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Timer);
```
## Implementation
[:material-github: Timer.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Timer.d)

## Functions

### Timer
Returns the current playing time. If a new game is started, the time is 0. It is measured in milliseconds.
```dae
func int Timer() {};
```

- `return` - Current playing time in milliseconds

### TimerGT
Returns the current game time, but the timer is paused when the game is paused (in the menu or status screen).
```dae
func int TimerGT() {};
```

- `return` - Current playing time in milliseconds

### TimerF
Alias to `Timer` function that returns the time as an Ikarus float value.
```dae
func int TimerF() {};
```

- `return` - Current playing time as an Ikarus float value

### Timer_SetPause
Pauses the timer (and thus all [FrameFunctions](frame_functions.md) and running animations).
```dae
func void Timer_SetPause(int on) {};
```

- `on` - pause on/off

### Timer_SetPauseInMenu
The timer can automatically pause when the game is paused. (status screen, main menu...)
```dae
func void Timer_SetPauseInMenu(int on) {};
```

- `on` - automatic pause on/off

### Timer_IsPaused
This can be used to query whether the timer is currently paused.
```dae
func int Timer_IsPaused() {};
```

- `return` - `TRUE` if the timer is paused, `FALSE` otherwise

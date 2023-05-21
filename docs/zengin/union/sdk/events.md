# Game Events
Union defines several Game Events that are dispatched when a specific event occurs in-game. Handlers are defined in `Plugin.cpp` and we can use them to execute our code during specific moments of the application lifetime.

## Events

### Initialization

#### Game_Entry
Executes at the entry point of the Gothic executable. During this time the engine classes are not yet initialized, so using them may cause an access violation. The entry point be used to execute some logic before Gothic loads itself.
```cpp
void Game_Entry() {

}
```

#### Game_DefineExternals
Executes before the Daedalus parser starts loading scripts. It's meant to define [custom external functions](externals.md).
```cpp
void Game_DefineExternals() {

}
```

#### Game_Init
Executes right after DAT files are loaded and just before the main menu shows up.
```cpp
void Game_Init() {

}
```


### Level Change

#### Game_LoadBegin
Executes when we initiate a level change by one of the possible actions. The default plugin template uses a common `LoadBegin()` function to handle all events but we also can write different logic for different cases.

```cpp
void LoadBegin() {

}

// When player clicks "New Game"
void Game_LoadBegin_NewGame() {
    LoadBegin();
}

// When player loads a saved game
void Game_LoadBegin_SaveGame() {
    LoadBegin();
}

// When player changes ZEN by a trigger
void Game_LoadBegin_ChangeLevel() {
    LoadBegin();
}
```

#### Game_LoadEnd
Executes when the level loading finishes. The default plugin template uses a common `LoadEnd()` function to handle all events but we also can write different logic for different cases.

```cpp
void LoadEnd() {

}

// When player clicks "New Game"
void Game_LoadEnd_NewGame() {
    LoadEnd();
}

// When player loads a saved game
void Game_LoadEnd_SaveGame() {
    LoadEnd();
}

// When player changes ZEN by a trigger
void Game_LoadEnd_ChangeLevel() {
    LoadEnd();
}
```

#### Game_LoadBegin_Trigger
Executes when the player enters a trigger that initiates ZEN change.

```cpp
void Game_LoadBegin_Trigger() {

}
```

#### Game_LoadEnd_Trigger
Executes after the player has entered a trigger that initiates ZEN change.

```cpp
void Game_LoadEnd_Trigger() {

}
```

#### Game_ApplyOptions
Executes after `Game_LoadEnd`, when we save the game, and also when we exit the game. It's meant to be used to apply options from INI files.
```cpp
void Game_ApplyOptions() {

}
```

### Game Loop

#### Game_PreLoop
Executes at the start of every frame.

```cpp
void Game_PreLoop() {

}
```

#### Game_Loop
Executes at every frame.

```cpp
void Game_Loop() {

}
```

#### Game_PostLoop
Executes at the end of every frame.

```cpp
void Game_PostLoop() {

}
```

#### Game_MenuLoop
Executes at every frame when the game menu is active.

```cpp
void Game_MenuLoop() {

}
```

#### Game_SaveBegin
Executes when the player started saving a game.

```cpp
void Game_SaveBegin() {

}
```

#### Game_SaveEnd
Executes when the game save finishes.

```cpp
void Game_SaveEnd() {

}
```

#### Game_Pause
Executes when the player opens the in-game menu.

```cpp
void Game_Pause() {

}
```

#### Game_Unpause
Executes when the player leaves the in-game menu and also when the player loads a saved game.

```cpp
void Game_Unpause() {

}
```

### Shutdown

#### Game_Exit
Executes when the player exits the game.

```cpp
void Game_Exit() {

}
```
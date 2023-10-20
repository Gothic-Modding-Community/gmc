# Gamestate
Gamestate package allows to check for different game states (game start, game load or level change).

## Dependencies  
- [EventHandler](../tools/event_handler.md)
- [Saves](../applications/saves.md)

## Initialization
Initialize with `LeGo_Gamestate` flag.
```dae
LeGo_Init(LeGo_Gamestate);
```
## Implementation
[:material-github: Gamestate.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Gamestate.d)

## Functions

### `Gamestate_AddListener`
Adds a listener/handler to the game-state event.
```dae
func void Gamestate_AddListener(var func listener)
```
**Parameters**

- `#!dae var func listener`  
    This function will be called on a game-state change. The current game-state is passed as a parameter.


### `Gamestate_RemoveListener`
Removes game-state listener.
```dae
func void Gamestate_RemoveListener(var func listener)
```
**Parameters**

- `#!dae var func listener`  
    Listener function to be removed.

## Examples
There are now two possibilities. Everything can be done directly into the `Init_Global`, or with [EventHandler](../tools/event_handler.md).
### Init_Global
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame) 
    {
        MEM_Info("New game started.");
    }
    else if(Gamestate == Gamestate_Loaded)
    {
        MEM_Info("Game loaded.");
    }
    else if(Gamestate == Gamestate_WorldChange)
    {
        MEM_Info("Worldshift.");
    }
    else
    {
        MEM_Info("I don't pass.");
    };
};
```

It can also be done like that:
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame)
    {
        FF_Apply(MyLoop);
        FF_Apply(My2ndLoop);
    };
};
```
This would have the same effect as:
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    FF_ApplyOnce(MyLoop);
    FF_ApplyOnce(My2ndLoop);
};
```

### EventHandler
```dae
func void Init_Global()
{
    // [...]

    LeGo_Init(LeGo_All);

    Gamestate_AddListener(MyGamestateListener);
};

func void MyGamestateListener(var int state)
{
    if(state == Gamestate_NewGame)
    {
        MEM_Info("New game started.");
    }
    else if(state == Gamestate_Loaded)
    {
        MEM_Info("Game loaded.");
    }
    else if(state == Gamestate_WorldChange)
    {
        MEM_Info("Worldshift.");
    }
    else
    {
        MEM_Info("I don't pass.");
    };
};
```
This is the same as the [`Init_Global`](#init_global) example, but it may look more elegant to some.

!!! Note
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_Gamestate).

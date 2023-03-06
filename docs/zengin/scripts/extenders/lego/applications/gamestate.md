# Gamestate
Gamestate package allows to check for different game states (game start, game load or level change).

## Dependencies  
- EventHandler
- Saves

## Initialization
Initialize with `LeGo_Gamestate` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Gamestate);
```
## Implementation
[:material-github: Gamestate.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Gamestate.d)

## Functions

### Gamestate_AddListener
Adds a listener/handler to the game-state event.
```dae
func void Gamestate_AddListener(var func listener) {};
```

- `listener` - This function will be called on a game-state change. The current game-state is passed as a parameter.


### Gamestate_RemoveListener
Removes game-state listener.
```dae
func void Gamestate_RemoveListener(var func listener) {};
```

- `listener` - listener function to be removed.

## Examples
There are now two possibilities: either you do it directly into the Init-Global, or you use the EventHandler.
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

This might be useful when working with PermMem, where PermMem objects do not need to be recreated after the game loads.

You can also think up something like this:
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

### Event Handler
It is quickly explained:
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
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_Gamestate)

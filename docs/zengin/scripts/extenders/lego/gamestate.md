# Gamestate
Sometimes it is useful to know 'where' you are. Gamestate tells whether a new game was started, loaded, or a level change took place. (Either about a global variable or event)

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
Adds a listener/handler to the Gamestate event.
```dae
void Gamestate_AddListener(func listener) {};
```

- `listener` - This function will be called in the future, should the gamestate change. The current gamestate is passed as a parameter.

### Gamestate_RemoveListener
Removes gamestate listener.
```dae
void Gamestate_RemoveListener(func listener) {};
```

- `listener` - If it is no longer called in the future, the game state should change.

## Examples
There are now two possibilities: either you do it directly into the Init-Global, or you do it casually with the EventHandler.
### Init_Global
```dae
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame) {
        MEM_Info("New game started.");
    }
    else if(Gamestate == Gamestate_Loaded) {
        MEM_Info("Game loaded.");
    }
    else if(Gamestate == Gamestate_WorldChange) {
        MEM_Info("Worldshift.");
    }
    else {
        MEM_Info("I don't pass.");
    };
};
```
That was all the package can do. 

The meaning is recognizable, I hope: things that you eg. want to do with PermMem, i.e. exist throughout the game can be dealt with in the first block. A PermMem object doesn't need to be recreated after a game loads.

You can also think up something like this:
```dae
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    if(Gamestate == Gamestate_NewGame) {
        FF_Apply(MyLoop);
        FF_Apply(My2ndLoop);
    };
};
```
This would have the same effect as:
```dae
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    FF_ApplyOnce(MyLoop);
    FF_ApplyOnce(My2ndLoop);
};
```
But if a tick is faster.

### Event Handler
It is quickly explained:
```dae
func void Init_Global() {
    // [...]

    LeGo_Init(LeGo_All);

    Gamestate_AddListener(MyGamestateListener);
};

func void MyGamestateListener(var int state) {
    if(state == Gamestate_NewGame) {
        MEM_Info("New game started.");
    }
    else if(state == Gamestate_Loaded) {
        MEM_Info("Game loaded.");
    }
    else if(state == Gamestate_WorldChange) {
        MEM_Info("Worldshift.");
    }
    else {
        MEM_Info("I don't pass.");
    };
};
```
Except for which the listener is outsourced, everything is at the same time.

!!! Note
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_Gamestate)
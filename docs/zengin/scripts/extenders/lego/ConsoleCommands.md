# Console Commands
This package allows you to create new console commands.

## Dependencies

- PermMem
- HookEngine

## Initialization
Initialize with `LeGo_ConsoleCommands` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_ConsoleCommands);
```

## Implementation
[:material-github: ConsoleCommands.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/ConsoleCommands.d)

## Functions

### CC_Register
Registers a new console command.
```dae
func void CC_Register(var func f, var string cmdPrefix, var string description) {};
```

- `f` - This function is executed when the command `cmdPrefix` is entered in the console. The function signature is `func string f(var string p0)`. The string passed is everything that was specified in the console after the actual command. The return value is then displayed in the console.
- `cmdPrefix` - This is the command that can be entered in the console.
- `description` - This text appears next to the command (in zSpy) when you use the `help` command in the console.

### CC_Remove
Removes a function from the console commands.
```dae
func void CC_Remove(var func f) {};
```

- f - This function will be removed, i.e. the associated command will no longer work.

### CC_Active
Checks whether the function passed is already part of a console command.
```dae
func int CC_Active(var func f) {};
```

- `f` - function being checked
- `return` - `TRUE` if there is a corresponding function, `FALSE` otherwise.

## Examples

### Basic command example
As a basic example let's create a version command that prints a version of our modification.  
First we declare a constant `string` variable to hold the version string to be shown.
```dae
const string Mod_Version = "My mod version 0.1alpha";
```
Next we create the command function.
!!! Note
    Notice the correct function signature. If you do not adhere to the correct function signature the command will crash the game.

```dae
// This function is called by our console
func string CC_ModVersion (var string param)
{
	return Mod_Version;
};
```
Then we have to register the functions. For convenience I create a new `RegisterConsoleFunctions` function to initialize all console commands. The function is really simple.
```dae
func void RegisterConsoleFunctions()
{
	CC_Register (CC_ModVersion, "mod_version", "Version of my amazing mod.");
};
```
Lastaly we have to call this function from `INIT_GLOBAL` function.
```dae
func void INIT_GLOBAL()
{
	// will be called for every world (from INIT_<LevelName>)
	Game_InitGerman();

    // Ikarus initialization
	MEM_InitAll();

    // LeGo initialization
    LeGo_Init(LeGo_ConsoleCommands);

    // Here we register all of our commands
    RegisterConsoleFunctions();
    
    
    // the rest of the code 
};
```

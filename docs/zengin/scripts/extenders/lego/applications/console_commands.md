# Console Commands
This package allows you to create new console commands.

## Dependencies

- [PermMem](../tools/permmem.md)
- [HookEngine](../tools/hook_engine.md)

## Initialization
Initialize with `LeGo_ConsoleCommands` flag.
```dae
LeGo_Init(LeGo_ConsoleCommands);
```

## Implementation
[:material-github: ConsoleCommands.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/ConsoleCommands.d)

## Functions

### `CC_Register`
Registers a new console command.
```dae
func void CC_Register(var func f, var string cmdPrefix, var string description)
```
**Parameters**

- `#!dae var func f`  
    This function is executed when the `cmdPrefix` command is entered in the console. The function signature is `func string f(var string p0)`. The string passed is everything that was specified in the console after the actual command. The return value is then displayed in the console.
- `#!dae var string cmdPrefix`  
    This is a command, which can be entered in the console.
- `#!dae var string description`  
    This text appears next to the command (in [zSpy](../../../../tools/zSpy.md)) when you use the `help` command in the console.

### `CC_Remove`
Removes a function from the console commands.
```dae
func void CC_Remove(var func f)
```
**Parameters**

- `#!dae var func f`  
    This function will be removed, i.e. the associated command will no longer work.

### `CC_Active`
Checks whether the function passed is already part of a console command.
```dae
func int CC_Active(var func f)
```
**Parameters**

- `#!dae var func f`  
    Function being checked

**Return value**

The function returns `TRUE` if there is a corresponding function, `FALSE` is returned otherwise.

## Examples

### Basic command example
As a basic example - let us create a version command, which prints a version of our modification.  
Firstly, we declare a constant `string` variable to hold the version string to be shown.
```dae
const string Mod_Version = "My mod version 0.1alpha";
```
Next we create the command function.
!!! Note
    Notice the correct function signature. If you do not adhere to the correct function signature, the command will crash the game.

```dae
// This function is called by our console
func string CC_ModVersion(var string param)
{
    return Mod_Version;
};
```
We then have to register the functions. For convenience, I created a new `RegisterConsoleFunctions` function to initialize all console commands. The function is really simple.
```dae
func void RegisterConsoleFunctions()
{
    CC_Register (CC_ModVersion, "mod_version", "Version of my amazing mod.");
};
```
Lastly, we have to call this function from `INIT_GLOBAL` function.
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

# Daedalus Injection
Script injection is a process of injecting Daedalus scripts on runtime, without the need to recompile the scripts. This is essential for Union plugins that need to alter the scripts in a certain way, for hotfixes or just testing scripts without the need to recompile the whole `.dat` file.

To inject a script, simply put a `.d` or `.src` file in `Gothic/System/Autorun` directory and run the game.

!!! tip
    Automatic injection does not extend to nested directories in the Autorun directory directly, but you can put a `.src` file into `Autorun` directory and the rest into a subdirectory to keep a cleaner structure.

Scripts in subdirectories can be accessed in two ways

1. They are specified in a `.src` file
2. The script file is an [API script](#API-script)

## API script
API scripts are `.d` files placed in `Autorun` subdirectories and are used as a dependency.
It is assumed, that the API script is not called on its own (or form a `.src`) file, but is called using the dependency keyword `After` in one of the injected script files' META block.

These scripts are meant to contain ready-made solution that need to be used by many other scripts as a dependency.

!!! warning
    If the file specified in the `After` tag in the META block does not exist, the current file will not be parsed and injected, since the dependency is missing, it would fail. Due to this it is best to ship the dependency in the Autorun directory, even if it comes from a different plugin.

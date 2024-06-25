# Union
Union is a system to patch and extend Gothic's engine the ZenGin. It allows you to load `.dll` files - ZenGin extensions created using the Gothic/Union SDK and `.patch` files - files designed to patch the game's executable. The Union installer also contains the SystemPack a collection of bug fixes and engine edits that improve performance.

## [Plug-ins](plugins/index.md)
Union plugins are shipped in the form of a `.dll` library. This library contains the compiled C++ code with the Union SDK and an embedded `.patch` file.

## [Union SDK](sdk/index.md) & Gothic API
Union software development kit is a collection of tools and the Gothic API that allow you to create Union plugins and alter the engine's behavior.    
Gothic API is a set of 4 interfaces (each for one different ZenGin version) that allow you to interface with the engine, access the engine objects, change their behavior and introduce new classes and functionality.

## [PATCH file format](patch.md)
The `.patch` file contains one or more small programs that are designed to change the engine code (game executable). This is usually done to fix bugs. Union plug-ins contain an embedded `.patch` file and this file usually contains changes to the binary necessary for the proper function of the plug-in.

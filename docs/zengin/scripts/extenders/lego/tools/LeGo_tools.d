// =========================================================
//
//  AI_Function
//
// =========================================================

/// Queues the `function` to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
func void AI_Function(var C_NPC slf, var func function) {};

/// Queues the `function` with an integer parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param Integer parameter for the function
func void AI_Function_I(var C_NPC slf, var func function, var int param) {};

/// Queues the `function` with an NPC instance parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param NPC instance parameter for the function
func void AI_Function_N(var C_NPC slf, var func function, var int param) {};

/// Queues the `function` with a string parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param String parameter for the function
func void AI_Function_S(var C_NPC slf, var func function, var string param) {};

/// Queues the `function` with two integer parameters to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 First integer parameter for the function
/// @param param2 Second integer parameter for the function
func void AI_Function_II(var C_NPC slf, var func function, var int param1, var int param2) {};

/// Queues the `function` with two NPC instance parameters to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 First NPC instance parameter for the function
/// @param param2 Second NPC instance parameter for the function
func void AI_Function_NN(var C_NPC slf, var func function, var int param1, var int param2) {};

/// Queues the `function` with two string parameters to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 First string parameter for the function
/// @param param2 Second string parameter for the function
func void AI_Function_SS(var C_NPC slf, var func function, var string param1, var string param2) {};

/// Queues the `function` with an integer and a string parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 Integer parameter for the function
/// @param param2 String parameter for the function
func void AI_Function_IS(var C_NPC slf, var func function, var int param1, var string param2) {};

/// Queues the `function` with a string and an integer parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 String parameter for the function
/// @param param2 Integer parameter for the function
func void AI_Function_SI(var C_NPC slf, var func function, var string param1, var int param2) {};

/// Queues the `function` with an NPC instance and a string parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 NPC instance parameter for the function
/// @param param2 String parameter for the function
func void AI_Function_NS(var C_NPC slf, var func function, var int param1, var string param2) {};

/// Queues the `function` with a string and an NPC instance parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 String parameter for the function
/// @param param2 NPC instance parameter for the function
func void AI_Function_SN(var C_NPC slf, var func function, var string param1, var int param2) {};

/// Queues the `function` with an integer and an NPC instance parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 Integer parameter for the function
/// @param param2 NPC instance parameter for the function
func void AI_Function_IN(var C_NPC slf, var func function, var int param1, var int param2) {};

/// Queues the `function` with an NPC instance and an integer parameter to be called with a delay in the AI queue of `slf`.
///
/// @param slf NPC in whose AI queue the function is queued
/// @param function Name of the function to be queued
/// @param param1 NPC instance parameter for the function
/// @param param2 Integer parameter for the function
func void AI_Function_NI(var C_NPC slf, var func function, var int param1, var int param2) {};

// =========================================================
//
//  BinaryMachines
//
// =========================================================

/// Creates the file with the specified `file` name and opens a stream. Fails if a stream is already open.
///
/// @param file Name of the created file
/// @return Returns TRUE if the file is successfully created and initialized; otherwise, FALSE.
func int BW_NewFile(var string file) {};

/// Closes the current write stream.
func void BW_Close() {};

/// Writes `length` bytes from `data` to the stream, up to a maximum of 4 bytes.
///
/// @param data Value of bytes
/// @param length Number of bytes
func void BW(var int data, var int length) {};

/// Writes 4 bytes from `data` to the stream, equivalent to `BW(data, 4)`.
///
/// @param data Integer value to write
func void BW_Int(var int data) {};

/// Writes the first character from `data` to the stream, equivalent to `BW(Str_GetCharAt(data, 0), 1)`.
///
/// @param data Char to write
func void BW_Char(var string data) {};

/// Writes `data` terminated with '\0' to the stream.
///
/// @param data String to write
func void BW_String(var string data) {};

/// Writes a byte from `data` to the stream, equivalent to `BW(data, 1)`.
///
/// @param data Byte value to write
func void BW_Byte(var int data) {};

/// Writes `length` of bytes from the pointer `dataPtr` to the stream.
///
/// @param dataPtr Pointer to the data to write
/// @param length Number of bytes
func void BW_Bytes(var int dataPtr, var int length) {};

/// Writes the string `data` to the stream without terminating it, making it unreadable.
///
/// @param data Text to write
func void BW_Text(var string data) {};

/// Writes a paragraph to the stream.
func void BW_NextLine() {};

/// Opens the file with the specified `file` name and opens a stream. Fails if a stream is already open.
///
/// @param file File to be opened
/// @return Returns TRUE if the file is successfully opened and initialized; otherwise, FALSE.
func int BR_OpenFile(var string file) {};

/// Closes the current read stream.
func void BR_Close() {};

/// Reads bytes from the stream, up to a maximum of 4 bytes.
///
/// @param length Number of bytes to read
/// @return Returns the value of read bytes
func int BR(var int length) {};

/// Reads 4 bytes from the stream, equivalent to `BR(4)`.
///
/// @return Returns the read integer
func int BR_Int() {};

/// Reads a character from the stream, equivalent to `BR(1)`.
///
/// @return Returns the read character as a string
func string BR_Char() {};

/// Reads a string terminated by '\0' from the stream.
///
/// @return Returns the read string
func string BR_String() {};

/// Reads a byte from the stream.
///
/// @return Returns the read byte
func int BR_Byte() {};

/// Reads bytes from the stream.
///
/// @param length Number of bytes to read
/// @return Returns a pointer to the read bytes
func int BR_Bytes(var int length) {};

/// Reads a line from the stream.
///
/// @return Returns the read line
func string BR_TextLine() {};

/// Reads a string of the given `length` from the stream.
///
/// @param length Number of characters to read
/// @return Returns the read string
func string BR_Text(var int length) {};

/// Changes the read position to the next paragraph created with `BW_NextLine`.
func void BR_NextLine() {};

// =========================================================
//
//  EventHandler
//
// =========================================================

/// Creates a new event and returns a handle to it.
///
/// @return The function returns a new PermMem handle to an event.
func int Event_Create() {};

/// Alias to PermMem `delete`. Cleans up the handle.
///
/// @param event Handle returned from `Event_Create`
func void Event_Delete(var int event) {};

/// Checks whether the event is "empty," i.e., nothing will happen after its execution.
///
/// @param event Handle returned from `Event_Create`
/// @return The function returns TRUE if the event is empty; otherwise, FALSE.
func int Event_Empty(var int event) {};

/// Checks if `function` is added to the event.
///
/// @param event Handle returned from `Event_Create`
/// @param function Checked function
/// @return The function returns TRUE if the function is added; otherwise, FALSE.
func int Event_Has(var int event, var func function) {};

/// Adds an event handler function. The handler is called after running `Event_Execute`.
///
/// @param event Handle returned from `Event_Create`
/// @param function Function to be added
func void Event_Add(var int event, var func function) {};

/// `Event_Add` but checks if the handler function is already added to prevent duplicates.
///
/// @param event Handle returned from `Event_Create`
/// @param function Function to be added
func void Event_AddOnce(var int event, var func function) {};

/// Removes the event handler `function` from the event.
///
/// @param event Handle returned from `Event_Create`
/// @param function Function to be removed
func void Event_Remove(var int event, var func function) {};

/// Core of the package. Calls all functions registered via `Event_Add` and `Event_AddOnce`.
///
/// @param event Handle returned from `Event_Create`
/// @param data Int parameter passed to all executed functions
func void Event_Execute(var int event, var int data) {};

/// Creates a new event and returns a pointer to it.
///
/// @return The function returns a new PermMem pointer to an event.
func int EventPtr_Create() {};

/// Alias to PermMem `free`. Cleans up the pointer.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
func void EventPtr_Delete(var int eventPtr) {};

/// Checks whether the event is "empty," i.e., nothing will happen after its execution.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @return The function returns TRUE if empty; otherwise, FALSE.
func int EventPtr_Empty(var int eventPtr) {};

/// Checks if `function` is added to an event.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param function Checked function
/// @return The function returns TRUE if the function is added; otherwise, FALSE.
func int EventPtr_Has(var int eventPtr, var func function) {};

/// `EventPtr_Has` but with function ID instead of a pointer. Used mainly internally.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param id ID of the checked function
/// @return The function returns TRUE if the function is added; otherwise, FALSE.
func int EventPtr_HasI(var int eventPtr, var int id) {};

/// Adds an event handler function. The handler is called after running `EventPtr_Execute`.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param function Function to be added
func void EventPtr_Add(var int eventPtr, var func function) {};

/// `EventPtr_Add` but checks if the handler function is already added to prevent duplicates.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param function Function to be added
func void EventPtr_AddOnce(var int eventPtr, var func function) {};

/// `EventPtr_AddI` but checks if the handler function is already added to prevent duplicates.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param id ID of function to be added
func void EventPtr_AddOnceI(var int eventPtr, var int id) {};

/// Removes a function from the event's call list.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param function Function to be removed
func void EventPtr_Remove(var int eventPtr, var func function) {};

/// `EventPtr_RemoveI` but with function ID instead of a pointer. Used mainly internally.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param id ID of function to be removed
func void EventPtr_RemoveI(var int eventPtr, var int id) {};

/// Core of the package. Calls all functions registered via `EventPtr_Add` and `EventPtr_AddOnce`.
///
/// @param eventPtr Pointer returned from `EventPtr_Create`
/// @param data Int parameter passed to all executed functions
func void EventPtr_Execute(var int eventPtr, var int data) {};

// =========================================================
//
//  FrameFunctions
//
// =========================================================

/// Adds the Daedalus function FF_Apply to the running FrameFunctions list. FF_Apply is called each frame.
///
/// @param function Name of the function
func void FF_Apply(var func function) {};

/// Adds the Daedalus function FF_ApplyGT to the running FrameFunctions list. FF_ApplyGT is called every frame except when the game is paused.
///
/// @param function Name of the function
func void FF_ApplyGT(var func function) {};

/// Adds the Daedalus function FF_ApplyData to the running FrameFunctions list. The integer parameter data is passed to the function FF_ApplyData.
///
/// @param function Name of the function.
/// @param data Value passed to the function as a parameter
func void FF_ApplyData(var func function, var int data) {};

/// Adds the Daedalus function FF_ApplyExt to the running FrameFunctions list. The function FF_ApplyExt is called every delay milliseconds, and it runs only cycles number of times.
///
/// @param function Name of the function
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
func void FF_ApplyExt(var func function, var int delay, var int cycles) {};

/// Adds the Daedalus function FF_ApplyExtGT to the running FrameFunctions list. The function FF_ApplyExtGT is called every delay milliseconds, and it runs only cycles number of times. Gets called only when the game is not paused.
///
/// @param function Name of the function
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
func void FF_ApplyExtGT(var func function, var int delay, var int cycles) {};

/// Adds the Daedalus function FF_ApplyExtData to the running FrameFunctions list. The function FF_ApplyExtData is called every delay milliseconds, and it runs only cycles number of times. The integer parameter data is passed to the function FF_ApplyExtData.
///
/// @param function Name of the function.
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
/// @param data Value passed to the function as a parameter
func void FF_ApplyExtData(var func function, var int delay, var int cycles, var int data) {};

/// Adds the Daedalus function FF_ApplyExtDataGT to the running FrameFunctions list. The function FF_ApplyExtDataGT is called every delay milliseconds, and it runs only cycles number of times. The integer parameter data is passed to the function FF_ApplyExtDataGT. Gets called only when the game is not paused.
///
/// @param function Name of the function.
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
/// @param data Value passed to the function as a parameter
func void FF_ApplyExtDataGT(var func function, var int delay, var int cycles, var int data) {};

/// Alias to FF_Apply, which only adds the function once, even after multiple calls.
///
/// @param function Name of the function
func void FF_ApplyOnce(var func function) {};

/// Alias to FF_ApplyGT, which only adds the function once, even after multiple calls. Loop doesn't run if the game is paused.
///
/// @param function Name of the function.
func void FF_ApplyOnceGT(var func function) {};

/// Alias to FF_ApplyData, which only adds the function with the specified parameter once, even after multiple calls.
///
/// @param function Name of the function.
/// @param data Value passed to the function as a parameter
func void FF_ApplyOnceData(var func function, var int data) {};

/// Alias to FF_ApplyExt, which adds the function only once, after repeated calls.
///
/// @param function Name of the function
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
func void FF_ApplyOnceExt(var func function, var int delay, var int cycles) {};

/// Alias to FF_ApplyExtGT, which adds the function only once after repeated calls. Loop doesn't run if the game is paused.
///
/// @param function Name of the function
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
func void FF_ApplyOnceExtGT(var func function, var int delay, var int cycles) {};

/// Alias to FF_ApplyExtData, which adds the function with the specified parameter only once, after repeated calls.
///
/// @param function Name of the function
/// @param delay Delay between calls in milliseconds (0 = every frame)
/// @param cycles How many times should the function be called (-1 = endless)
/// @param data Value passed to the function as a parameter
func void FF_ApplyOnceExtData(var func function, var int delay, var int cycles, var int data) {};

/// Checks whether the function is active.
///
/// @param function Name of the function
/// @return The function returns TRUE if the function is active; otherwise, FALSE.
func int FF_Active(var func function) {};

/// Checks whether the function with the specified data is active.
///
/// @param function Name of the function
/// @param data Value previously passed to the function
/// @return The function returns TRUE if the function is active; otherwise, FALSE.
func int FF_ActiveData(var func function, var int data) {};

/// Stops a specific FrameFunction.
///
/// @param function Name of the stopped function
func void FF_Remove(var func function) {};

/// Stops all instances of a specific FrameFunction.
///
/// @param function Name of the stopped function
func void FF_RemoveAll(var func function) {};

/// Stops a specific FrameFunction, with the specified value (see FF_ApplyExtData).
///
/// @param function Name of the stopped function
/// @param data Value previously passed to the function as a parameter
func void FF_RemoveData(var func function, var int data) {};

// =========================================================
//
//  Hashtables
//
// =========================================================

/// Generates a hashtable of the specified size.
///
/// @param size Size of the hashtable to be created
/// @return A handle to the created hashtable.
func int HT_CreateSized(var int size) {};

/// Generates a standard size hashtable.
///
/// @return A handle to the created hashtable.
func int HT_Create() {};

/// Inserts a value into the Hashtable.
///
/// @param handle Handle of a hashtable
/// @param val The value to be inserted
/// @param key The key associated with the value
func void HT_Insert(var int handle, var int val, var int key) {};

/// Changes the size of the hashtable (usually not necessary as it happens automatically).
///
/// @param handle Handle of a hashtable
/// @param size The new size of the hashtable
func void HT_Resize(var int handle, var int size) {};

/// Reads a value from the hashtable.
///
/// @param handle Handle of a hashtable
/// @param key The key whose value is to be read
/// @return The value associated with the key.
func int HT_Get(var int handle, var int key) {};

/// Checks if the key already exists in the hashtable.
///
/// @param handle Handle of a hashtable
/// @param key The key to be checked
/// @return TRUE if the key exists, FALSE otherwise.
func int HT_Has(var int handle, var int key) {};

/// Removes a key from the hashtable.
///
/// @param handle Handle of a hashtable
/// @param key The key to be removed
func void HT_Remove(var int handle, var int key) {};

/// Changes the value of a key already existing in the hashtable.
///
/// @param handle Handle of a hashtable
/// @param val The new value
/// @param key The key whose value is to be changed
func void HT_Change(var int handle, var int val, var int key) {};

/// Inserts a value into the Hashtable, or changes the value if the key already exists in the hashtable.
///
/// @param handle Handle of a hashtable
/// @param val The new value
/// @param key The key whose value is to be changed or associated with the value.
func void HT_InsertOrChange(var int handle, var int val, var int key) {};

/// Returns the number of entries in a hashtable.
///
/// @param handle Handle of a hashtable
/// @return The number of entries in the hashtable.
func int HT_GetNumber(var int handle) {};

/// Performs a function for each value pair in the hashtable.
///
/// @param handle Handle of a hashtable
/// @param fnc A function with signature void (int key, int val)
func void HT_ForEach(var int handle, var func fnc) {};

/// Deletes the hashtable.
///
/// @param handle The handle of the hashtable to be deleted
func void HT_Destroy(var int handle) {};

// =========================================================
//
//  HookDaedalus
//
// =========================================================

/// Hooks the function.
///
/// @param hooked Hooked function
/// @param hook Hook function
func void HookDaedalusFunc(var func hooked, var func hook) {};

/// Alias to the HookDaedalusFunc function.
///
/// @param hooked Hooked function
/// @param hook Hook function
func void HookDaedalusFuncF(var func hooked, var func hook) {};

/// Hooks a function by its ID.
///
/// @param hookedID ID of hooked function
/// @param hookID ID of hook function
func void HookDaedalusFuncI(var int hookedID, var int hookID) {};

/// Hooks a function by its name.
///
/// @param hookedName Name of hooked function
/// @param hookName Name of hook function
func void HookDaedalusFuncS(var string hookedName, var string hookName) {};

/// Checks whether a function is already hooking another.
///
/// @param funcID Symbol index of a hook function
/// @return TRUE if the function is already hooking another, FALSE otherwise.
func int IsHookD(var int funcID) {};

/// Continues the program run with the original function.
func void ContinueCall() {};

/// Passes an integer as an argument to the original function. Must be called before ContinueCall.
///
/// @param i Integer argument to forward
func void PassArgumentI(var int i) {};

/// Passes a string as an argument to the original function. Must be called before ContinueCall.
///
/// @param s String argument to forward
func void PassArgumentS(var string s) {};

/// Passes an instance as an argument to the original function. Must be called before ContinueCall.
///
/// @param n Instance argument to forward
func void PassArgumentN(var instance n) {};

// =========================================================
//
//  HookEngine
//
// =========================================================

/// Attaches a function to an engine function address.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param function Name of Daedalus function to be called.
func void HookEngine(var int address, var int oldInstr, var string function) {};

/// Alias to the HookEngine function.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param function Name of Daedalus function to be called.
func void HookEngineS(var int address, var int oldInstr, var string function) {};

/// Alias to HookEngine with funcID.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param funcID ID of Daedalus function to be called.
func void HookEngineI(var int address, var int oldInstr, var int funcID) {};

/// Alias to HookEngine with func parameter.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param function Daedalus function to be called.
func void HookEngineF(var int address, var int oldInstr, var func function) {};

/// Checks if a hook is already present at a given address.
///
/// @param address Address of an engine function.
/// @return TRUE if the hook already exists at the address, FALSE otherwise.
func var int IsHooked(var int address) {};

/// Checks if a hook with a certain function is already present at an address.
///
/// @param address Address of an engine function.
/// @param function Name of a function.
/// @return TRUE if the hook already exists at the address, FALSE otherwise.
func var int IsHook(var int address, var string function) {};

/// Alias to IsHook with funcID as parameter.
///
/// @param address Address of an engine function.
/// @param funcID ID of a function.
/// @return TRUE if the hook already exists at the address, FALSE otherwise.
func var int IsHookI(var int address, var int funcID) {};

/// Alias to IsHook with function as parameter.
///
/// @param address Address of an engine function.
/// @param function Daedalus function.
/// @return TRUE if the hook already exists at the address, FALSE otherwise.
func var int IsHookF(var int address, var func function) {};

/// Removes a function from a hook so that it is no longer called.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param function Name of Daedalus function that should no longer be called.
func void RemoveHook(var int address, var int oldInstr, var string function) {};

/// Alias to RemoveHook with funcID.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param funcID ID of Daedalus function that should no longer be called.
func void RemoveHookI(var int address, var int oldInstr, var int funcID) {};

/// Alias for RemoveHook with func parameter.
///
/// @param address Address of an engine function to which the function should be attached.
/// @param oldInstr The length in bytes of the instruction to be found at `address`, at least 5 bytes. Can be seen in IDA.
/// @param function Daedalus function that should no longer be called.
func void RemoveHookF(var int address, var int oldInstr, var func function) {};

/// Replaces an engine function with a Daedalus function.
///
/// @param address Address of the engine function to be replaced.
/// @param thiscall_numparams Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
/// @param replaceFunc Name of a Daedalus function to be called instead.
func void ReplaceEngineFunc(var int address, var int thiscall_numparams, var string replaceFunc) {};

/// Alias to ReplaceEngineFunc with funcID.
///
/// @param address Address of the engine function to be replaced.
/// @param thiscall_numparams Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
/// @param funcID ID of a Daedalus function to be called instead.
func void ReplaceEngineFuncI(var int address, var int thiscall_numparams, var int funcID) {};

/// Alias to ReplaceEngineFunc with func parameter.
///
/// @param address Address of the engine function to be replaced.
/// @param thiscall_numparams Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
/// @param function Daedalus function to be called instead.
func void ReplaceEngineFuncF(var int address, var int thiscall_numparams, var func function) {};

/// Makes sure that an engine function is simply skipped. This is very delicate and will not always work so easily.
///
/// @param address Address of the engine function to be skipped.
/// @param thiscall_numparams Number of parameters passed to the engine function, if it is a stdcall or thiscall (otherwise 0).
func void DisableEngineFunc(var int address, var int thiscall_numparams) {};

/// Simple function to replace `return FALSE` in hook.
func void Hook_ReturnFalse() {};

/// Simple function to replace `return TRUE` in hook.
func void Hook_ReturnTrue() {};

// =========================================================
//
//  Int64
//
// =========================================================

/// Writes `lo` and `hi` in one place (dest). Makes Int64, `hi` has to be `-1` for negative 32bit `lo`.
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory.
/// @param hi High part of integer.
/// @param lo Low part of integer.
func void mk64(var int dest, var int hi, var int lo) {};

/// Negates the integer: `*dest <- -(*dest)`
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory.
func void neg64(var int dest) {};

/// Adds `src` to `dest`: `*dest <- *dest + *src`
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
/// @param src A pointer to an Int64 object. Will not change.
func void add64(var int dest, var int src) {};

/// Subtracts `src` from `dest`: `*dest <- *dest - *src`
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
/// @param src A pointer to an Int64 object. Will not change.
func void sub64(var int dest, var int src) {};

/// Multiplies `dest` by `src`: `*dest <- (*dest) * (*src)`
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
/// @param src A pointer to an Int64 object. Will not change.
func void mul64(var int dest, var int src) {};

/// Divides `dest` by `src`: `*dest <- *dest / *src`
///
/// @param dest A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
/// @param src A pointer to an Int64 object. Will not change.
func void div64(var int dest, var int src) {};

// =========================================================
//
//  Interface
//
// =========================================================

/// Better alternative for MEM_GetSysTime() from Ikarus.
///
/// @return The function returns elapsed time since game (system) startup.
func int sysGetTime() {};

/// Generates a full zColor.
///
/// @param r Red channel value (0..255)
/// @param g Green channel value (0..255)
/// @param b Blue channel value (0..255)
/// @param a Alpha (0..255, 0 = invisible)
///
/// @return The function returns a zColor object.
func int RGBA(var int r, var int g, var int b, var int a) {};

/// Overrides the alpha value of a given zColor.
///
/// @param zCol zColor to modify
/// @param a New alpha value
///
/// @return The function returns a modified zColor object.
func int ChangeAlpha(var int zCol, var int a) {};

/// Returns the alpha value of a given zColor.
///
/// @param zCol zColor to get alpha from
func int GetAlpha(var int zCol) {};

/// Creates a new zCViewText on the screen with PermMem that can be freely edited.
///
/// @param text The text of the zCViewText
/// @param font Font of text
///
/// @return The function returns a handle to zCViewText.
func int Print_CreateText(var string text, var string font) {};

/// Print_CreateText but returns a pointer to zCViewText instead of a handle.
///
/// @param text The text of the zCViewText
/// @param font Font of text
///
/// @return The function returns a pointer to zCViewText.
func int Print_CreateTextPtr(var string text, var string font) {};

/// Print_CreateTextPtr but with an additional parameter to choose the color of text.
///
/// @param text The text of the zCViewText
/// @param font Font of text
/// @param color zColor, e.g., generated with RGBA function
///
/// @return The function returns a pointer to zCViewText.
func int Print_CreateTextPtrColored(var string text, var string font, var int color) {};

/// Returns zCViewText instance from handle.
///
/// @param hndl Handle to zCViewText
func zCViewText Print_GetText(var int hndl) {};

/// Returns zCViewText pointer from handle.
///
/// @param hndl Handle to zCViewText
func int Print_GetTextPtr(var int hndl) {};

/// Removes a zCViewText from the screen.
///
/// @param hndl Handle to zCViewText (from Print_CreateText or Print_Ext)
func void Print_DeleteText(var int hndl) {};

/// Changes the alpha value of a given zCViewText.
///
/// @param hndl Handle to zCViewText
/// @param a New alpha value
func void Print_SetAlpha(var int hndl, var int a) {};

/// Print_SetAlpha but with a pointer to zCViewText instead of a handle.
///
/// @param ptr Pointer to zCViewText
/// @param a New alpha value
func void PrintPtr_SetAlpha(var int ptr, var int a) {};

/// Writes the current resolution to the Print_Screen array and the current aspect ratio to Print_Ratio variable.
func void Print_GetScreenSize() {};

/// Converts pixel position to a virtual position.
///
/// @param pxl Pixel position to convert
/// @param dim PS_X or PS_Y (see Print_Screen)
///
/// @return The function returns a virtual position of a given pixel position.
func int Print_ToVirtual(var int pxl, var int dim) {};

/// Print_ToVirtualF but returns Ikarus float value instead of an integer.
///
/// @param pxl Pixel position to convert
/// @param dim PS_X or PS_Y (see Print_Screen)
///
/// @return The function returns a virtual position of a given pixel position as an Ikarus float.
func int Print_ToVirtualF(var int pxl, var int dim) {};

/// Converts virtual position to a pixel position.
///
/// @param vrt Virtual position to convert
/// @param dim PS_X or PS_Y (see Print_Screen)
///
/// @return The function returns a pixel position of a given virtual position.
func int Print_ToPixel(var int vrt, var int dim) {};

/// Print_ToPixelF but returns Ikarus float value instead of an integer.
///
/// @param vrt Virtual position to convert
/// @param dim PS_X or PS_Y (see Print_Screen)
///
/// @return The function returns a pixel position of a given virtual position as an Ikarus float.
func int Print_ToPixelF(var int vrt, var int dim) {};

/// Gets the size in the specified dimension ratioed by the screen.
///
/// @param size Size to convert
/// @param dim PS_X or PS_Y (see Print_Screen)
///
/// @return The function returns size correctly calculated to the ratio.
func int Print_ToRatio(var int size, var int dim) {};

/// Converts angle in degrees to radians.
///
/// @param angle Angle in degrees
///
/// @return The function returns a calculated angle in radians.
func int Print_ToRadian(var int angle) {};

/// Converts angle in radians to degrees.
///
/// @param angle Angle in radians
///
/// @return The function returns a calculated angle in degrees.
func int Print_ToDegree(var int angle) {};

/// Returns a pointer to a zCFont by its name.
///
/// @param font Name of font
func int Print_GetFontPtr(var string font) {};

/// Returns a name of a zCFont from its pointer.
///
/// @param fontPtr Pointer to font
func string Print_GetFontName(var int fontPtr) {};

/// Returns the width of a string in pixels.
///
/// @param s Measured string
/// @param font Name of font
///
/// @return The function returns the width of the string in pixels.
func int Print_GetStringWidth(var string s, var string font) {};

/// Print_GetStringWidthPtr but with a zCFont pointer instead of a name.
///
/// @param s Measured string
/// @param font zCFont pointer
///
/// @return The function returns the width of the string in pixels.
func int Print_GetStringWidthPtr(var string s, var int font) {};

/// Returns the height of a string in pixels.
///
/// @param font Name of font
///
/// @return The function returns the height of a string in pixels.
func int Print_GetFontHeight(var string font) {};

/// Like the external PrintScreen, writes a text on the screen, but with more options.
///
/// @param x X coordinate on the screen (virtual)
/// @param y Y coordinate on the screen (virtual)
/// @param text Displayed text
/// @param font Name of font
/// @param color zColor, e.g., generated with RGBA function
/// @param time Display time in milliseconds (-1 = permanent)
///
/// @return If time == -1, a valid handle is returned. If time != -1, the print is only volatile and no handle is returned.
func int Print_Ext(var int x, var int y, var string text, var string font, var int color, var int time) {};

/// Print_ExtPxl but with pixel coordinates instead of virtual.
///
/// @param x X coordinate on the screen (pixel)
/// @param y Y coordinate on the screen (pixel)
/// @param text Displayed text
/// @param font Name of font
/// @param color zColor, e.g., generated with RGBA function
/// @param time Display time in milliseconds (-1 = permanent)
///
/// @return If time == -1, a valid handle is returned. If time != -1, the print is only volatile and no handle is returned.
func int Print_ExtPxl(var int x, var int y, var string text, var string font, var int color, var int time) {};

/// Returns the longest line from text as a string, using the default line separator tilde ~.
///
/// @param text Measured text
/// @param font Name of font
///
/// @return The function returns the longest line from text as a string.
func string Print_LongestLine(var string text, var string font) {};

/// Returns the longest line from text as a string, but you specify a new line separator.
///
/// @param text Measured text
/// @param font Name of font
/// @param separator New line separator
///
/// @return The function returns the longest line from text as a string.
func string Print_LongestLineExt(var string text, var string font, var string separator) {};

/// Returns the longest line width in pixels, using the default line separator tilde ~.
///
/// @param text Measured text
/// @param font Name of font
///
/// @return The function returns the longest line width in pixels.
func int Print_LongestLineLength(var string text, var string font) {};

/// Returns the longest line width in pixels, but allows you to specify a new line separator.
///
/// @param text Measured text
/// @param font Name of font
/// @param separator New line separator
///
/// @return The function returns the longest line width in pixels.
func int Print_LongestLineLengthExt(var string text, var string font, var string separator) {};

/// Creates a text field (view with text) using virtual coordinates.
///
/// @param x X coordinate (virtual)
/// @param y Y coordinate (virtual)
/// @param text Text to be printed
/// @param font Name of font
/// @param height A specific line height
///
/// @return The function returns a text field pointer. Look at the Print_TextField return value to see an example.
func int Print_TextField(var int x, var int y, var string text, var string font, var int height) {};

/// Print_TextFieldPxl but with pixel coordinates.
///
/// @param x X coordinate (pixel)
/// @param y Y coordinate (pixel)
/// @param text Text to be printed
/// @param font Name of font
///
/// @return The function returns a text field pointer. Look at the Print_TextField return value to see an example.
func int Print_TextFieldPxl(var int x, var int y, var string text, var string font) {};

/// Print_TextFieldColored but you specify the color of the text.
///
/// @param x X coordinate (virtual)
/// @param y Y coordinate (virtual)
/// @param text Text to be printed
/// @param font Name of font
/// @param height A specific line height
/// @param color zColor, e.g., generated with RGBA function
///
/// @return The function returns a text field pointer. Look at the Print_TextField return value to see an example.
func int Print_TextFieldColored(var int x, var int y, var string text, var string font, var int height, var int color) {};

/// Same function as the external Print, but with smooth animations. The effect can be changed as desired with the user constants.
///
/// @param txt Printed text
func void PrintS(var string txt) {};

/// PrintS but with an additional parameter to choose the color of the text.
///
/// @param txt Printed text
/// @param color zColor, e.g., generated with RGBA function
func void PrintS_Ext(var string txt, var int color) {};

/// Version of PrintS that enqueues in the given NPC's AI queue.
///
/// @param slf NPC to whose AI queue the function is enqueued
/// @param txt Printed text
func void AI_PrintS(var c_npc slf, var string txt) {};

/// Version of PrintS_Ext that enqueues in the given NPC's AI queue.
///
/// @param slf NPC to whose AI queue the function is enqueued
/// @param txt Printed text
/// @param color zColor, e.g., generated with RGBA function
func void AI_PrintS_Ext(var c_npc slf, var string txt, var int color) {};

// =========================================================
//
//  ItemHelper
//
// =========================================================

/// Gets an oCItem pointer from a C_ITEM instance.
///
/// @param instance C_ITEM instance to get the pointer of
///
/// @return The function returns an oCItem pointer of the C_ITEM instance.
func int ITM_GetPtr(var int instance) {};

// =========================================================
//
//  List
//
// =========================================================

/// Creates a new list with an initial value.
///
/// @param data The value of the first list element.
///
/// @return The function returns a pointer to the created list.
func int List_Create(var int data) {};

/// Appends a value to the end of the list.
///
/// @param list The list to which the value is appended.
/// @param data The value to be appended.
func void List_Add(var int list, var int data) {};

/// Adds a value before the first element of the list.
///
/// @param list The list to which the value is added.
/// @param data The value to be added.
func void List_AddFront(var int list, var int data) {};

/// Inserts a value between two list elements.
///
/// @param list The list in which the value is inserted.
/// @param offset The number of the list element after which the value is inserted.
/// @param data The value to be inserted.
func void List_AddOffset(var int list, var int offset, var int data) {};

/// Sets a list element to a specific value.
///
/// @param node Pointer to the list element.
/// @param data The value to be written into the list element.
func void List_Set(var int node, var int data) {};

/// Retrieves the value of a list element.
///
/// @param list The list from which the element is retrieved.
/// @param nr The number of the list element.
///
/// @return The function returns the value of the specified list element.
func int List_Get(var int list, var int nr) {};

/// Returns a pointer to a list element.
///
/// @param list The list from which the element is retrieved.
/// @param nr The number of a list element.
///
/// @return The function returns a pointer to the specified list element.
func int List_Node(var int list, var int nr) {};

/// Returns the length of the list (the number of all elements).
///
/// @param list The list for which the length is calculated.
///
/// @return The function returns the number of elements in the list.
func int List_Length(var int list) {};

/// Checks if the list has the specified length.
///
/// @param list The list to check.
/// @param length The desired length.
///
/// @return The function returns a boolean value indicating whether the list has the specified length or not.
func int List_HasLength(var int list, var int length) {};

/// Returns the last list element of the list.
///
/// @param list The list from which the last element is retrieved.
///
/// @return The function returns a pointer to the last list element.
func int List_End(var int list) {};

/// Concatenates two lists.
///
/// @param list The first list.
/// @param list2 The second list. Its beginning is appended to the end of the first list.
func void List_Concat(var int list, var int list2) {};

/// Returns the last list element with a specific value.
///
/// @param list The list in which to search for the value.
/// @param data The value to search for.
///
/// @return The function returns the number of the last list element with the value data.
func int List_Contains(var int list, var int data) {};

/// Calls a function for each list element, passing a pointer to the list element as a parameter.
///
/// @param list The list to iterate over.
/// @param function Name of a function to be called for each list element (void handler(var int node)).
func void List_For(var int list, var string function) {};

/// Similar to List_For, but with a function parameter instead of a string.
///
/// @param list The list to iterate over.
/// @param function The function to be called for each list element (void handler(var int node)).
func void ListForF(var int list, var func function) {};

/// Similar to List_For, but with a function parameter instead of a string.
///
/// @param list The list to iterate over.
/// @param funcID ID of a function to be called for each list element (void handler(var int node)).
func void List_ForI(var int list, var int funcID) {};

/// Deletes a list element. All subsequent elements shift position.
///
/// @param list The list from which an element is deleted.
/// @param nr The number of the list element to be deleted.
func void List_Delete(var int list, var int nr) {};

/// Destroys the entire list.
///
/// @param list The list to be destroyed.
func void List_Destroy(var int list) {};

/// Returns a pointer to a memory area containing all values of the list.
///
/// @param list The list to be converted to an array.
///
/// @return The function returns a memory area containing all the values of the list.
func int List_ToArray(var int list) {};

/// Moves the specified list node down by one position in the list.
///
/// @param list The list in which the node is located.
/// @param node The node to be moved down.
func void List_MoveDown(var int list, var int node) {};

/// Moves the specified list node up by one position in the list.
///
/// @param list The list in which the node is located.
/// @param node The node to be moved up.
func void List_MoveUp(var int list, var int node) {};

/// Inserts a value into a sorted list while preserving the sort order.
///
/// @param list The list to insert the value into.
/// @param data The value to be inserted.
/// @param compare A comparison function used to determine the sort order.
func void List_InsertSorted(var int list, var int data, var func compare) {};

/// Creates a new list with an initial value (for zCListSort).
///
/// @param data The value of the first list element.
///
/// @return The function returns a pointer to the created list.
func int List_CreateS(var int data) {};

/// Appends a value to the end of the list (for zCListSort).
///
/// @param list The list to which the value is appended.
/// @param data The value to be appended.
func void List_AddS(var int list, var int data) {};

/// Adds a value before the first element of the list (for zCListSort).
///
/// @param list The list to which the value is added.
/// @param data The value to be added.
func void List_AddFrontS(var int list, var int data) {};

/// Inserts a value between two list elements (for zCListSort).
///
/// @param list The list in which the value is inserted.
/// @param offset The number of the list element after which the value is inserted.
/// @param data The value to be inserted.
func void List_AddOffsetS(var int list, var int offset, var int data) {};

/// Sets a list element to a specific value (for zCListSort).
///
/// @param node Pointer to the list element.
/// @param data The value to be written into the list element.
func void List_SetS(var int node, var int data) {};

/// Retrieves the value of a list element (for zCListSort).
///
/// @param list The list from which the element is retrieved.
/// @param nr The number of the list element.
///
/// @return The function returns the value of the specified list element.
func int List_GetS(var int list, var int nr) {};

/// Returns a pointer to a list element (for zCListSort).
///
/// @param list The list from which the element is retrieved.
/// @param nr The number of a list element.
///
/// @return The function returns a pointer to the specified list element.
func int List_NodeS(var int list, var int nr) {};

/// Returns the length of the list (the number of all elements) (for zCListSort).
///
/// @param list The list for which the length is calculated.
///
/// @return The function returns the number of elements in the list.
func int List_LengthS(var int list) {};

/// Checks if the list has the specified length (for zCListSort).
///
/// @param list The list to check.
/// @param length The desired length.
///
/// @return The function returns a boolean value indicating whether the list has the specified length or not.
func int List_HasLengthS(var int list, var int length) {};

/// Returns the last list element of the list (for zCListSort).
///
/// @param list The list from which the last element is retrieved.
///
/// @return The function returns a pointer to the last list element.
func int List_EndS(var int list) {};

/// Concatenates two lists (for zCListSort).
///
/// @param list The first list.
/// @param list2 The second list. Its beginning is appended to the end of the first list.
func void List_ConcatS(var int list, var int list2) {};

/// Returns the last list element with a specific value (for zCListSort).
///
/// @param list The list in which to search for the value.
/// @param data The value to search for.
///
/// @return The function returns the number of the last list element with the value data.
func int List_ContainsS(var int list, var int data) {};

/// Calls a function for each list element, passing a pointer to the list element as a parameter (for zCListSort).
///
/// @param list The list to iterate over.
/// @param function Name of a function to be called for each list element (void handler(var int node)).
func void List_ForS(var int list, var string function) {};

/// Similar to List_For, but with a function parameter instead of a string (for zCListSort).
///
/// @param list The list to iterate over.
/// @param function The function to be called for each list element (void handler(var int node)).
func void ListForFS(var int list, var func function) {};

/// Similar to List_For, but with a function parameter instead of a string (for zCListSort).
///
/// @param list The list to iterate over.
/// @param funcID ID of a function to be called for each list element (void handler(var int node)).
func void List_ForIS(var int list, var int funcID) {};

/// Deletes a list element. All subsequent elements shift position (for zCListSort).
///
/// @param list The list from which an element is deleted.
/// @param nr The number of the list element to be deleted.
func void List_DeleteS(var int list, var int nr) {};

/// Destroys the entire list (for zCListSort).
///
/// @param list The list to be destroyed.
func void List_DestroyS(var int list) {};

/// Returns a pointer to a memory area containing all values of the list (for zCListSort).
///
/// @param list The list to be converted to an array.
///
/// @return The function returns a memory area containing all the values of the list.
func int List_ToArrayS(var int list) {};

/// Moves the specified list node down by one position in the list (for zCListSort).
///
/// @param list The list in which the node is located.
/// @param node The node to be moved down.
func void List_MoveDownS(var int list, var int node) {};

/// Moves the specified list node up by one position in the list (for zCListSort).
///
/// @param list The list in which the node is located.
/// @param node The node to be moved up.
func void List_MoveUpS(var int list, var int node) {};

/// Inserts a value into a sorted list while preserving the sort order (for zCListSort).
///
/// @param list The list to insert the value into.
/// @param data The value to be inserted.
/// @param compare A comparison function used to determine the sort order.
func void List_InsertSortedS(var int list, var int data, var func compare) {};

/// Compares two integer values using a specified comparison function.
///
/// @param data1 The first integer value.
/// @param data2 The second integer value.
/// @param compare One of the comparison functions to use for the comparison.
///
/// @return The return value of the specified comparison function.
func int List_Compare(var int data1, var int data2, var func compare) {};

/// Compares two integer values in ascending order.
///
/// @param data1 The first integer value.
/// @param data2 The second integer value.
///
/// @return The function returns TRUE if data1 is greater than data2, FALSE otherwise.
func int List_CmpAscending(var int data1, var int data2) {};

/// Compares two integer values in descending order.
///
/// @param data1 The first integer value.
/// @param data2 The second integer value.
///
/// @return The function returns TRUE if data1 is less than data2, FALSE otherwise.
func int List_CmpDescending(var int data1, var int data2) {};

/// Compares two unsigned integer values in ascending order.
///
/// @param data1 The first unsigned integer value.
/// @param data2 The second unsigned integer value.
///
/// @return The function returns TRUE if data1 is greater than data2, FALSE otherwise.
func int List_CmpAscendingUnsigned(var int data1, var int data2) {};

/// Compares two unsigned integer values in descending order.
///
/// @param data1 The first unsigned integer value.
/// @param data2 The second unsigned integer value.
///
/// @return The function returns TRUE if data1 is less than data2, FALSE otherwise.
func int List_CmpDescendingUnsigned(var int data1, var int data2) {};

// =========================================================
//
//  Locals
//
// =========================================================

/// Activates the 'Locals' feature in a function.
///
/// This function is used to enable the 'Locals' feature in your code. It should be added at the
/// beginning of the function that should receive "real" local variables.
func void locals() {};

/// Create a block of code to be executed when a function is exited.
///
/// The 'Final' function is used to create a block of code that is executed after the function it
/// is defined in is exited, regardless of when or where the function is exited. It can be used to
/// emulate Java's 'final' clause.
///
/// @return 1 if the 'Final' block is executed, 0 otherwise.
func int Final() {};

// =========================================================
//
//  Misc
//
// =========================================================

/// Calculates the arcus tangent of an angle between the origin and a point (x, y).
///
/// @param x The X-coordinate.
/// @param y The Y-coordinate.
///
/// @return The arcus tangent in radians as an Ikarus float.
func float atan2f(var int x, var int y) {};

/// Calculates the sine of an angle given in radians.
///
/// @param angle The angle in radians as an Ikarus float.
///
/// @return The sine of the angle.
func float sin(var float angle) {};

/// Calculates the cosine of an angle given in radians.
///
/// @param angle The angle in radians as an Ikarus float.
///
/// @return The cosine of the angle.
func float cos(var float angle) {};

/// Calculates the tangent of an angle given in radians.
///
/// @param angle The angle in radians as an Ikarus float.
///
/// @return The tangent of the angle.
func float tan(var float angle) {};

/// Calculates the arcus sine.
///
/// @param sine The sine of an angle as an Ikarus float.
///
/// @return The arcus sine of the angle.
func float asin(var float sine) {};

/// Calculates the arcus cosine.
///
/// @param cosine The cosine of an angle as an Ikarus float.
///
/// @return The arcus cosine of the angle.
func float acos(var float cosine) {};

/// Calculates the distance between two points on a two-dimensional plane.
///
/// @param x1 The X-coordinate of the first point.
/// @param x2 The X-coordinate of the second point.
/// @param y1 The Y-coordinate of the first point.
/// @param y2 The Y-coordinate of the second point.
///
/// @return The distance between the two points.
func int distance2D(var int x1, var int x2, var int y1, var int y2) {};

/// Calculates the distance between two points on a two-dimensional plane with Ikarus floats.
///
/// @param x1 The X-coordinate of the first point.
/// @param x2 The X-coordinate of the second point.
/// @param y1 The Y-coordinate of the first point.
/// @param y2 The Y-coordinate of the second point.
///
/// @return The distance between the two points as an Ikarus float.
func float distance2Df(var float x1, var float x2, var float y1, var float y2) {};

// =========================================================
//
//  PermMem
//
// =========================================================

/// Creates a handle to a new instance of `inst`.
///
/// @param inst A valid instance used as a "constructor".
///
/// @return A new, valid PermMem handle.
func int new(var int inst) {};

/// Similar to `new`, but here a pointer is returned directly and not a handle. Caution! Not managed by PermMem!
///
/// @param inst A valid instance used as a "constructor".
///
/// @return A pointer to the new instance.
func int create(var int inst) {};

/// "Wraps" a handle "around" a pointer so that the pointer can be used with any function that expects handles. Only conditionally managed by PermMem.
///
/// @param inst A valid instance determining the type of the handle.
/// @param ptr Pointer to wrap.
///
/// @return A handle with `ptr` as content.
func int wrap(var int inst, var int ptr) {};

/// Cleans the handle. After that, it is invalid.
///
/// @param hndl Valid PermMem handle.
func void clear(var int hndl) {};

/// Frees the handle. The reserved memory is not deleted; the handle becomes invalid.
///
/// @param hndl Valid PermMem handle.
func void release(var int hndl) {};

/// Cleans the handle just like `clear`, but the destructor is also called.
///
/// @param hndl Valid PermMem handle.
func void delete(var int hndl) {};

/// Cleans the handle just like `clear`, but the destructor is also called.
///
/// @param ptr The pointer to be cleaned.
/// @param inst Instance used in `create` function.
func void free(var int ptr, var int inst) {};

/// Returns the instance of the handle.
///
/// @param hndl Valid PermMem handle.
///
/// @return The instance of the handle.
func instance get(var int hndl) {};

/// Returns a pointer to the instance of the handle.
///
/// @param hndl Valid PermMem handle.
///
/// @return A pointer to the instance of the handle.
func int getPtr(var int hndl) {};

/// Sets the pointer of a handle.
///
/// @param hndl Valid PermMem handle.
/// @param ptr New pointer for the handle.
func void setPtr(var int hndl, var int ptr) {};

/// Returns the instance used to create the given handle in `new` function.
///
/// @param hndl Valid PermMem handle.
///
/// @return The instance used to create the handle in the `new` function.
func int getInst(var int hndl) {};

/// Returns the number of handles managed by PermMem.
///
/// @return The number of handles managed by PermMem.
func int numHandles() {};

/// Returns the size of the instance's class in bytes.
///
/// @param inst Any instance.
///
/// @return The size of the instance's class in bytes.
func int sizeof(var int inst) {};

/// Indicates whether the handle exists and is managed by PermMem.
///
/// @param hndl PermMem's handle.
///
/// @return TRUE if the handle is valid (managed by PermMem), FALSE otherwise.
func int Hlp_IsValidHandle(var int hndl) {};

/// Executes a function for each handle of an instance.
///
/// @param inst The function is called for this instance.
/// @param fnc The function is called. The signature is `function(int handle)`.
func void foreachHndl(var int inst, var func fnc) {};

/// Checks if PermMem has a handle of this instance.
///
/// @param inst Instance to be checked.
///
/// @return TRUE if PermMem has a handle of this instance, FALSE otherwise.
func int hasHndl(var int inst) {};

/// Function moved to PermMem from Ikarus. Reads string from the array at the `arrayAddress`.
///
/// @param arrayAddress Memory address of the array.
/// @param index Array offset (array index).
///
/// @return String from the array if the address is correct.
func string MEM_ReadStringArray(var int arrayAddress, var int index) {};

/// Checks if the specified field already exists in the archive (used with archiver/unarchiver).
///
/// @param name Name of the field.
///
/// @return TRUE if the field exists in the archive, FALSE otherwise.
func int PM_Exists(var string name) {};

/// Universal function to load integers, floats, class pointers, and int arrays.
///
/// @param name Name of the loaded field.
///
/// @return The data existing in the archive at the given field.
func int PM_Load(var string name) {};

/// Returns an integer stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The integer value stored in the archive.
func int PM_LoadInt(var string name) {};

/// Returns a daedalus float stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The daedalus float stored in the archive.
func int PM_LoadFloat(var string name) {};

/// Returns a string stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The string stored in the archive.
func string PM_LoadString(var string name) {};

/// Returns a function ID stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The function ID stored in the archive.
func int PM_LoadFuncID(var string name) {};

/// Returns a function offset stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The function offset stored in the archive.
func int PM_LoadFuncOffset(var string name) {};

/// Returns a function pointer stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The function pointer stored in the archive.
func int PM_LoadFuncPtr(var string name) {};

/// Returns a class pointer stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return The class pointer stored in the archive.
func int PM_LoadClassPtr(var string name) {};

/// Loads a pointer to the class from the archive to `destPtr`.
///
/// @param name Name of the loaded field.
/// @param destPtr Destination pointer, the address to where it will deserialize the saved data.
func void PM_LoadClass(var string name, var int destPtr) {};

/// Returns a pointer to array stored in the archive.
///
/// @param name Name of the loaded field.
///
/// @return A pointer to the array stored in the archive.
func int PM_LoadArray(var string name) {};

/// Loads a pointer to array from the archive to `destPtr`.
///
/// @param name Name of the loaded field.
/// @param destPtr Destination pointer, the address to where it will deserialize the saved data.
func void PM_LoadArrayToPtr(var string name, var int destPtr) {};

/// Universal function to load array or class pointer from the archive to `destPtr`.
///
/// @param name Name of the loaded field.
/// @param destPtr Destination pointer, the address to where it will deserialize the saved data.
func void PM_LoadToPtr(var string name, var int destPtr) {};

// =========================================================
//
//  Queue
//
// =========================================================

/// Creates a new queue and returns a handle to it.
///
/// @return A handle to a queue.
func int Q_Create() {};

/// Appends an integer to the back of the queue.
///
/// @param queue Handle of a queue.
/// @param value The value to be appended to the queue.
func void Q_Enqueue(var int queue, var int value) {};

/// Checks if the queue is empty.
///
/// @param queue Handle of a queue.
///
/// @return TRUE if the queue is empty, FALSE otherwise.
func int Q_IsEmpty(var int queue) {};

/// Removes the oldest value from the queue and returns it.
///
/// @param queue Handle of a queue.
///
/// @return The oldest value in the queue.
func int Q_Advance(var int queue) {};

/// Returns the oldest value in the queue without removing it.
///
/// @param queue Handle of a queue.
///
/// @return The oldest value in the queue.
func int Q_Peek(var int queue) {};

/// Function with the `funcID` is called with every element of the list as a parameter. The list element is passed to the function as a `zCList` pointer.
///
/// @param queue Handle of a queue.
/// @param funcID ID of function that is executed for all values in the queue (signature: `void (zCList*)`).
func void Q_For(var int queue, var int funcID) {};

/// Like `Q_For`, but with function as a parameter instead of a function ID.
///
/// @param queue Handle of a queue.
/// @param f This function is executed for all values in the queue (signature: `void (zCList*)`).
func void Q_ForF(var int queue, var func f) {};

/// Creates a new callback queue and returns a handle to it.
///
/// @return A handle to a callback queue.
func int CQ_Create() {};

/// Appends a function to the callback queue.
///
/// @param queue Handle of a callback queue.
/// @param function A function with no return value, expecting no parameter.
func void CQ_EnqueueNoData(var int queue, var func function) {};

/// Appends a function together with a value to the callback queue.
///
/// @param queue Handle of a callback queue.
/// @param function A function with no return value, expecting an integer as a parameter.
/// @param data When calling `function`, this value is passed as a parameter.
func void CQ_EnqueueData(var int queue, var func function, var int data) {};

/// Appends a function together with an optional value to the callback queue.
/// This function should not usually be used. Use `CQ_EnqueueData` and `CQ_EnqueueNoData` instead.
///
/// @param queue Handle of a callback queue.
/// @param funcID The function ID of a function to be appended to the callback queue.
/// @param data If hasData is not 0, this value is passed to the associated function.
/// @param hasData Must be 0 if the function does not expect an integer as a parameter, otherwise not 0.
func void CQ_Enqueue(var int queue, var int funcID, var int data, var int hasData) {};

/// Checks if no function is in the callback queue.
///
/// @param queue Handle of a callback queue.
///
/// @return TRUE if the callback queue is empty, FALSE otherwise.
func int CQ_IsEmpty(var int queue) {};

/// Executes the foremost function of the callback queue and removes it from the callback queue.
///
/// @param queue Handle of a callback queue.
func void CQ_Advance(var int queue) {};

/// Executes all functions contained in the callback queue.
///
/// @param queue Handle of a callback queue.
func void CQ_Exhaust(var int queue) {};

// =========================================================
//
//  Random
//
// =========================================================

/// Returns a random number.
///
/// @return A random number.
func int r_Next() {};

/// Returns a random number from 0 to `max`.
///
/// @param max Maximum value of the number.
///
/// @return A random number from 0 to `max`.
func int r_Max(var int max) {};

/// Returns a random number from `min` to `max`.
///
/// @param max Maximum value of the number.
/// @param min Minimum value of the number.
///
/// @return A random number from `min` to `max`.
func int r_MinMax(var int min, var int max) {};

/// Initializes the random number generator. Happens optionally in `LeGo_Init`.
///
/// @param seed The initializing value.
func void r_Init(var int seed) {};

/// Initializes the random number generator based on the current time.
func void r_DefaultInit() {};

// =========================================================
//
//  StringBuilder
//
// =========================================================

/// Creates and returns a new `StringBuilder`. At the same time, this new `StringBuilder` is set as active.
///
/// @return A pointer to a new `StringBuilder`.
func int SB_New() {};

/// Marks this `StringBuilder` as active. It can now be used with the functions.
///
/// @param sb Pointer to a `StringBuilder`, returned from `SB_New`.
func void SB_Use(var int sb) {};

/// Returns the active `StringBuilder`.
///
/// @return The active `StringBuilder` object - last set with `SB_Use` or just created with `SB_New`.
func int SB_Get() {};

/// If the size of the resulting string is already known, the buffer can be set manually. This is usually not necessary.
///
/// @param size Size in bytes. Warning! Only works if the `StringBuilder` has been newly created!
func void SB_InitBuffer(var int size) {};

/// Empties the current `StringBuilder`. It is not destroyed in the process, so it can be used again. If the object has a buffer allocated, the buffer is freed.
func void SB_Clear() {};

/// Releases the current stream of the `StringBuilder`. The `StringBuilder` is destroyed, and the stream can be obtained via `SB_GetStream`.
func void SB_Release() {};

/// Completely destroys the `StringBuilder`.
func void SB_Destroy() {};

/// Returns a copy of the stream as a string.
///
/// @return A copy of the active `StringBuilder` as a string. If the `StringBuilder` object doesn't have a buffer allocated, an empty string is returned.
func string SB_ToString() {};

/// Returns a copy of the stream in raw format.
///
/// @return A copy of the stream in raw format (`char[]`).
func int SB_ToStream() {};

/// Doesn't copy the stream but returns it as it is.
///
/// @return The stream as it is. `SB_Destroy` or `SB_Clear` destroy the returned pointer.
func int SB_GetStream() {};

/// Returns the current length of the stream. Similar to `STR_Len` from Ikarus.
///
/// @return The current length of the active `StringBuilder`.
func int SB_Length() {};

/// Sets the length of the stream. When increasing, zero bytes are appended.
///
/// @param length The new length of the stream.
func void SB_SetLength(var int length) {};

/// Appends a string to the active `StringBuilder`.
///
/// @param s The appended string.
func void SB(var string s) {};

/// Appends an integer in text form to the active `StringBuilder`.
///
/// @param i The appended integer.
func void SBi(var int i) {};

/// Appends a byte to the active `StringBuilder`. (e.g., 82 for 'R' - An ASCII table can be quickly found)
///
/// @param c The appended byte (ASCII table character).
func void SBc(var int c) {};

/// Appends a raw bytes array to the active `StringBuilder`.
///
/// @param ptr Pointer to the appended array.
/// @param len Length of an array.
func void SBraw(var int ptr, var int len) {};

/// Appends a Daedalus float in text form to the active `StringBuilder`.
///
/// @param x The appended Daedalus float value.
func void SBflt(var float x) {};

/// Appends an Ikarus float in text form to the active `StringBuilder`.
///
/// @param x The appended Ikarus float value.
func void SBf(var int x) {};

/// Appends a 4-byte raw data (interpreted as an integer `x`) to the active `StringBuilder`.
///
/// @param x The appended value.
func void SBw(var int x) {};

/// Makes escape sequences out of non-writable characters. For example, newline character '\n' becomes '\\n', tab character '\t' becomes '\\t', etc.
///
/// @param s0 The string to be added escape sequences.
///
/// @return A new string with escape sequences added for special characters.
func string STR_Escape(var string s0) {};

/// Counterpart to `STR_Escape`. Escape sequences like '\n', '\r' or '\t' are converted back.
///
/// @param s0 The string to be removed escape sequences.
///
/// @return A new string with escape sequences replaced by their corresponding characters.
func string STR_Unescape(var string s0) {};

/// Checks if the input string `str` starts with the specified prefix string.
///
/// @param str The string to be checked.
/// @param start The searched prefix.
///
/// @return `TRUE` if the string starts with the prefix, `FALSE` is returned otherwise.
func int STR_StartsWith(var string str, var string start) {};

/// Creates an array of all string symbols found in the parser's string table.
///
/// @return The created array.
func int BuildStringSymbolsArray() {};

/// Retrieves the symbol at the specified address from the string table.
///
/// @param address The address of the symbol.
///
/// @return A parser symbol at the given address.
func int GetStringSymbolByAddr(var int address) {};

// =========================================================
//
//  Talents
//
// =========================================================

/// Returns a unique ID specific for the provided NPC.
///
/// @param slf NPC to get ID.
///
/// @return The function returns the NPC's unique ID.
func int Npc_GetID(var C_NPC slf) {};

/// Finds the NPC pointer of an NPC with the given ID.
///
/// @param ID NPC ID.
///
/// @return The function returns the NPC pointer.
func int Npc_FindByID(var int ID) {};

/// Creates a talent into which you can later save a value for every NPC (just like `AI_Var`).
///
/// @return A value that can be later used as a talent ID.
func int TAL_CreateTalent() {};

/// Sets a new value to the specified talent.
///
/// @param npc Set the talent value for this NPC.
/// @param talent Talent ID.
/// @param value Value to be set.
func void TAL_SetValue(var C_NPC npc, var int talent, var int value) {};

/// Returns the value of a saved talent for the specified NPC.
///
/// @param npc Get the talent value from this NPC.
/// @param talent Talent ID.
///
/// @return The function returns the value of the saved talent for the specified NPC.
func int TAL_GetValue(var C_NPC npc, var int talent) {};

// =========================================================
//
//  Timer
//
// =========================================================

/// Returns the current playing time. If a new game is started, the time is 0. It is measured in milliseconds.
///
/// @return The function returns current playing time in milliseconds.
func int Timer() {};

/// Returns the current game time, but the timer is paused when the game is paused (in the menu or status screen).
///
/// @return The function returns current playing time in milliseconds, but without measuring time when the game is paused.
func int TimerGT() {};

/// Alias to the `Timer` function that returns the time as an Ikarus float value.
///
/// @return The function returns current playing time as an Ikarus float value.
func int TimerF() {};

/// Pauses the timer (and thus all FrameFunctions and running animations).
///
/// @param on Pause on/off.
func void Timer_SetPause(var int on) {};

/// The timer can automatically pause when the game is paused (status screen, main menu...).
///
/// @param on Automatic pause on/off.
func void Timer_SetPauseInMenu(var int on) {};

/// This can be used to query whether the timer is paused.
///
/// @return The function returns TRUE if the timer is paused, FALSE is returned otherwise.
func int Timer_IsPaused() {};

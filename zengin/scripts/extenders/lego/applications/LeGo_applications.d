// =========================================================
//
//  Anim8
//
// =========================================================

/// Creates a new Anim8 object that can be filled with commands.
///
/// @param initialValue The initial value to start animating from. Can be an integer, or an Ikarus float.
/// @param IsFloat If the initialValue is an Ikarus float, this parameter must be set to TRUE. If it is an integer, it must be set to FALSE.
/// @return The function returns handle of the Anim8 object.
func int Anim8_New(var int initialValue, var int IsFloat) {};

/// Creates a new Anim8 object with advanced options. Extends the Anim8_New function.
///
/// @param value The initial value to start animating from. Can be an integer, or an Ikarus float.
/// @param handler This function is called whenever the object is updated.
/// @param data Optional parameter to send an additional value to the handler function. If data == 0, it is ignored.
/// @param IsFloat If the initialValue is an Ikarus float, this parameter must be set to TRUE. If it is an integer, it must be set to FALSE.
/// @return The function returns handle of the Anim8 object.
func int Anim8_NewExt(var int value, var func handler, var int data, var int IsFloat) {};

/// Deletes an Anim8 object created with Anim8_New.
///
/// @param handle Handle returned from Anim8_New.
func void Anim8_Delete(var int handle) {};

/// Get current value of the object.
///
/// @param handle Handle returned from Anim8_New.
/// @return The function returns value of the object.
func int Anim8_Get(var int handle) {};

/// Sets the value of the object.
///
/// @param handle Handle returned from Anim8_New.
/// @param value New value of the object.
func void Anim8_Set(var int handle, var int value) {};

/// Indicates whether the object is empty, i.e. has no more commands to process.
///
/// @param handle Handle returned from Anim8_New.
/// @return The function returns TRUE if object is empty (has no more commands), FALSE is returned otherwise.
func int Anim8_Empty(var int handle) {};

/// If desired, Anim8 can automatically delete an object after it is empty.
///
/// @param handle Handle returned from Anim8_New.
/// @param on TRUE: enable, FALSE: disable.
func void Anim8_RemoveIfEmpty(var int handle, var int on) {};

/// With Anim8_NewExt handler and data can be set. If this function is called with TRUE, data is taken as a handle and delete(data) is called if the object is empty. Works only if Anim8_RemoveIfEmpty is also activated.
///
/// @param handle Handle returned from Anim8_New.
/// @param on TRUE: enable, FALSE: disable.
func void Anim8_RemoveDataIfEmpty(var int handle, var int on) {};

/// Packet core. Gives the object a new command to process.
///
/// @param handle Handle returned from Anim8_New.
/// @param target Target value of this command. When the object's value has reached this value, the command is considered completed and deleted.
/// @param span Action duration in milliseconds.
/// @param interpol What form of movement is used (See constants for this).
func void Anim8(var int handle, var int target, var int span, var int interpol) {};

/// As already mentioned above, Anim8 can also process several commands one after the other. While Anim8 completely resets the object and deletes all commands, Anim8q just appends a new command to the list. This will be processed as soon as the previous one is completed.
///
/// @param handle Handle returned from Anim8_New.
/// @param target Target value of this command. When the object's value has reached this value, the command is considered completed and another one in the queue will start.
/// @param span Action duration in milliseconds.
/// @param interpol What form of movement is used (See constants for this).
func void Anim8q(var int handle, var int target, var int span, var int interpol) {};

/// Registers a function to be called when the object is deleted (e.g. by Anim8_RemoveIfEmpty)
///
/// @param handle Handle returned from Anim8_New.
/// @param dfnc This function is called when the object is deleted.
func void Anim8_CallOnRemove(var int handle, var func dfnc) {};

// =========================================================
//
//  Bars
//
// =========================================================

/// Creates a new bar from a constructor instance.
///
/// @param inst Constructor instance of Bar class
/// @return The function returns the address of the new bar, aka the handle.
func int Bar_Create(var int inst) {};

/// Deletes a bar from the screen and from memory.
///
/// @param bar Handle returned from Bar_Create
func void Bar_Delete(var int bar) {};

/// Changes a bar's maximum value but does not update its bar length (only Bar_SetPercent, Bar_SetPromille, and Bar_SetValue)
///
/// @param bar Handle returned from Bar_Create
/// @param max New maximum value
func void Bar_SetMax(var int bar, var int max) {};

/// Sets the value of the bar.
///
/// @param bar Handle returned from Bar_Create
/// @param val New value of the bar
func void Bar_SetValue(var int bar, var int val) {};

/// Sets the value of the bar but as a percentage (0..100).
///
/// @param bar Handle returned from Bar_Create
/// @param perc New value of the bar in percent
func void Bar_SetPercent(var int bar, var int perc) {};

/// Sets the value of the bar but per mille (0..1000).
///
/// @param bar Handle returned from Bar_Create
/// @param pro New value of the bar in per mille
func void Bar_SetPromille(var int bar, var int pro) {};

/// Hides a bar. It will not be deleted.
///
/// @param bar Handle returned from Bar_Create
func void Bar_Hide(var int bar) {};

/// Displays a bar again after using Bar_Hide.
///
/// @param bar Handle returned from Bar_Create
func void Bar_Show(var int bar) {};

/// Move the bar to a virtual position.
///
/// @param bar Handle returned from Bar_Create
/// @param x New horizontal position in virtual coordinates
/// @param y New vertical position in virtual coordinates
func void Bar_MoveTo(var int bar, var int x, var int y) {};

/// Move the bar to pixel position.
///
/// @param bar Handle returned from Bar_Create
/// @param x New horizontal position in pixels
/// @param y New vertical position in pixels
func void Bar_MoveToPxl(var int bar, var int x, var int y) {};

/// Sets the transparency of the bar.
///
/// @param bar Handle returned from Bar_Create
/// @param alpha Transparency value (0..255)
func void Bar_SetAlpha(var int bar, var int alpha) {};

/// Sets the foreground texture of the bar.
///
/// @param bar Handle returned from Bar_Create
/// @param barTex The new foreground texture
func void Bar_SetBarTexture(var int bar, var string barTex) {};

/// Sets the background texture of the bar.
///
/// @param bar Handle returned from Bar_Create
/// @param backTex The new background texture
func void Bar_SetBackTexture(var int bar, var string backTex) {};

/// Resize an existing bar.
///
/// @param bar Handle returned from Bar_Create
/// @param width New width in virtual coordinates
/// @param height New height in virtual coordinates
func void Bar_Resize(var int bar, var int width, var int height) {};

/// Resize existing bar (in pixels).
///
/// @param bar Handle returned from Bar_Create
/// @param x New width in pixels
/// @param y New height in pixels
func void Bar_ResizePxl(var int bar, var int x, var y) {};

// =========================================================
//
//  Bloodsplats
//
// =========================================================

/// Puts a blood splatter on the screen.
///
/// @param damage The damage (affects the size of the splatter)
func void Bloodsplat(var int damage) {};

/// Pretty pointless feature that smears the entire screen.
func void Bloodsplats_Rage() {};

/// `oCNpc::GetPerceptionFunc` engine function wrapper.
///
/// @param npc NPC whose perception is checked
/// @param type Checked perception type (from Constants.d)
/// @return The function returns the state of NPCs selected perception.
func int Npc_GetPercFunc(var C_Npc npc, var int type) {};

// =========================================================
//
//  Buffs
//
// =========================================================

/// Applies a status effect to an NPC.
///
/// @param npc NPC to be affected by this effect
/// @param buff The instance of the effect to apply to the NPC
/// @return The function returns the handle of the buff, which was just generated.
func int Buff_Apply(var C_NPC npc, var int buff) {};

/// Buff_Apply, but nothing happens if a status effect of that kind is already on the NPC.
///
/// @param npc NPC to be affected by this effect
/// @param buff The instance of the effect to apply to the NPC
/// @return The function returns the handle of the buff, which was just generated or 0 if the buff is already applied on the NPC.
func int Buff_ApplyUnique(var C_NPC npc, var int buff) {};

/// Buff_Apply, but if a status effect of this type is already affecting the NPC, the duration will be reset.
///
/// @param npc NPC to be affected by this effect
/// @param buff The instance of the effect to apply to the NPC
/// @return The function returns the handle of the buff, which was just generated or refreshed.
func int Buff_ApplyOrRefresh(var C_NPC n, var int buff) {};

/// Resets the duration of the buff.
///
/// @param buffHandle Handle of the buff to refresh
func void Buff_Refresh(var int buffHandle) {};

/// Removes the buff from all NPCs.
///
/// @param buffHandle Handle of the buff to remove
func void Buff_Remove(var int buffHandle) {};

/// Removes the buffs from the NPC.
///
/// @param npc NPC whose buff should be removed
/// @param buffInstance The instance of the buff to remove
func void Buff_RemoveAll(var C_NPC npc, var int buffInstance) {};

/// Returns a pointer to the NPC, which is affected by the buff.
///
/// @param buffHandle Handle of the buff
/// @return The function returns a pointer to the NPC, which is affected by the buff.
func int Buff_GetNpc(var int buffHandle) {};

/// Checks if the NPC already has an effect applied.
///
/// @param npc Checked NPC
/// @param buff The instance of the effect
/// @return The function returns TRUE if the NPC has an effect applied. FALSE is returned otherwise.
func int Buff_Has(var C_NPC npc, var int buff) {};

/// Same as MEM_GetFuncID but gets the current instance.
///
/// @param f Function whose ID is got
/// @return The function returns the ID of the given function.
func int SAVE_GetFuncID(var func f) {};

// =========================================================
//
//  Buttons
//
// =========================================================

/// Creates a button. It is initially hidden (not visible and does not react to the mouse).
///
/// @param posx The horizontal position of the button in virtual coordinates
/// @param posy The vertical position of the button in virtual coordinates
/// @param width Width of the button in virtual coordinates
/// @param height Height of the button in virtual coordinates
/// @param tex Name of the button texture
/// @param on_enter This function is called when the mouse enters the button
/// @param on_leave This function is called when the mouse leaves the button
/// @param on_click This function is called when the user performs a mouse click on the button (left mouse button)
/// @return The function returns a handle to created button.
func int Button_Create(var int posx, var int posy, var int width, var int height, var string tex, var func on_enter, var func on_leave, var func on_click) {};

/// Button_Create with pixels instead of virtual coordinates.
///
/// @param posx The horizontal position of the button in pixels
/// @param posy The vertical position of the button in pixels
/// @param width Width of the button in pixels
/// @param height Height of the button in pixels
/// @param tex Name of the button texture
/// @param on_enter This function is called when the mouse enters the button
/// @param on_leave This function is called when the mouse leaves the button
/// @param on_click This function is called when the user performs a mouse click on the button (left mouse button)
/// @return The function returns a handle to created button.
func int Button_CreatePxl(var int posx, var int posy, var int width, var int height, var string tex, var func on_enter, var func on_leave, var func on_click) {};

/// Completely deletes a button.
///
/// @param hndl Handle returned from `Button_Create`
func void Button_Delete(var int hndl) {};

/// Shows the button and makes it respond to the mouse.
///
/// @param hndl Handle returned from `Button_Create`
func void Button_Show(var int hndl) {};

/// Hides the button and disables it, so it is no longer responding to the mouse.
///
/// @param hndl Handle returned from `Button_Create`
func void Button_Hide(var int hndl) {};

/// Sets the texture of the button.
///
/// @param hndl Handle returned from `Button_Create`
/// @param tex Name of the new texture
func void Button_SetTexture(var int hndl, var string tex) {};

/// Displays a centered text on the button.
///
/// @param hndl Handle returned from `Button_Create`
/// @param caption The text to be displayed
/// @param font The font in which the text should be displayed
func void Button_SetCaption(var int hndl, var string caption, var string font) {};

/// Attaches a mouseover box to the cursor.
///
/// @param text The text in the mouseover box
/// @param font The font of the text
func void Button_CreateMouseover(var string text, var string font) {};

/// Deletes the mouseover box.
func void Button_DeleteMouseover() {};

/// Activates the button, so it reacts to the mouse. Does not change the visibility.
///
/// @param hndl Handle returned from `Button_Create`
func void Button_Activate(var int hndl) {};

/// Disables the button, so it no longer reacts to the mouse.
///
/// @param hndl Handle returned from `Button_Create`
func void Button_Deactivate(var int hndl) {};

/// Sets the user data of the button, an integer, to give the button individual information.
///
/// @param hndl Handle returned from `Button_Create`
/// @param data Individual integer of the button (part of the internal `_Button` class)
func void Button_SetUserData(var int hndl, var int data) {};

/// Gets the user data of the button.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the user data of the button.
func int Button_GetUserData(var int hndl) {};

/// Gets the status of the button as a bit field. See User Constants for possible states.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the status of the button.
func int Button_GetState(var int hndl) {};

/// Moves the button by the given value in pixels. `posx = posx + nposx`
///
/// @param hndl Handle returned from `Button_Create`
/// @param nposx X-axis shift in pixels
/// @param nposy Y-axis shift in pixels
func void Button_Move(var int hndl, var int nposx, var int nposy) {};

/// Moves the button by the given value in virtual coordinates. `posx = posx + nposx`
///
/// @param hndl Handle returned from `Button_Create`
/// @param nposx X-axis shift in virtual coordinates
/// @param nposy Y-axis shift in virtual coordinates
func void Button_MoveVrt(var int hndl, var int nposx, var int nposy) {};

/// Moves a button to the given position in pixels. `posx = nposx`
///
/// @param hndl Handle returned from `Button_Create`
/// @param nposx New horizontal position in pixels
/// @param nposy New vertical position in pixels
func void Button_MoveTo(var int hndl, var int nposx, var int nposy) {};

/// Moves a button to the given position in virtual coordinates. `posx = nvposx`
///
/// @param hndl Handle returned from `Button_Create`
/// @param nvposx New horizontal position in virtual coordinates
/// @param nvposy New vertical position in virtual coordinates
func void Button_MoveToVrt(var int hndl, var int nvposx, var int nvposy) {};

/// Returns the button's `zCView` as a handle.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the button's `zCView` as a handle.
func int Button_GetViewHandle(var int hndl) {};

/// Returns the button's `zCView` as a pointer.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the button's `zCView` as a pointer.
func int Button_GetViewPtr(var int hndl) {};

/// Returns the button's `zCView` as an object.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the button's `zCView` as an object.
func zCView Button_GetView(var int hndl) {};

/// Returns the pointer to the text of the button.
///
/// @param hndl Handle returned from `Button_Create`
/// @return The function returns the pointer to the text of the button.
func int Button_GetCaptionPtr(var int hndl) {};

// =========================================================
//
//  ConsoleCommands
//
// =========================================================

/// Registers a new console command.
///
/// @param f This function is executed when the cmdPrefix command is entered in the console.
///          The function signature is func string f(var string p0).
///          The string passed is everything that was specified in the console after the actual command.
///          The return value is then displayed in the console.
/// @param cmdPrefix This is a command, which can be entered in the console.
/// @param description This text appears next to the command (in zSpy) when you use the help command in the console.
func void CC_Register(var func f, var string cmdPrefix, var string description) {};

/// Removes a function from the console commands.
///
/// @param f This function will be removed, i.e. the associated command will no longer work.
func void CC_Remove(var func f) {};

/// Checks whether the function passed is already part of a console command.
///
/// @param f Function being checked
/// @return The function returns TRUE if there is a corresponding function, FALSE is returned otherwise.
func int CC_Active(var func f) {};

// =========================================================
//
//  Cursor
//
// =========================================================

/// Hides the displayed mouse cursor.
func void Cursor_Hide() {};

/// Shows the mouse cursor.
func void Cursor_Show() {};

/// Can manually enable or disable the mouse.
///
/// @param enabled TRUE - Mouse activated
func void SetMouseEnabled(var int enabled) {};

// =========================================================
//
//  Dialoggestures
//
// =========================================================

/// With this function the dialog gestures for all NPCs can be overridden.
///
/// The full name of the animation can be described as follows:
/// "DIAG_Prefix" + aniName + "DIAG_Suffix" + ((rand() % (max - (min - 1))) + min).ToString("00");
///
/// "DIAG_Prefix" and "DIAG_Suffix" are user constants.
///
/// @param AniName The new dialogue gesture
/// @param Min Lowest animation number
/// @param Max Highest animation number
func void DIAG(var string AniName, var int Min, var int Max) {};

/// Resets the dialog gestures to the default.
func void DIAG_Reset() {};

/// Sets animation directly.
///
/// @param AniName Animation name
func void DIAG_SetAni(var string AniName) {};

/// Sets animation numbers directly.
///
/// @param Min Lowest animation number
/// @param Max Highest animation number
func void DIAG_SetMinMax(var int Min, var int Max) {};

// =========================================================
//
//  Gamestate
//
// =========================================================

/// Adds a listener/handler to the game-state event.
///
/// @param listener This function will be called on a game-state change. The current game-state is passed as a parameter.
func void Gamestate_AddListener(var func listener) {};

/// Removes game-state listener.
///
/// @param listener Listener function to be removed.
func void Gamestate_RemoveListener(var func listener) {};

// =========================================================
//
//  Names
//
// =========================================================

/// Should be set in InitGlobal().
///
/// @param npc The NPC to be named
/// @param name The name of the NPC
func void SetName(var C_NPC npc, var string name) {};

/// Permanently displays the name set by SetName function above the NPC.
///
/// @param npc The NPC whose name should be shown
func void ShowName(var C_NPC npc) {};

// =========================================================
//
//  Render
//
// =========================================================

/// Generates the render of an item, with a manually specified priority.
///
/// @param itemInst The instance of the item to render
/// @param x1 The top left coordinate of the view
/// @param y1 The top left coordinate of the view
/// @param x2 The bottom right coordinate of the view
/// @param y2 The bottom right coordinate of the view
/// @param priority The priority of this render object
///
/// @return A handle of the render object
func int Render_AddItemPrio(var int itemInst, var int x1, var int y1, var int x2, var int y2, var int priority) {};

/// Generates the render of an item, with priority set to 0.
///
/// @param itemInst The instance of the item to render
/// @param x1 The top left coordinate of the view
/// @param y1 The top left coordinate of the view
/// @param x2 The bottom right coordinate of the view
/// @param y2 The bottom right coordinate of the view
///
/// @return A handle of the render object
func int Render_AddItem(var int itemInst, var int x1, var int y1, var int x2, var int y2) {};

/// Generates the render of a View, with a manually specified priority.
///
/// @param view A handle to a View
/// @param priority The priority of this render object
///
/// @return A handle of the render object
func int Render_AddViewPrio(var int view, var int priority) {};

/// Generates the render of a View, with priority set to 0.
///
/// @param view A handle to a View
///
/// @return A handle of the render object
func int Render_AddView(var int view) {};

/// Opens a render object. Only open render objects are displayed.
///
/// @param handle Handle of a render object
func void Render_OpenView(var int handle) {};

/// Closes a render object. Only open render objects are displayed.
///
/// @param handle Handle of a render object
func void Render_CloseView(var int handle) {};

/// Deletes a render object. The associated view is deleted automatically.
///
/// @param handle Handle of a render object
func void Render_Remove(var int handle) {};

// =========================================================
//
//  Trialoge
//
// =========================================================

/// Sektenspinner's function. Makes NPC equip a weapon.
///
/// @param slf NPC to have a weapon equipped
/// @param ItemInstance Weapon instance ID to be equipped
func void EquipWeapon(var C_NPC slf, var int ItemInstance) {};

/// Returns NPC's equipped armor.
///
/// @param slf NPC to get the armor from
///
/// @return Instance of armor worn by the NPC
func int Npc_GetArmor(var C_NPC slf) {};

/// Returns NPC's equipped melee weapon.
///
/// @param slf NPC to get the weapon from
///
/// @return Instance ID of the melee weapon equipped by the NPC
func int Npc_GetMeleeWeapon(var C_NPC slf) {};

/// Returns NPC's equipped ranged weapon.
///
/// @param slf NPC to get the weapon from
///
/// @return Instance ID of the ranged weapon equipped by the NPC
func int Npc_GetRangedWeapon(var C_NPC slf) {};

/// Swaps NPCs equipped weapon.
///
/// @param slf NPC to perform the operation on
/// @param itm0 Instance ID of the item to remove
/// @param itm1 Instance ID of the item to create and equip
func void Npc_TradeItem(var C_NPC slf, var int itm0, var int itm1) {};

/// Sektenspinner's function that updates the dialogue camera. (Used internally.)
func void DiaCAM_Update() {};

/// Completely disable the dialogue cameras.
func void DiaCAM_Disable() {};

/// Resets the dialogue cameras to the default settings.
func void DiaCAM_Enable() {};

/// Makes self and other wait for each other, e.g., for AI_GotoWP actions for synchronization.
func void TRIA_Wait() {};

/// Invites an NPC into a conversation. Must be called before TRIA_Start.
///
/// @param slf The invited NPC
func void TRIA_Invite(var C_NPC slf) {};

/// Starts trialogues. Before that, all NPCs should be invited by TRIA_Invite.
func void TRIA_Start() {};

/// Similar to TRIA_Wait but applies to all participating NPCs.
func void TRIA_Barrier() {};

/// Sets the called npc to self.
///
/// @param n0 NPC to set to self
func void TRIA_Next(var C_NPC n0) {};

/// Starts a tracking shot.
///
/// @param evt The name of the tracking shot in Spacer. If an empty string is passed, the running tracking shot will be aborted.
func void TRIA_Cam(var string evt) {};

/// Ends an ongoing trialogue. Must always be called at the end; otherwise, no further trialogues can be started.
func void TRIA_Finish() {};

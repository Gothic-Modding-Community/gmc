# Hooks
Union provides a hooks system that lets us intercept calls to the engine functions and methods with our custom interceptor. To hook a function or method we need to know its address which can be acquired either from `Engine SDK/[Engine]/Names_[Engine].hpp` or from the engine classes headers `Engine SDK/[Engine]/Headers`.

## Intercepting functions
To declare a hook we can use `CInvoke` class or `HOOK AS` macros.
```cpp
CInvoke<function_type> Ivk_HookName(orignal_function_address, our_interceptor_function, hook_flags);

HOOK Ivk_HookName AS(orignal_function_address, our_interceptor_function, hook_flags);
```

### Regular functions
Regular functions are the functions declared outside of classes.
```cpp
// 0x0042C450 int __cdecl Apply_Options_Video(void)

// Forward declaration
int Apply_Options_Video(); 

// Hook declaration
CInvoke<int(*)()> Ivk_Apply_Options_Video(0x0042C450, &Apply_Options_Video);
// Equivalent:
// HOOK Ivk_Apply_Options_Video AS(0x0042C450, &Apply_Options_Video);

// Implementation of interceptor
int Apply_Options_Video() {
    Message::Info("Before original Apply_Options_Video()");

    // Original function can be called using CInvoke pointer.
    int result = Ivk_Apply_Options_Video();

    Message::Info("After original Apply_Options_Video()");

    return result;
}
```

### Member function
Member functions are the functions declared as non-static class members and they take a class instance pointer as an implicit first argument (`__thiscall` calling convention). We can hook them in two ways using either a regular function or declaring a new method in User API.

#### Option #1 - Regular function
```cpp
// 0x006015D0 public: virtual int __fastcall zCVob::Render(struct zTRenderContext &)

// Forward declaration
int __fastcall zCVob_Render(zCVob* _this, zTRenderContext& context);

// Hook declaration
CInvoke<int(__fastcall *)(zCVob* _this, zTRenderContext& context)> Ivk_zCVob_Render(0x006015D0, &zCVob_Render);
// Equivalent:
// HOOK Ivk_zCVob_Render AS(0x006015D0, &zCVob_Render);

// Implementation of interceptor as regular function
// Notice the first argument that's a pointer to class instance (this)
int __fastcall zCVob_Render(zCVob* _this, zTRenderContext& context) {
    if(_this == player) {
        screen->PrintCX(1000, "Rendering a player zCVob");
    }

    // Call original method
    return Ivk_zCVob_Render(_this, context);
}
```

#### Option #2 - User API
In `Engine SDK/User API` we can find a `.inc` file for the class we are hooking and define a new member method there. In this case, we are looking for `zCVob.inc`:
```cpp 
// Supported with union (c) 2020 Union team

// User API for zCVob
// Add your methods here

int RenderUnion(zTRenderContext& context);
```

Then we can declare the hook pointing to our member method:
```cpp
// 0x006015D0 public: virtual int __fastcall zCVob::Render(struct zTRenderContext &)

// Hook declaration
CInvoke<int(__fastcall zCVob::*)(zTRenderContext& context)> Ivk_zCVob_Render(0x006015D0, &zCVob::RenderUnion);
// Equivalent:
// HOOK Ivk_zCVob_Render AS(0x006015D0, &zCVob::RenderUnion);

// Implementation of interceptor  method
int zCVob::RenderUnion(zTRenderContext& context) {
    if(this == player) {
        screen->PrintCX(1000, "Rendering a player zCVob");
    }

    // Call original method
    return Ivk_zCVob_Render(this, context);
}
```

## Hook flags
In the third argument of `CInvoke` we can provide hook flags. The default value is `IVK_AUTO`.

```cpp
enum EInterMode
{
    // Hook will not intercept the function.
    IVK_DISABLED  = 1 << 1,

    // Normal hook. If other hook is already defined for the same address, an error pops up.
    IVK_NORMAL    = 1 << 2,

    // Hook will automatically create an interception tree to allow multiple hooks for the same address.
    IVK_AUTO      = 1 << 3,

    // Overrides any hook defined for the same address before.
    IVK_REDEFINE  = 1 << 4,

    // Makes it impossible to override or disable the hook.
    // It should be used only in very specific cases.
    IVK_PROTECTED = 1 << 5,

    // Same as IVK_DISABLED
    IVK_READONLY  = IVK_DISABLED
};
```

## Credits
Examples are taken from the Union lessons in Russian created by Gratt on [worldofplayers.ru/threads/41490/](https://worldofplayers.ru/threads/41490/)

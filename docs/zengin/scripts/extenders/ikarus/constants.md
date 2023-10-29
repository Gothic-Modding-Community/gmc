---
title: Constants
---

# Ikarus User Constants

In the Constants file, you'll find user variables that control various aspects, including the debug output of Ikarus. You can customize these variables to suit your needs.


## MEM-Helper

- `#!dae const string MEM_FARFARAWAY`  
    Waypoint where the Mem-Helper is spawned (default: `"TOT"`)
- `#!dae const string MEM_HELPER_NAME`  
    Name of the Mem-Helper (default: `"MEMHLP"`)

## Debug

- `#!dae const int zERR_ErrorBoxOnlyForFirst`  
    Controls whether only the first error should trigger an error box (default: `1`).
- `#!dae const int zERR_StackTraceOnlyForFirst`  
    Determines if stack traces should be displayed only for the first error (default: `0`).

### MEM_Debug

The [`MEM_Debug`](functions/preamble.md#mem_debug) function allows you to set up a custom message channel for debugging purposes. You can adjust the following variables to configure this channel:

- `#!dae const string zERR_DEBUG_PREFIX`  
    Specifies a prefix to be added to each debug message (default: `"Debug: "`).
- `#!dae const int zERR_DEBUG_TOSPY`  
    Controls whether `MEM_Debug` messages should be sent to [zSpy](../../../tools/zSpy.md) (default: `1`).
- `#!dae const int zERR_DEBUG_TYPE`  
    Specifies the [message type](#error-message-types) for `MEM_Debug` messages when sent to [zSpy](../../../tools/zSpy.md) (default: `zERR_TYPE_INFO`).
- `#!dae const int zERR_DEBUG_TOSCREEN`  
    Determines whether `MEM_Debug` messages should be printed to the screen (default: `0`).
- `#!dae const int zERR_DEBUG_ERRORBOX`  
    Allows you to display an error box for `MEM_Debug` messages (default: `0`).

### Error message types
```dae
const int zERR_TYPE_OK    = 0; /* [ungenutzt]        */
const int zERR_TYPE_INFO  = 1; /* MEM_Info           */
const int zERR_TYPE_WARN  = 2; /* MEM_Warn           */
const int zERR_TYPE_FAULT = 3; /* MEM_Error          */
const int zERR_TYPE_FATAL = 4; /* [ungenutzt]        */
```
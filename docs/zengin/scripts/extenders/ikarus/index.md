# Ikarus
Ikarus is a Daedalus library for Gothic. It exploits the interpreter to allow arbitrary memory access and defines tonne of useful functions for interfacing with the engine. 

| Contacts |                                                                                                                          |
|:---------|:-------------------------------------------------------------------------------------------------------------------------|
| Author   | [:material-badge-account-horizontal: Sektenspinner & contributors](https://github.com/Lehona/Ikarus/graphs/contributors) |
| GitHub   | [:material-github: Ikarus](https://github.com/Lehona/Ikarus)                                                             |
| Forum    | [:material-forum: Ikarus](https://forum.worldofplayers.de/forum/threads/1299679-Skriptpaket-Ikarus-4)                    |

!!! Trivia "Author Note (by Sektenspinner)"
    This script package is not called **Ikarus** for nothing:

    One can leave the boundaries of Daedalus behind, but may also crash and burn. For instance, reading from invalid addresses won't trigger a [zSpy](../../../tools/zSpy.md) warning but will result in a desktop crash with an Access Violation. This is not a reason to panic but requires a tolerance for frustration (which can be useful for scripters in general).

    Of course, such spectacular-looking errors can be fixed, and with focused and systematic work, something sensible can be achieved.

    In short: Extra care is needed! A bug that leads to a crash is not something you want in the release version. But if you work cleanly and test extensively, it's not such a big deal.

    A good friend in debugging crashes is undoubtedly `PrintDebug`. It allows sending messages to [zSpy](../../../tools/zSpy.md) (for example, to narrow down where the crash is occurring). It's worth enabling debug messages by [`MEM_SetShowDebug`](functions/debug.md#mem_setshowdebug) and the text filter (Options -> Textfilter) in [zSpy](../../../tools/zSpy.md#configuration).

!!! Note
    Ikarus is hosted on [GitHub](https://github.com/Lehona/Ikarus) and the documentation is [built in](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Doc.d). The translation is planned.

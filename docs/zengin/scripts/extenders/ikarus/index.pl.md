# Ikarus
Ikarus jest biblioteką Daedalusa - języka skryptowego Gothica. Wykorzystuje interpreter, aby umożliwić dowolny dostęp do pamięci i definiuje mnóstwo przydatnych funkcji do pracy z silnikiem.

| Kontakt |                                                                                                                         |
|:--------|:------------------------------------------------------------------------------------------------------------------------|
| Autor   | [:material-badge-account-horizontal: Sektenspinner i współtwórcy](https://github.com/Lehona/Ikarus/graphs/contributors) |
| GitHub  | [:material-github: Ikarus](https://github.com/Lehona/Ikarus)                                                            |
| Forum   | [:material-forum: Ikarus](https://forum.worldofplayers.de/forum/threads/1299679-Skriptpaket-Ikarus-4)                   |

!!! Trivia "Notatka autora (Sektenspinner)"
    Ten pakiet skryptów niebez powodu nazywa się **Ikarus**:

    Można opuścić granice Dedala, ale można też rozbić się i spalić. Na przykład odczyt z nieprawidłowych adresów nie wywoła ostrzeżenia [zSpy](../../../tools/zSpy.md), ale spowoduje wyjście do pulpitu wraz z Access Violation. Nie jest to powód do paniki, ale wymaga tolerancji na frustrację (co może być ogólnie przydatne dla skrypterów).

    Oczywiście tak spektakularnie wyglądające błędy można naprawić, a przy systematycznej pracy w skupieniu można osiągnąć coś sensownego.

    W skrócie: wymagana jest dodatkowa ostrożność! Błąd prowadzący do awarii nie jest czymś, czego chciałbyś w wydanej wersji. Ale jeśli pracujesz czysto i intensywnie testujesz, nie jest to taka wielka sprawa.

    Dobrym przyjacielem w debugowaniu awarii jest niewątpliwie `PrintDebug`. Umożliwia wysyłanie wiadomości do [zSpy](../../../tools/zSpy.md) (na przykład w celu zawężenia miejsca wystąpienia awarii). Warto włączyć komunikaty debugowania za pomocą [`MEM_SetShowDebug`](functions/debug.md#mem_setshowdebug) i filtr tekstowy (Opcje -> Textfilter) w [zSpy](../../../tools/zSpy.md#configuration).

!!! Note
    Ikarus jest hostowany na [GitHubie](https://github.com/Lehona/Ikarus) i posiada wbudowaną [dokumentacje](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Doc.d). Jej tłumaczenie jest w planach.

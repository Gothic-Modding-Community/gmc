---
title: Muzyka
---
# Muzyka

Zengin używa [DirectMusic](https://en.m.wikipedia.org/wiki/DirectMusic) do odtwarzania ścieżki dźwiękowej w grze. Aby edytować pliki muzyczne Gothica, potrzebujesz [Direct Music Producer](https://en.m.wikipedia.org/wiki/DirectMusic), programu wydanego przez Microsoft i dołączanego do starszych zestawów SDK DirectX.

!!! Warning
    Pliki muzyczne nie mogą być spakowane do archiwów `.vdf` lub `.mod`, wszystkie takie pliki muszą znajdować się w katalogu `/_work/Data/Music`.

## Formaty plików

Katalog `Music` zawiera następujące typy plików:

- `.dls` - Plik formatu [Downloadable Sound](https://en.wikipedia.org/wiki/DLS_format). Jest bazą dla wszystkich innych plików. Zawiera:
    - Kolekcje wirtualnych instrumentów muzycznych.
    - Pliki `.wav` urzywane przez instrumenty.

- `.sty` - Plik stylu. Zawiera:
    - Zespoły (Bands) - ustawienia instrumentów wirtualnych z `.dls`.
    - Wzory (Patterns) - fragmenty utworów, które można później łączyć, zapętlać i nakładać na siebie.

- `.sgt` - Plik z odpowiednio połączonymi wzorami (patternami) - końcowy utwór

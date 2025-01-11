# Dźwięk
ZenGin używa plików `.wav` do odtwarzania efektów dźwiękowych i dubbingu.

!!! Informacja
    Ścieżka dźwiękowa w grze nie jest zapisywana w plikach dźwiękowych `.wav`. Zobacz [Muzyka](../music.md).

## Właściwości
Oryginalne pliki dźwiękowe gothica mają następujące właściwości:

- Jeden kanał (Mono)
- [44100 Hz](https://en.wikipedia.org/wiki/44,100_Hz) częstotliwość
- 32-bitowa [głębia](https://pl.wikipedia.org/wiki/Rozdzielczość_bitowa_dźwięku)

## Efekty dźwiękowe
Efekty dźwiękowe (SFX) to dźwięki wydawane przez potwory, zaklęcia, broń itp. Efekty dźwiękowe są definiowane w wielu miejscach, w plikach `.mds` jako część animacji [EventBlocks](../anims/events.md), lub w skryptach SFX Daedalus. Dźwięki znajdują się w katalogu `_work/Data/Sound/SFX`.  

## Speech
Dubbing dla dialogów znajduje się w folderze `_work/Data/Sound/Speech`. Każde pojedyncze `AI_Output` ma swój własny plik dźwiękowy o nazwie zdefiniowanej w samej funkcji.

W przypadku tej linii dialogowej
```dae
AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Jestem Diego.
```
silnik odtworzy plik dźwiękowy `Info_Diego_Gamestart_11_00.wav` (jeśli istnieje).

## SystemPack
SystemPack 1.5+ dodaje obsługę formatu `ogg`, ale w nietypowy sposób. Rozszerzenie pliku `.ogg` musi zostać zmienione na `.wav`, tworząc plik "pseudo-wav", który będzie działał. Może to być pomocne w zmniejszeniu rozmiaru moda.
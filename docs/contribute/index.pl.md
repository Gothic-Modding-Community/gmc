# Jak się udzielić

[gmc-discord]: https://discord.gg/mCpS5b5SUY
[git-download]: https://git-scm.com/downloads
[python-download]: https://www.python.org/downloads/

Gothic Modding Community jest projektem napędzanym przed społeczność. Zachęcamy osoby do wnoszenia swojego wkładu.

Ta strona jest budowana przy pomocy statycznego generatora stron [MkDocs](https://www.mkdocs.org/) oraz skórki [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/), wraz z wieloma innymi wtyczkami do MkDocs.

Zależnie od skali i typu kontrybucji, trzeba spełnić inne wymagania wstępne.

## Zgłoszenia
Po angielsku można zgłosić problem lub inny komentarz o funkcjonowaniu strony poprzez [otworzenie problemu (ang. issue)](https://github.com/Gothic-Modding-Community/gmc/issues) na serwisie GitHub albo [dołącz do nas][gmc-discord] na platformie Discord.

## Wkład bezpośredni
Wkład bezpośredni wykonuje się poprzez stworzenie kopii tego repozytorium (ang. fork) oraz [stworzenie](https://github.com/Gothic-Modding-Community/gmc/pulls) prośby o połączenie (ang. pull request PR) na serwisie GitHub wraz ze zmianami do zatwierdzenia.

!!! danger "Nie zmarnuj czasu"
    Proszę się upewnić, że treść, jaka zostanie dodana, nie występuje już na [wersji dev](https://auronen.cokoliv.eu/) strony. Można skorzystać z funkcjonalności wyszukiwania, żeby przefiltrować GMC różnymi słowami kluczowymi i treściami.

!!! question "Jak edytować pliki źródłowe?"
    Pliki źródłowe artykułów są pisane wykorzystując format plików [Markdown](https://pl.wikipedia.org/wiki/Markdown) `.md` ([Markdown cheatsheet](https://www.markdownguide.org/cheat-sheet)). Poza tym ta strona wykorzystuje wtyczkę [Python Markdown Extensions](https://python-markdown.github.io/extensions/), która rozszerza składnię o dodatkowe zasady pozwalające na wstawienie [wzmianek](https://python-markdown.github.io/extensions/admonition/) jak ta, którą właśnie czytasz.

### Mniejsze zmiany
Mniejsze zmiany, jak poprawianie błędów ortograficzny, gramatycznych, czy usuwanie/dodawanie słów do akapitów w _jednym_ pliku, mogą być zrobione szybko poprzez kliknięcie przycisku :material-file-edit-outline: w prawym górnym rogu artykułu. Otworzy to interfejs edytowania pliku w serwisie GitHub, które po zapisaniu zmian, automatycznie utworzy kopię (ang. fork) oraz gałąź (ang. brach) z łatką, a następnie otworzy prośbę o połączenie (ang. pull request) względem gałęzi `dev`.

!!! warning "Poprawna gałąź dla prośby o połączenie"  
    Upewnij się, że prośba o połączenie (ang. pull request) jest skierowana do gałęzi [`dev`](https://github.com/Gothic-Modding-Community/gmc/tree/dev) albo specjalnej gałęzi `pre-merge`, a nie do gałęzi `main`.

### Większe zmiany
Bardziej złożone zmiany takie jak, edycja wielu plików naraz, dodawanie nowych artykułów, obrazków, czy innych plików, albo zmiana konfiguracji strony jest łatwiej zrobić poprzez użycie zewnętrznych narzędzi na lokalnym PC. Większość z tych operacji można zrobić poprzez interfejs serwisu GitHub, ale jest to raczej uciążliwe oraz trudniej zauważyć problemy wynikające z procesu zmian, ponieważ nie są one widoczne w przeglądarce w ich ostatecznej formie.

Trochę przygotowań jest potrzebnych przed rozpoczęciem prac nad plikami, ponieważ do działania MkDocs wymaga zainstalowanego w systemie Pythona. GitHub działa nad systemem kontroli wersji [git](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control), więc jego instalacja jest też wymagana. Podstawowa znajomość obsługi Terminala/Konsoli poleceń/Powershell jest pomocna.

### Przygotowanie Systemu (wideo)
Po pierwsze, trzeba zainstalować Python. Można podążać według tego poradnika krok po kroku dla [Windowsa](https://youtu.be/YYXdXT2l-Gg?t=351) albo [macOS](https://youtu.be/YYXdXT2l-Gg?t=85) jak zainstalować Python.

!!! question "Wideo jest z 2017?!"
    Proces instalacji Pythona nie zmienił się od tamtego czasu. Jednakże proszę instalować [najnowszą wersję][python-download] Python 3.

Aby móc pracować zdalnie z GitHub, można zainstalować [najnowszą wersję][git-download] _git_, podążając według [tego poradnika](https://www.atlassian.com/git/tutorials/install-git).

Jeżeli planujesz tylko edytować zawartość artykułów Markdown, możesz po prostu zainstalować [najnowszą wersję](https://code.visualstudio.com/Download) Visual Studio Code, żeby mieć interfejs graficzny do zarządzania _git_ oraz podgląd Markdown, albo pracuj z dowolnym znanym edytorem tekstu i omiń konfigurację środowiska.

Jeżeli planujesz bardziej złożone programowanie w Python, możesz podążyć według tego poradnika krok po kroku dla [Windowsa](https://www.youtube.com/watch?v=-nh9rCzPJ20) lub [macOS](https://www.youtube.com/watch?v=06I63_p-2A4) jak skonfigurować środowisko developerskie z Visual Studio Code (VS Code).

### Przygotowanie Systemu (tekst)
Żeby przygotować system do uruchomienia projektu lokalnie, podążaj według tych instrukcji.

1. Zainstaluj [najnowszą wersję][python-download] Pythona.  
    Upewnij się, żeby zaznaczyć opcję **"Add Python to PATH"** podczas instalacji.

2. Otwórz okno Terminala/Konsoli poleceń/PowerShell.

3. Sprawdź, że instalacja Pythona była pomyślna, korzystając z tego polecenia (możliwa jest potrzeba restartu okna konsoli):

    ```bash
    python --version
    ```

4. Zainstaluj [najnowszą wersję][git-download] _git_, podążając według [tego poradnika](https://www.atlassian.com/git/tutorials/install-git).

5. Sprawdź, że instalacja _git_ była pomyślna, korzystając z tego polecenia (możliwa jest potrzeba restartu okna konsoli):

    ```bash
    git --version
    ```

6. (opcjonalne) Zainstaluj [najnowszą wersję](https://code.visualstudio.com/Download) Visual Studio Code dla interfejsu graficznego do zarządzania _git_ i podglądem Markdown.

### Praca lokalna
Aby móc pracować lokalnie:

1. [Stwórz kopię (ang. fork)](https://github.com/Gothic-Modding-Community/gmc/fork) na serwisie GitHub.
2. Na lokalnym PC nawiguj do folderu, w którym chcesz sklonować kopię repozytorium, oraz otwórz okno konsoli wewnątrz niego.
3. Sklonuj kopię repozytorium, korzystając z tego polecenia:

    ```bash
    git clone https://github.com/user-name/forked-repository-name.git <DIR-PATH>
    ```
    
    Zamiast `https://github.com/user-name/forked-repository-name.git` skorzystaj z własnego linku, który jest widoczny po kliknięciu zielonego przycisku `<> Code` i wybraniu zakładki `HTTPS`.    

    Zamień `<DIR-PATH>` ze ścieżką do folderu, do którego ma być sklonowane repozytorium albo `.` jeżeli już jesteś wewnątrz folderu gdzie pliki projektu mają się znajdować.

    To automatycznie utworzy zdalne repozytorium `origin` skierowane względem twojej kopii.

4. Dodaj zdalne repozytorium `upstream` korzystając z tego polecenia:

    ```bash
    git remote add upstream https://github.com/Gothic-Modding-Community/gmc.git
    ```

5. (opcjonalne) Stwórz wirtualne środowisko i aktywuj je.

    Jeżeli pracujesz przy kilku projektach Python, warto stworzyć wirtualne środowisko (ang. Virtual Environment) dla każdego z tych projektów, żeby każdy mógł korzystać z własnego folderu bibliotek z zainstalowanymi modułami/wtyczkami.
    
    ```bash
    python -m venv venv
    ```
    
    To utworzy folder `venv` wewnątrz obecnie wybranego folderu w oknie konsoli. Proszę, zostaw tę nazwę, ponieważ jest dodana do pliku `.gitignore` projektu.
    
    Zależnie od systemu, skorzystaj z jednego z tych poleceń do aktywacji wirtualnego środowiska.
    
    ```bash title="Linux / macOS"
    source venv/bin/activate
    ```
    ```powershell title="Windows Powershell"
    venv\Scripts\activate.ps1
    ```
    ```batch title="Windows Konsola Poleceń (cmd)"
    venv\Scripts\activate.bat
    ```
    
    Po aktywacji indykator `(venv)` będzie wyświetlany przy nazwie folderu w oknie poleceń.
    
    !!! warning "Nie zamykaj okna poleceń"  
        Wirtualne środowisko musi być ponownie aktywowane, przy każdym otwarciu okna poleceń.

6. Zainstaluj MkDocs wraz z wtyczkami korzystając z tego polecenia:

    ```bash
    pip install -r requirements.txt
    ```
    
    To zainstaluje wszystkie zależności.

7. Pobierz (ang. fetch) stan historii git z repozytorium `upstream` korzystając z tego polecenia:

    ```bash
    git fetch upstream
    ```

8. Otwórz (ang. checkout) lokalną gałąź opierającą się o gałąź `dev` repozytorium `upstream` korzystając z tego polecenia:

    ```bash
    git checkout -b name-of-branch --track upstream/dev
    ```
    
    W miejscu `name-of-branch` podaj krótką nazwę po angielsku. Odpowiednią nazwą gałęzi jest albo nazwa funkcjonalności, albo krótki opis wprowadzonych zmian np. `3ds-articles`, `fix-typos-for-contribution`. Nie muszą być zbyt skomplikowane, do 4 słów wystarczy.

9. Uruchom serwer ze zbudowaną stroną projektu, korzystając z tego polecenia:

    ```bash
    mkdocs serve
    ```
    
    Odwiedź lokalną stronę pod tym adresem [`http://127.0.0.1:8000/gmc/`](http://127.0.0.1:8000/gmc/).
    Po każdej zmianie w plikach projektu strona automatycznie się przebuduje i po chwili przeglądarka automatycznie się odświeży.
    
    Serwer może być zamknięty poprzez skorzystanie ze skrótu klawiszowego `Control-C` w trakcie gdy okno poleceń jest aktywne.

10. Jeżeli ukończysz fragment swojej pracy, dodaj pliki i wstaw wpis do historii gita (ang. commit) korzystając z tego polecenia:

    ```bash
    git add .
    git commit -m "add 3 articles about ZenGin"
    ```
    
    Jak widać wiadomość (ang. message) / nazwa do wpisu historii również powinna być w języku angielskim. Odpowiednią wiadomością jest zdanie opisujące zmiany.

11. Po skończeniu wszystkich prac wyślij (ang. push) swoją gałąź do zdalnego repozytorium `origin`, korzystając z tego polecenia:

    ```bash
    git push origin name-of-branch
    ```

12. Stwórz prośbę o połączenie (ang. pull request) względem odpowiedniej gałęzi.

    Po wysłaniu lokalnej gałęzi do zdalnego repozytorium `origin` w oknie poleceń będzie dostępne łącze, które otworzy stronę tworzenia prośby o połączenie. Upewnij się, że jest skierowana względem gałęzi `dev` oraz, że posiada wszystkie wprowadzone zmiany.

13. Kolejna kontrybucja:

    Przed kolejną kontrybucją, zawsze skorzystaj z tego polecenia:
    ```bash
    git fetch upstream 
    ```
    żeby mieć pewność, że posiadasz najnowszą historię zmian z repozytorium `upstream`. Następnie podążaj ponownie od 8. podpunktu i zawsze twórz nową gałąź przed wprowadzeniem zmian.

    ```bash
    git status
    ```
    
    Tym poleceniem możesz sprawdzić, czy nie masz żadnych zmian w strukturze projektu względem repozytorium `upstream`.

#### Preferencje budowy strony
Podczas pracy z projektem można ustawić różne zmienne środowiskowe, żeby przystosować konfigurację do własnych preferencji:

- `GMC_DEV_LOCALE` - to dwuznakowy identyfikator języka (np. `en`, `pl`), ustawia język testowy. To ustawi ten języki jako domyślny oraz jedyny renderowany podczas budowy strony. Pomaga w zmniejszeniu czasu budowy strony oraz pozwala na łatwe zmienianie języka zamiast modyfikowania pliku konfiguracyjnego. **Przez zmiany w pluginie `mkdocs-static-i18n` jest to jedyny sposób na tymczasową zmianę domyślnego języka**
- `GMC_BUILD_ALTERNATES` - wartość `True` albo `False`, aktywuje budowanie strony wraz z alternatywnymi językami. Domyślnie alternatywne języki są pomijane, aby zmenijszyć czas budowy strony. 
- `GMC_ENABLE_ON_PUBLISH` - wartość `True` albo `False`, aktywuje wszystkie finalne procesy, jak dodanie daty ostatniej aktualizacji, minimalizacja zasobów itp. 

Dla otwartego okna poleceń można tymczasowo je ustawić:

```bash title="Linux"
export GMC_DEV_LOCALE=en export GMC_BUILD_ALTERNATES=False; mkdocs serve
```

```powershell title="Windows Powershell"
$env:GMC_DEV_LOCALE="en"
$env:GMC_BUILD_ALTERNATES="False"
mkdocs serve
```

```batch title="Windows Konsola Poleceń (cmd)"
set GMC_DEV_LOCALE=en
set GMC_BUILD_ALTERNATES=False
mkdocs serve
```

#### Wydajność budowy strony
Aby przyśpieszyć proces budowy strony podczas pracy, upewnij się, że tylko 1 język jest budowany i rozważ użycie opcji `--dirtyreload`:

```bash
mkdocs serve --dirtyreload
```

To sprawi, że tylko zmienione pliki `.md` będą na nowo budowane. Jednakże, zmiany plików szablonowych (ang. template) w folderze `overrides` nie będą widoczne, ponieważ takie zmiany wymagają pełnej przebudowy.

### Prześlij plik
Jeżeli praca z _git_ albo Markdown jest nieprzystępna lub niemożliwa to możesz przesłać plik w formacie [Google Docs](https://docs.google.com/document/create) na [serwer Discord GMC][gmc-discord], sformatujemy go i dodamy treść do strony.

!!! warning "Tylko nowa zawartość po angielsku"
    Ta opcja jest ograniczona tylko dla nowej treści w języku angielskim. Nie możemy wykorzystać tego sposobu dla tłumaczeń. Dla tłumaczeń wyślij [przetłumaczony plik `.md`](#dodaj-przetłumaczone-strony) poprzez [zgłoszenie](#zgłoszenia), jeżeli nie chcesz pracować bezpośrednio z _git_, ani dodać pliku poprzez interfejs GitHub.

### Tłumaczenia { #translations }
Żeby dostarczyć wsparcie dla wielu języków, nasza strona korzysta ze wtyczki [MkDocs i18n](https://github.com/ultrabug/mkdocs-static-i18n/).

#### Dodaj wsparcie dla nowego języka
Żeby wspierać nowy język, musi być dodany:

!!! danger "Wcięcia mają znaczenie"
    Musisz zachować poprawną ilość wcięć, czyli odstępów między wpisami.

1. W konfiguracji `mkdocs.yml`, w tym przykładzie dodajemy język `xx`:

    ```yaml
    plugins:
      - i18n:
          # ...
          languages:
            en:
              name: en - English
              build: true
            xx:
              name: xx - Language Name
              build: true
    ```

2. W pliku `overrides/main.html`, żeby dodać tekst ogłoszenia dla zawartości nieprzetłumaczonej:

    ```html
    {%
        set announcement = {
            "en": "This page has not yet been translated into LANGUAGE, therefore it is displayed in English.",
            "xx": "yyy",
        }
    %}
    {%
        set call_to_action = {
            "en": "Support us and translate!",
            "xx": "yyy",
        }
    %}
    ```
   
3. Odwiedź [oficjalną stronę skórki](https://squidfunk.github.io/mkdocs-material/setup/changing-the-language/).
    Upewnij się, że tłumaczenie skórki jest tam kompletne. Jeżeli nie jest, podążaj według poradnika kontrybucji skórki i wróć tutaj, nie trzeba czekać na zmiany w skórce.

#### Dodaj przetłumaczone strony
Każdy plik `.md` w folderze `docs` może mieć przetłumaczoną wersję.  
Żeby dodać tłumaczenie strony dla danego języka, stwórz kopię strony z dodaną końcówką tego języka. 
Na przykład `index.md` będzie `index.xx.md` dla języka `xx` bazując na ustawieniach z pliku `mkdocs.yml`.

Każdy nieprzetłumaczony artykuł posiada przycisk :material-web-plus: w górnym prawym rogu obok tytułu. Pozwala na szybkie dodanie tłumaczenia poprzez interfejs serwisu GitHub bez potrzeby konfiguracji plików lokalnie.

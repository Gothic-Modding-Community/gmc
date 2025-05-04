# Daedalus Language Server
[Daedalus Language Server](https://github.com/Kirides/DaedalusLanguageServer) is a language server for Gothic's scripting language - Daedalus, created by [Kirides](https://github.com/kirides). However, it is mostly known for a VSCode extension - [vscode-daedalus](https://github.com/kirides/vscode-daedalus).

!!! Warning
    This article is focused on the vscode-daedalus extension, but since DLS uses [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) it could be implemented into other editors.


## Installation
1. **Download the.vsix File**: Navigate to the [latest release page](https://github.com/kirides/vscode-daedalus/releases) of the vscode-daedalus repository on GitHub. Download the `.vsix` file associated with the latest version available.

2. **Open VSCode**: Launch Visual Studio Code on your computer.

3. **Access Extensions Tab**: Go to the Extensions view in VSCode. You can do this by clicking on the square icon on the sidebar or pressing `Ctrl+Shift+X`.

4. **Install from VSIX**: Click on the three dot icon located in the top right corner of the Extensions view to open the More Actions menu. Select the "Install from VSIX..." option.

5. **Select the.vsix File**: A file dialog will appear asking for the path to the `.vsix` file you downloaded earlier. Navigate to the location where you saved the `.vsix` file, select it, and confirm the selection.

6. **Installation Process**: VSCode will then proceed to install the Daedalus Language Server extension from the `.vsix` file. Once the installation is complete, you may need to reload VSCode to activate the new extension.

7. **Verify Installation**: After reloading, check the Extensions view again to ensure that the Daedalus Language Server extension has been successfully installed.

## Setup
Before opening a project there are some setting that have to be changed. The table below shows which CodePage you should use according to your language.

| CodePage       | Languages                                 |
| -------------- | ----------------------------------------- |
| windows-1250   | Czech, Polish, Hungarian, Romanian        |
| windows-1251   | Russian, Ukrainian                        |
| windows-1252   | German, English, French, Italian, Spanish |
| windows-1254   | Turkish                                   |

By default, DLS use windows-1252 encoding, if you want to change you have to edit the `settings.json` file. 

1. Open the Command Palette by pressing `Ctrl+Shift+P`.
2. Type `settings.json` and select the option that appears, usually labeled "Preferences: Open User Settings (JSON)".
3. Add the following lines at the end of the file (but before `}`), replacing "Windows-1250" with the appropriate code page for your language:
    ```json
    "daedalusLanguageServer.fileEncoding": "Windows-1250",
    "daedalusLanguageServer.srcFileEncoding": "Windows-1250",
    "[daedalus]": {
        "files.encoding": "windows1250"
    }
    ```

Now if you open a directory that contains e.g. `GOTHIC.SRC` file, the extension will parse it and give you all Language Server features. 
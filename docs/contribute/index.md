# How to contribute
This Gothic Modding Community is a community driven project, people are encouraged to contribute.  
This site is built with a Static Site Generator, [MkDocs](https://www.mkdocs.org/), with the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme, and multiple other MkDocs plugins.  
Depending on the scale and type of the contribution there are different kinds of prerequisites people might first need to meet.

## Feedback
To leave feedback, you can [open an issue](https://github.com/auronen/gmc/issues) via GitHub or [join us][gmc-discord] on Discord.  

## Direct contribution
Direct contribution is done via creating a copy of this repository (a fork) and [creating](https://github.com/auronen/gmc/pulls) a pull request (PR) on GitHub with changes for approval.

!!! failure "Don't waste time"  
    Please make sure the content you are contributing doesn't already exist on the [dev page](https://gmc.cokoliv.eu/). You can use the search tool to filter GMC for different keywords and contents. 

!!! question "How to write in the source files?"  
    The source files for the articles are written using the [Markdown](https://en.wikipedia.org/wiki/Markdown) `.md` file format ([Markdown cheatsheet](https://www.markdownguide.org/cheat-sheet)). On top of that this site uses [Python Markdown Extensions](https://python-markdown.github.io/extensions/) which add more syntax rules like indented [admonitions](https://python-markdown.github.io/extensions/admonition/).

### Minor changes
Minor changes like fixing typos, grammatical errors, removing/adding words to paragraphs in a _single_ file can be quickly done with the pen button in the upper right corner of each article. This will open up a GitHub editing interface which will create a fork with a patch branch after modifying the file and guide the user with opening up the pull request.

!!! warning "Select the correct branch for the pull request"  
    Make sure that the pull request is directed towards the [`dev`](https://github.com/auronen/gmc/tree/dev) or a special `pre-merge` branch and not the `main` branch.

### Major changes
More elaborate changes like editing a lot of files at once, adding new articles, images or other miscellaneous files, changing the configuration of the page is better done via external tools on your local PC. Most of those operations could be done with the GitHub interface, but it is rather cumbersome, and it's harder to spot issues during the process, as changes aren't immediately visible in the browser.  

Before working on the files, some preparation is needed, as MkDocs requires an installation of Python on the system to run, GitHub works on top of [git](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control), so an installation of _git_ is also required, therefore a basic familiarity with the Terminal/Command Prompt/Powershell window would be helpful.

#### System setup (video)
To prepare your system to run the project follow this step-by-step tutorial for [Windows](https://youtu.be/YYXdXT2l-Gg?t=351) or [macOS](https://youtu.be/YYXdXT2l-Gg?t=85) on how to install Python.

!!! question "This video is from 2017?!"
    The process of installing Python didn't change since that point, however please do install the [latest][python-download] version of Python 3.

To work remotely with GitHub install the [latest][git-download] version of _git_ on your system following [this tutorial](https://www.atlassian.com/git/tutorials/install-git). 

If you're planning to do some elaborate Python programming you can follow this step-by-step tutorial for [Windows](https://www.youtube.com/watch?v=-nh9rCzPJ20) or [macOS](https://www.youtube.com/watch?v=06I63_p-2A4) on how to set up an environment with Visual Studio Code.  

If you're just planning to edit the content of the articles with Markdown you can simply install the [latest](https://code.visualstudio.com/Download) version of Visual Studio Code for GUI _git_ management and Markdown preview or work with any other familiar text editor and omit the environment setup.

#### System setup (text)
To prepare your system to run the project follow those instructions:

1. Install the [latest][python-download] Python version.  
Make sure to select the **"Add Python to PATH"** option during the installation process.
2. Open up a Terminal/Command Prompt (cmd)/Powershell window.
3. Check that Python was properly installed with this command (might need a Terminal restart):

    ```bash
    python --version
    ```

4. Install the [latest][git-download] version of _git_ following [this tutorial](https://www.atlassian.com/git/tutorials/install-git).
5. Check that _git_ was properly installed with this command (might need a Terminal restart):

    ```bash
    git --version
    ```
   
6. (optional) Install the [latest](https://code.visualstudio.com/Download) version of Visual Studio Code for GUI _git_ management and Markdown preview. 

#### Working locally
In order to work locally:

1. [Create a fork](https://github.com/auronen/gmc/fork) on GitHub.
2. Navigate to a directory where you want to clone your forked repository and open a Terminal window inside.
3. Clone the forked repository, using this command:

    ```bash
    git clone https://github.com/user-name/forked-repository-name.git DIR-PATH
    ```
   
    Replace the `DIR-PATH` with a directory name or `.` if you're inside the directory you want the project files to be in.
   
4. (optional) Create a Virtual Environment and activate it.

    If you're working on multiple Python projects it's worthwhile to create a Virtual Environment for each project to have separate library directories with installed modules/plugins.

    ```bash
    python -m venv venv
    ```
   
    This will create a `venv` directory inside the current Terminal directory. Please keep that name as it's added to the `.gitignore` project file.  
    
    Depending on the system, use one of those commands to activate the virtual environment.

    ```bash title="Linux"
    # Linux / macOS
    source venv/bin/activate
    ```
    ```powershell title="Windows"
    # Windows Command Prompt (cmd)
    venv\Scripts\activate.bat
    # Windows Powershell
    venv\Scripts\activate.ps1
    ```

    After activation there will be a `(venv)` indicator near the Terminal prompt.

    !!! warning "Don't close the Terminal"  
        The virtual environment must be activated each time a new Terminal window is opened.

5. Install MkDocs with plugins, using this command: 

    ```bash
    pip install -r requirements.txt
    ```

    This will install all dependencies. 

6. Add the remote upstream repository and fetch the history, using this command:

    ```bash
    git remote add upstream https://github.com/auronen/gmc.git
    git fetch upstream
    ```
   
7. Checkout the upstream `dev` branch, using this command:

    ```bash
    git checkout --track upstream/dev
    ```
   
8. Checkout the new branch based on the upstream `dev` branch:

    ```bash
    git checkout -b name-of-branch
    ```
    
    An appropriate name for a branch is either a feature name or short description of what it changes ex. `3ds-articles`, `fix-typos-for-contribution`. They don't have to be elaborate, up-to 4 words.
   
9. Start a server with MkDocs, using this command:

    ```bash
    mkdocs serve
    ```

    Visit the local site with this url [`http://127.0.0.1:8000/gmc/`](http://127.0.0.1:8000/gmc/).  
    After each change to the files, they'll be rebuilt and the browser window will shortly auto-refresh.  
    The server may be closed using the `Control-C` shortcut.

10. When satisfied with a part of work, add and commit the files, using those commands:

    ```bash
    git add .
    git commit -m "add 3 articles about ZenGin"
    ```
    
    An appropriate commit message should be a sentence, describing the changes. 

11. When finished with the work, push the branch to origin and create the pull request, using this command:
    
    ```bash
    git push origin name-of-branch
    ```

12. Create the pull request to the appropriate branch.

### Submit a file
If working with _git_ or Markdown isn't acceptable, you can submit files in a Google Docs format on the [GMC Discord server][gmc-discord], and we will format and upload it to the page.

[gmc-discord]: https://discord.gg/mCpS5b5SUY
[git-download]: https://git-scm.com/downloads
[python-download]: https://www.python.org/downloads/
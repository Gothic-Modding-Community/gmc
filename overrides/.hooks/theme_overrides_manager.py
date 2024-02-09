"""MkDocs hook, which adds a backup and restore cycle for files that will be overriden.

On its own it is not that useful. It acts as the manager for other hooks.
It gathers all files from other hooks and triggers their functions.

MIT Licence 2023 Kamil Krzyśków (HRY)
"""
import enum
import filecmp
import logging
import shutil
import tempfile
from pathlib import Path
from typing import Callable, Dict, List, Optional, Set, Tuple

import jinja2
from mkdocs import plugins
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig
from mkdocs.plugins import PrefixedLogger
from mkdocs.structure.files import Files

# region Core Logic Events


@plugins.event_priority(100)
def on_config(config: MkDocsConfig) -> Optional[Config]:
    """Triggers just after the config loaded.

    Initializes the ThemeOverridesManager class to pass data between hooks.
    """

    LOG.debug('Running "on_config"')

    ThemeOverridesManager.initialize()
    config.extra[HOOK_NAME] = ThemeOverridesManager

    LOG.info("Theme overrides manager initialized")

    return None


@plugins.event_priority(-75)
def on_env(
    env: jinja2.Environment, *, config: MkDocsConfig, files: Files
) -> Optional[jinja2.Environment]:
    """Main function. Triggers just before the build begins."""

    LOG.debug('Running "on_env"')

    if not ThemeOverridesManager.all_paths_exist():
        return None

    if not ThemeOverridesManager.paths_with_processors:
        LOG.info("No file processors were registered")
        return None

    ThemeOverridesManager.create_backup()

    # Invoke each function with all available parameters
    for path, func in ThemeOverridesManager.paths_with_processors:
        func(partial=path, env=env, config=config, files=files)

    return None


# endregion

# region Closing Events


def on_build_error(*_, **__) -> None:
    """Restores backup. Triggers when the build errors, safety measure if "on_shutdown" won't trigger."""

    LOG.debug('Running "on_build_error"')

    ThemeOverridesManager.restore_backup()


def on_post_build(*_, **__) -> None:
    """Restores backup. Triggers when a build finishes."""

    LOG.debug('Running "on_post_build"')

    ThemeOverridesManager.restore_backup()


def on_shutdown(*_, **__) -> None:
    """Restores backup. Triggers when MkDocs terminates."""

    LOG.debug('Running "on_shutdown"')

    ThemeOverridesManager.restore_backup()


# endregion


# region Backup Management Class


class BackupState(enum.IntEnum):
    """Possible states for the backup process"""

    NONE: int = 10
    """None backups exist"""

    CREATED: int = 20
    """All backups exist"""


class ThemeOverridesManager:
    """Helper class, which handles the backing up of files"""

    def __init__(self):
        raise NotImplementedError("This class should have no instances.")

    @classmethod
    def initialize(cls):
        cls.backup_state = BackupState.NONE
        cls.sources = set()
        cls.paths_with_processors = []

    @classmethod
    def all_paths_exist(cls) -> bool:
        """Checks if the provided source paths exist"""

        result = True

        for src, _ in cls.paths_with_processors:
            if not src.exists():
                LOG.error(f"File doesn't exist {src}")
                result = False

        return result

    @classmethod
    def create_backup(cls) -> None:
        """Creates backup files with ".backup" suffix within the same directory as the source file."""

        for src, _ in cls.paths_with_processors:
            cls.sources.add(src)

        backup_len: int = len(cls.sources)

        LOG.info(f'Backing up {backup_len} file{"" if backup_len == 1 else "s"}...')

        for src in cls.sources:
            backup: Path = Path(f"{src}.backup")
            if backup.exists():
                LOG.info(f'Found "{backup.name}" before creation, restoring...')
                shutil.copy2(backup, src)
                assert filecmp.cmp(backup, src, shallow=False)
                continue

            shutil.copy2(src, backup)
            assert filecmp.cmp(src, backup, shallow=False)
            LOG.debug(f'Created "{backup.name}"')

        if backup_len > 0:
            cls.backup_state = BackupState.CREATED

    @classmethod
    def restore_backup(cls) -> None:
        """Restores backup files and deletes them after"""

        if cls.backup_state != BackupState.CREATED:
            return

        backup_len: int = len(cls.sources)

        LOG.info(f'Restoring {backup_len} file{"" if backup_len == 1 else "s"}...')
        for src in cls.sources:
            backup: Path = Path(f"{src}.backup")
            if not backup.exists():
                LOG.error(f'Backup "{backup.name}" doesn\'t exist')
                continue

            shutil.copy2(backup, src)
            assert filecmp.cmp(backup, src, shallow=False)
            backup.unlink()
            LOG.debug(f'Restored "{src.name}"')

        cls.backup_state = BackupState.NONE

    @classmethod
    def load_section(cls, *, partial: Path, tokens: Dict[str, str], end_level: int) -> str:
        """Load the section for a given partial together with some validation"""

        content: str = partial.read_text(encoding="utf8")
        lines: List[str] = []
        section_started: bool = False
        section_ended: bool = False

        for line in content.split("\n"):
            if tokens["START"] in line:
                section_started = True
                if end_level < 0:
                    end_level = len(line) - len(line.lstrip())

            if section_started:
                lines.append(line)
                if tokens["END"] in line and (len(line) - len(line.lstrip())) == end_level:
                    section_ended = True
                    break

        loaded_section: str = "\n".join(lines)

        # Validate that the loaded section started and ended
        # Theme update, or another dynamic hook could have removed needed tokens
        if not section_ended or not section_started:
            message: str = "started" if not section_started else "ended"
            LOG.error(f'Section in file "{partial.name}" never {message}')
            cls.write_log(loaded_section, f"{partial.name}_read_error.html")
            return ""

        # Validate that the loaded section contains all tokens
        # Theme update, or another dynamic hook could have removed needed tokens
        try:
            for value in tokens.values():
                assert value in loaded_section
        except AssertionError:
            LOG.error(f'Section mismatch in "{partial.name}"')
            log_content = ""
            for value in tokens.values():
                log_content += f"{value in loaded_section} - {value}\n"
            cls.write_log(log_content + loaded_section, f"{partial.name}_mismatch.html")
            return ""

        return loaded_section

    @classmethod
    def save_section(cls, *, partial: Path, original_section: str, modified_section: str) -> None:
        """Save partial with modified section"""

        content: str = partial.read_text(encoding="utf8")
        partial.write_text(
            data=content.replace(original_section, modified_section), encoding="utf8"
        )

    @classmethod
    def write_log(cls, content: str, file_name: str) -> None:
        """Write `content` to TEMP_DIR/`file_name`"""
        crash_log = Path(tempfile.gettempdir()) / file_name
        crash_log.write_text(data=content, encoding="utf8")
        LOG.info(f'File saved "{crash_log}"')

    backup_state: BackupState
    """Status of the backup process"""

    sources: Set[Path]
    """Set of source file paths, which will be backed up."""

    paths_with_processors: List[Tuple[Path, Callable]]
    """List of tuple pairs of file paths and their processing functions.
    
    Each function gets called with the following parameters in the `on_env` event:
    
    - partial: pathlib.Path
    - config: mkdocs.config.defaults.MkDocsConfig
    - env: jinja2.Environment
    - files: Files
    """


# endregion


# region Constants

HOOK_NAME: str = "theme_overrides_manager"
"""Name of this hook. Used in logging."""

LOG: PrefixedLogger = PrefixedLogger(
    HOOK_NAME, logging.getLogger("mkdocs.hooks.theme_overrides.__main__")
)
"""Logger instance for this hook."""

# endregion

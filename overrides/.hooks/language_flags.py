"""MkDocs hook, which adds flag emojis to the language selector, works only with the Material theme.

The hook dynamically on the fly modifies the "header.html" template of the Material theme before the build.
It restores the file after the build finishes. Works both with and without the "i18n" MkDocs plugin.

MIT Licence 2023 Kamil Krzyśków
Parts adapted from the translations.py hook
https://github.com/squidfunk/mkdocs-material/blob/master/src/.overrides/hooks/translations.py
and from the materialx.emoji and pymdownx.emoji modules.
"""
import enum
import filecmp
import logging
import shutil
import tempfile
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple, Union, Set

import jinja2
import material
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig
from pymdownx import twemoji_db, util
from pymdownx.emoji import TWEMOJI_SVG_CDN

# region Backup Management Class


class BackupManager:
    """Helper class, which handles the backing up of files"""

    class BackupState(enum.IntEnum):
        """Possible states for the backup process"""

        NONE: int = 10
        """None backups exist"""

        CREATED: int = 20
        """All backups exist"""

    backup_state: BackupState = BackupState.NONE
    """Status of the backup process"""

    _confirmed_backups: List[Tuple[Path, Path]] = []
    """List of pairs of source and backup file paths"""

    sources: Set[Path] = set()
    """List of source file paths"""

    def __init__(self):
        raise NotImplementedError("This class should have no instances.")

    @classmethod
    def create_backup(cls, *, config: MkDocsConfig) -> None:
        """Creates backup files with ".backup" suffix within the same directory as the source file."""

        for src in cls.sources:
            if str(src) not in config["extra"][HOOK_NAMESPACE]["created_backups"]:
                cls._confirmed_backups.append((src, Path(f"{src}.backup")))

        backup_len: int = len(cls._confirmed_backups)

        if not cls.sources:
            LOG.warning(
                f"{HOOK_NAME}: No sources selected for backup. You might corrupt your installation"
            )
        elif backup_len > 0:
            LOG.info(
                f'{HOOK_NAME}: Backing up {backup_len} file{"" if backup_len == 1 else "s"}...'
            )
        elif backup_len == 0:
            LOG.info(f"{HOOK_NAME}: Files already backed up")

        for src, backup in cls._confirmed_backups:
            if backup.exists():
                LOG.info(f'{HOOK_NAME}: Found "{backup.name}" before creation, restoring...')
                shutil.copy2(backup, src)
                assert filecmp.cmp(backup, src, shallow=False)
                continue

            shutil.copy2(src, backup)
            assert filecmp.cmp(src, backup, shallow=False)
            LOG.debug(f'{HOOK_NAME}: Created "{backup.name}"')
            config["extra"][HOOK_NAMESPACE]["created_backups"].add(str(src))

        if backup_len > 0:
            cls.backup_state = cls.BackupState.CREATED

    @classmethod
    def restore_backup(cls) -> None:
        """Restores backup files and deletes them after"""

        # Clear sources set for the next creation
        cls.sources.clear()

        if cls.backup_state != cls.BackupState.CREATED:
            return

        backup_len: int = len(cls._confirmed_backups)

        LOG.info(f'{HOOK_NAME}: Restoring {backup_len} file{"" if backup_len == 1 else "s"}...')
        for src, backup in cls._confirmed_backups:
            if not backup.exists():
                LOG.error(f'{HOOK_NAME}: Backup "{backup.name}" doesn\'t exist')
                continue

            shutil.copy2(backup, src)
            assert filecmp.cmp(backup, src, shallow=False)
            backup.unlink()
            LOG.debug(f'{HOOK_NAME}: Restored "{src.name}"')

        # Clear backups list for the next creation
        cls._confirmed_backups.clear()
        cls.backup_state = cls.BackupState.NONE


# endregion


# region Core Logic Events


def on_config(config: MkDocsConfig) -> Optional[Config]:
    """Triggers just after the config loaded. Initialize the namespace to pass data between hooks."""

    LOG.debug(f'{HOOK_NAME}: Running "on_config"')

    if "extra" in config and HOOK_NAMESPACE in config["extra"]:
        registrant: str = config["extra"][HOOK_NAMESPACE]["registrant"]
        LOG.info(f'{HOOK_NAME}: Using namespace registered by "{registrant}"')
        return None

    if "extra" not in config:
        config["extra"]: Dict[str, Any] = {}

    namespace: Dict[str, Any] = {
        "registrant": HOOK_NAME,
        "created_backups": set(),
    }

    config["extra"][HOOK_NAMESPACE] = namespace
    LOG.info(f'{HOOK_NAME}: Namespace "{HOOK_NAMESPACE}" registered')

    return None


def on_env(*_, config: MkDocsConfig, **__) -> Optional[jinja2.Environment]:
    """Main function. Triggers just before the build begins."""

    LOG.debug(f'{HOOK_NAME}: Running "on_env"')

    if not _is_runnable(config=config):
        return None

    partials: Path = Path(material.__file__).parent / "partials"
    header: Path = partials / "header.html"

    # Assign files to their processor functions
    file_and_processors: List[Tuple[Path, Callable]] = [
        (header, _add_flags),
    ]

    _process_files(mapping=file_and_processors, config=config)

    return None


def _is_runnable(*, config: MkDocsConfig) -> bool:
    """Make sure the hook should run."""

    if config["theme"]["name"] != "material":
        LOG.info(f'{HOOK_NAME}: Only the "material" theme is supported')
        return False

    if "extra" not in config or "alternate" not in config["extra"]:
        LOG.info(f'{HOOK_NAME}: "extra.alternate" not detected')
        return False

    if len(config["extra"]["alternate"]) < 2:
        LOG.info(f"{HOOK_NAME}: Not enough languages")
        return False

    return True


def _process_files(*, mapping: List[Tuple[Path, Callable]], config: MkDocsConfig) -> None:
    """Create backups and call each processing function."""

    # Fill out the set of source file paths
    for src, _ in mapping:
        BackupManager.sources.add(src)

    BackupManager.create_backup(config=config)

    # Invoke each function with the src Path and MkDocsConfig
    for src, func in mapping:
        func(partial=src, config=config)


def _add_flags(*, partial: Path, config: MkDocsConfig) -> None:
    """Process the "header.html" partial and add flags to the language selector template."""

    # Configure the tokens
    tokens: Dict[str, str] = {
        "START": "{% if config.extra.alternate %}",
        "CONFIG": '{% set icon = config.theme.icon.alternate or "material/translate" %}',
        "SELECTOR": '{% include ".icons/" ~ icon ~ ".svg" %}',
        "LINK": "{{ alt.name }}",
        "END": "{% endif %}",
    }

    # A negative number means the same level as the START token.
    end_indent_level: int = -1

    # Open the file and load the section
    with open(partial, encoding="utf8") as file:
        loaded_content: str = file.read()

    loaded_section: str = _load_section(
        content=loaded_content,
        tokens=tokens,
        end_level=end_indent_level,
        file_name=partial.name,
    )

    # Do not continue when section is not loaded
    if not loaded_section:
        return

    # Do not continue when section is not valid (due to some update or another hook)
    if not _is_section_valid(tokens=tokens, loaded_section=loaded_section, file_name=partial.name):
        return

    # Load all flags relevant to the current build
    flag_mapping: Dict[str, str] = {
        alt["lang"]: _flag_svg(alt["lang"]) for alt in config["extra"]["alternate"]
    }

    # Set the "flag_mapping" selector
    selector: str = "config.theme.language"

    # Change selector for the "i18n" plugin
    if "i18n" in config.plugins:
        selector = "i18n_page_locale"

    # Modify the partial
    with open(partial, "w", encoding="utf8") as file:
        file.write(
            loaded_content.replace(
                loaded_section,
                loaded_section.replace(
                    tokens["CONFIG"], "{% set flag_mapping = " + str(flag_mapping) + " %}"
                )
                .replace(tokens["SELECTOR"], "{{ flag_mapping[" + selector + "] }}")
                .replace(
                    tokens["LINK"],
                    "{{ flag_mapping[alt.lang] }} "
                    + '{{ alt.name | replace(alt.lang, "") | replace(" ", "") | replace("-", "") }}',
                ),
            )
        )

    LOG.debug(f'{HOOK_NAME}: Processed "{partial.name}".')


def _load_section(*, content: str, tokens: Dict[str, str], end_level: int, file_name: str) -> str:
    """Load the section from the content"""

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

    if not section_ended or not section_started:
        message: str = "started" if not section_started else "ended"
        LOG.error(f'{HOOK_NAME}: Section in file "{file_name}" never {message}')
        _write_log("\n".join(lines), f"{HOOK_NAME}_read_error.html")
        return ""

    return "\n".join(lines)


def _is_section_valid(*, tokens: Dict[str, str], loaded_section: str, file_name: str) -> bool:
    """Validate that the loaded section contains all tokens"""

    try:
        for value in tokens.values():
            assert value in loaded_section
    except AssertionError:
        LOG.error(f'{HOOK_NAME}: Section mismatch in "{file_name}"')
        _write_log(loaded_section, f"{HOOK_NAME}_mismatch.html")
        return False

    return True


def _flag_svg(alternate_lang: str) -> str:
    """Returns a str with a <img> tag containing the flag. Adapted from materialx.emoji and pymdownx.emoji"""

    emoji_code: str = f":flag_{COUNTRIES[alternate_lang]}:"

    shortname: str = INDEX["aliases"].get(emoji_code, emoji_code)
    emoji: Dict[str, Optional[str]] = INDEX["emoji"].get(shortname, None)

    if not emoji:
        return emoji_code

    unicode: Optional[str] = emoji.get("unicode")
    unicode_alt: Optional[str] = emoji.get("unicode_alt", unicode)

    title: str = shortname
    alt: str = shortname

    if unicode_alt is not None:
        alt = "".join((util.get_char(int(c, 16)) for c in unicode_alt.split("-")))

    return f'<img alt="{alt}" class="twemoji" src="{TWEMOJI_SVG_CDN}{unicode}.svg" title="{title}">'


def _write_log(content: str, file_name: str) -> None:
    """Write `content` to TEMP_DIR/`file_name`"""
    crash_log = Path(tempfile.gettempdir()) / file_name
    with open(crash_log, "w", encoding="utf8") as file:
        file.write(content)
    LOG.info(f'{HOOK_NAME}: File saved "{crash_log}"')


# endregion

# region Closing Events


def on_build_error(*_, **__) -> None:
    """Restores backup. Triggers when the build errors, safety measure if "on_shutdown" won't trigger."""

    LOG.debug(f'{HOOK_NAME}: Running "on_build_error"')
    BackupManager.restore_backup()


def on_post_build(*_, **__) -> None:
    """Restores backup. Triggers when a build finishes."""

    LOG.debug(f'{HOOK_NAME}: Running "on_post_build"')
    BackupManager.restore_backup()


def on_shutdown(*_, **__) -> None:
    """Restores backup. Triggers when MkDocs terminates."""

    LOG.debug(f'{HOOK_NAME}: Running "on_shutdown"')
    BackupManager.restore_backup()


# endregion

# region Constants

COUNTRIES: Dict[str, str] = {
    "af": "za",
    "ar": "ae",
    "bg": "bg",
    "bn": "bd",
    "ca": "es",
    "cs": "cz",
    "da": "dk",
    "de": "de",
    "el": "gr",
    "en": "gb",
    "eo": "eu",
    "es": "es",
    "et": "ee",
    "fa": "ir",
    "fi": "fi",
    "fr": "fr",
    "gl": "es",
    "he": "il",
    "hi": "in",
    "hr": "hr",
    "hu": "hu",
    "hy": "am",
    "id": "id",
    "is": "is",
    "it": "it",
    "ja": "jp",
    "ka": "ge",
    "ko": "kr",
    "lt": "lt",
    "lv": "lv",
    "mk": "mk",
    "mn": "mn",
    "ms": "my",
    "my": "mm",
    "nb": "no",
    "nl": "nl",
    "nn": "no",
    "pl": "pl",
    "pt-BR": "br",
    "pt": "pt",
    "ro": "ro",
    "ru": "ru",
    "sh": "rs",
    "si": "lk",
    "sk": "sk",
    "sl": "si",
    "sr": "rs",
    "sv": "se",
    "th": "th",
    "tl": "ph",
    "tr": "tr",
    "uk": "ua",
    "ur": "pk",
    "uz": "uz",
    "vi": "vn",
    "zh": "cn",
    "zh-Hant": "cn",
    "zh-TW": "tw",
}
"""Mapping of ISO 639-1 (languages) to ISO 3166 (countries)."""
# Adapted from
# https://github.com/squidfunk/mkdocs-material/blob/master/src/.overrides/hooks/translations.py

HOOK_NAME: str = "language_flags"
"""Name of this hook. Used in logging."""

HOOK_NAMESPACE: str = "material_override_hooks"
"""Namespace of this hook. Used for storing data shared between hooks."""

INDEX: Dict[str, Union[str, Dict]] = {
    "name": "twemoji",
    "emoji": twemoji_db.emoji,
    "aliases": twemoji_db.aliases,
}
"""Copy of the Twemoji index."""
# Adapted from
# materialx.emoji

LOG: logging.Logger = logging.getLogger(f"mkdocs.hooks.{HOOK_NAME}")
"""Logger instance for this hook."""

# endregion

"""MkDocs hook which adds flag emojis to the language selector, works only with the Material theme.

The hook dynamically on the fly modifies the "header.html" template of the Material theme before the build.
It restores the file after the build finishes. Works both with and without the "i18n" MkDocs plugin.

MIT License 2023 Kamil Krzyśków
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
from typing import Dict, Optional, Union, List, Tuple

import jinja2
import material
from mkdocs import plugins
from mkdocs.config.defaults import MkDocsConfig
from pymdownx import twemoji_db, util
from pymdownx.emoji import TWEMOJI_SVG_CDN

# region Backup Management Class


class BackupManager:
    """Helper class which handles the backing up of files"""

    class BackupState(enum.IntEnum):
        """Possible states for the backup process"""

        NONE: int = 10
        """None backups exist"""

        CREATED: int = 20
        """All backups exist"""

    backup_state: BackupState = BackupState.NONE
    """Status of the backup process"""

    backups: List[Tuple[Path, Path]] = []
    """List of pairs of source and backup file paths"""

    def __init__(self):
        raise NotImplementedError("This class should have no instances.")

    @classmethod
    def create_backup(cls) -> None:
        """Creates backup files with ".backup" suffix within the same directory as the source file"""
        backup_len: int = len(cls.backups)

        LOG.info(f'{HOOK_NAME}: Backing up {backup_len} file{"" if backup_len == 1 else "s"}...')
        for src, backup in cls.backups:
            if backup.exists():
                LOG.info(f'{HOOK_NAME}: Found "{backup.name}" before creation, restoring...')
                shutil.copy2(backup, src)
                assert filecmp.cmp(backup, src, shallow=False)
                continue

            shutil.copy2(src, backup)
            assert filecmp.cmp(src, backup, shallow=False)
            LOG.debug(f'{HOOK_NAME}: Created "{backup.name}"')

        cls.backup_state = cls.BackupState.CREATED

    @classmethod
    def restore_backup(cls) -> None:
        """Restores backup files and deletes them after"""
        if cls.backup_state != cls.BackupState.CREATED:
            return

        backup_len: int = len(cls.backups)

        LOG.info(f'{HOOK_NAME}: Restoring {backup_len} file{"" if backup_len == 1 else "s"}...')
        for src, backup in cls.backups:
            if not backup.exists():
                LOG.warning(f'{HOOK_NAME}: Backup "{backup.name}" doesn\'t exist')
                continue

            shutil.copy2(backup, src)
            assert filecmp.cmp(backup, src, shallow=False)
            backup.unlink()
            LOG.debug(f'{HOOK_NAME}: Restored "{src.name}"')

        cls.backup_state = cls.BackupState.NONE


# endregion


# region Core Logic Events
@plugins.event_priority(100)
def on_env(*_, config: MkDocsConfig, **__) -> Optional[jinja2.Environment]:
    """Main function. Triggers just before the build begins. Priority 100 to promote having access to the files first"""

    LOG.debug(f'{HOOK_NAME}: Running "on_env"')

    if config["theme"]["name"] != "material":
        LOG.info(f'{HOOK_NAME}: Only the "material" theme is supported')
        return None

    if "extra" not in config or "alternate" not in config["extra"]:
        LOG.info(f'{HOOK_NAME}: "extra.alternate" not detected')
        return None

    if len(config["extra"]["alternate"]) < 2:
        LOG.info(f"{HOOK_NAME}: Not enough languages")
        return None

    partials: Path = Path(material.__file__).parent / "partials"
    header: Path = partials / "header.html"

    # Fill out the list of source and backup file pairs
    if not BackupManager.backups:
        BackupManager.backups.append((header, Path(f"{header}.backup")))

    BackupManager.create_backup()

    # Process partial
    _add_flags(partial=header, config=config)

    return None


def _add_flags(*, partial: Path, config: MkDocsConfig) -> None:
    """Process the "header.html" partial and add flags to the language selector template"""

    # Configure the tokens
    tokens: Dict[str, str] = {
        "START": "{% if config.extra.alternate %}",
        "CONFIG": '{% set icon = config.theme.icon.alternate or "material/translate" %}',
        "SELECTOR": '{% include ".icons/" ~ icon ~ ".svg" %}',
        "LINK": "{{ alt.name }}",
        "END": "{% endif %}",
    }

    # A negative number means the same level as the START token
    end_indent_level: int = -1

    with open(partial, encoding="utf8") as file:
        loaded_content: str = file.read()

    lines: List[str] = []
    section_started: bool = False
    section_ended: bool = False

    for line in loaded_content.split("\n"):
        if tokens["START"] in line:
            section_started = True
            if end_indent_level < 0:
                end_indent_level = len(line) - len(line.lstrip())

        if section_started:
            lines.append(line)
            if tokens["END"] in line and (len(line) - len(line.lstrip())) == end_indent_level:
                section_ended = True
                break

    loaded_section: str = "\n".join(lines)

    if not section_ended or not section_started:
        message: str = "started" if not section_started else "ended"
        LOG.error(f'{HOOK_NAME}: Section in file "{partial.name}" never {message}')
        _write_log(loaded_section, f"{HOOK_NAME}_read_error.html")
        return

    # Validate that the loaded section contains all tokens
    try:
        for value in tokens.values():
            assert value in loaded_section
    except AssertionError:
        LOG.error(f'{HOOK_NAME}: Section mismatch in "{partial.name}"')
        _write_log(loaded_section, f"{HOOK_NAME}_mismatch.html")
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
    """Restores backup. Triggers when the build errors, safety measure if "on_shutdown" won't trigger"""

    LOG.debug(f'{HOOK_NAME}: Running "on_build_error"')
    BackupManager.restore_backup()


def on_post_build(*_, **__) -> None:
    """Restores backup. Triggers when a build finishes"""

    LOG.debug(f'{HOOK_NAME}: Running "on_post_build"')
    BackupManager.restore_backup()


def on_shutdown(*_, **__) -> None:
    """Restores backup. Triggers when mkdocs terminates or the user aborts the build via Control-C"""

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
"""Mapping of ISO 639-1 (languages) to ISO 3166 (countries)"""
# Adapted from
# https://github.com/squidfunk/mkdocs-material/blob/master/src/.overrides/hooks/translations.py

HOOK_NAME: str = "language_flags"
"""Name of the hook used in logging"""

INDEX: Dict[str, Union[str, Dict]] = {
    "name": "twemoji",
    "emoji": twemoji_db.emoji,
    "aliases": twemoji_db.aliases,
}
"""Copy of the Twemoji index"""
# Adapted from
# materialx.emoji

LOG: logging.Logger = logging.getLogger(f"mkdocs.hooks.language_flags")
"""Logger instance for this hook"""

# endregion

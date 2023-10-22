"""MkDocs hook, which adds flag emojis to the language selector.
Works only with the Material theme, and requires the "theme_overrides_manager" hook.

The hook dynamically on the fly modifies the "header.html" template of the Material theme before the build.
It uses the theme_overrides_manager hook to assure original file preservation.
Works both with and without the "i18n" MkDocs plugin.

MIT Licence 2023 Kamil Krzyśków (HRY)
Parts adapted from the translations.py hook
https://github.com/squidfunk/mkdocs-material/blob/master/src/.overrides/hooks/translations.py
and from the materialx.emoji and pymdownx.emoji modules.
"""
import logging
from pathlib import Path
from typing import Dict, Optional, Union

from jinja2 import Environment
from mkdocs.config.defaults import MkDocsConfig
from mkdocs.plugins import PrefixedLogger
from pymdownx import twemoji_db, util
from pymdownx.emoji import TWEMOJI_SVG_CDN

# region Core Logic Events


def on_env(*_, config: MkDocsConfig, **__) -> Optional[Environment]:
    """Main function. Triggers just before the build begins."""

    LOG.debug('Running "on_env"')

    if not _is_runnable(config=config):
        return None

    import material

    partials: Path = Path(material.__file__).parent / "templates" / "partials"
    header: Path = partials / "alternate.html"

    config.extra[HOOK_MANAGER].paths_with_processors.append((header, _add_flags))

    LOG.info(f"Registered processors")

    return None


def _is_runnable(*, config: MkDocsConfig) -> bool:
    """Make sure the hook should run."""

    if HOOK_MANAGER not in config["extra"]:
        LOG.info(f'"{HOOK_MANAGER}" not detected')
        return False

    if config.theme["name"] != "material":
        LOG.info('Only the "material" theme is supported')
        return False

    if "alternate" not in config["extra"]:
        LOG.info('"extra.alternate" not detected')
        return False

    if len(config["extra"]["alternate"]) < 2:
        LOG.info(f"Not enough languages")
        return False

    return True


def _add_flags(*, partial: Path, config: MkDocsConfig, **__) -> None:
    """Process the "header.html" partial and add flags to the language selector template."""

    # Configure the tokens
    tokens: Dict[str, str] = {
        "START": '<div class="md-select">',
        "CONFIG": '{% set icon = config.theme.icon.alternate or "material/translate" %}',
        "SELECTOR": '{% include ".icons/" ~ icon ~ ".svg" %}',
        "LINK": "{{ alt.name }}",
        "END": "</div>",
    }

    # A negative number means the same level as the START token.
    end_indent_level: int = -1

    override_manager = config.extra[HOOK_MANAGER]

    loaded_section: str = override_manager.load_section(
        partial=partial,
        tokens=tokens,
        end_level=end_indent_level,
    )

    # Do not continue when section is not loaded
    if not loaded_section:
        return

    # Load all flags relevant to the current build
    flag_mapping: Dict[str, str] = {
        alt["lang"]: _flag_svg(alt["lang"]) for alt in config["extra"]["alternate"]
    }

    # Set the "flag_mapping" selector
    # Choose different selector for the "i18n" plugin
    selector: str = "i18n_page_locale" if "i18n" in config.plugins else "config.theme.language"

    modified_section: str = (
        loaded_section.replace(
            tokens["CONFIG"], "{% set flag_mapping = " + str(flag_mapping) + " %}"
        )
        .replace(tokens["SELECTOR"], "{{ flag_mapping[" + selector + "] }}")
        .replace(
            tokens["LINK"],
            "{{ flag_mapping[alt.lang] }} "
            + '{{ alt.name | replace(alt.lang, "") | replace(" ", "") | replace("-", "") }}',
        )
    )

    # Modify the partial
    override_manager.save_section(
        partial=partial, original_section=loaded_section, modified_section=modified_section
    )

    LOG.debug(f'Processed "{partial.name}".')


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

HOOK_MANAGER: str = "theme_overrides_manager"
"""Name of the hook manager. Used to access it in `config.extra`."""

INDEX: Dict[str, Union[str, Dict]] = {
    "name": "twemoji",
    "emoji": twemoji_db.emoji,
    "aliases": twemoji_db.aliases,
}
"""Copy of the Twemoji index."""
# Adapted from
# materialx.emoji

LOG: PrefixedLogger = PrefixedLogger(
    HOOK_NAME, logging.getLogger(f"mkdocs.hooks.theme_overrides.{HOOK_NAME}")
)
"""Logger instance for this hook."""

# endregion

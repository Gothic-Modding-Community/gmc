"""MkDocs hook, which patches different plugins and modules used within Gothic Modding Community.

Social Plugin (from the Material theme)
- The hook fixes a crash when using theme.font.code without theme.font.text.
- The hook overrides the `theme.logo` file lookup to use the custom_dir instead of the docs_dir.
- The hook does not override `theme.logo.icon` file lookup.

Pygments Lexers (used to highlight code)
- The hooks decorates the pygments.lexers.get_lexer_by_name function adding cache to it

MIT Licence 2023 Kamil "HRY" Krzyśków
"""
from copy import deepcopy
from pathlib import Path
from typing import Optional

from mkdocs import plugins
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig

from pymdownx import highlight
from pygments import lexers


@plugins.event_priority(100)
def on_config(config: MkDocsConfig) -> Optional[Config]:
    for name in {"social", "material/social"}:
        social_plugin = config.plugins.get(name)
        if social_plugin:
            social_plugin._load_font = patch_font_crash(social_plugin._load_font)
            social_plugin._load_logo = patch_custom_dir(social_plugin._load_logo)
            break
    else:
        print("Social-Plugin-Patch: Did not find plugin!?!?!")

    highlight.get_lexer_by_name = patch_lexers_cache(lexers.get_lexer_by_name)
    lexers.get_lexer_by_name = patch_lexers_cache(lexers.get_lexer_by_name)

    return None


class Mock:
    ...


def patch_font_crash(func):
    """Patch the theme["font"]["text"] crash"""

    def wrap_load_font(config):
        theme = config.theme
        if "font" in theme and "text" not in theme["font"]:
            mock_config = Mock()
            mock_config.theme = deepcopy(config.theme)
            mock_config.theme["font"]["text"] = "Roboto"
            return func(mock_config)
        return func(config)

    return wrap_load_font


def patch_custom_dir(func):
    """Patch support for paths in `custom_dir`"""

    def wrap_load_logo(config):
        mock_config = Mock()
        mock_config.theme = config.theme
        mock_config.docs_dir = str(Path(config.docs_dir).parent / CUSTOM_DIR_PATH)
        return func(mock_config)

    return wrap_load_logo


def patch_lexers_cache(func):
    """Patch cache into the get_lexer_by_name function"""

    def wrap_get_lexer_by_name(alias, **options):
        cached_class = LEXER_CLASS_CACHE.get(alias)

        if cached_class:
            return cached_class(**options)

        lexer = func(alias, **options)
        LEXER_CLASS_CACHE[alias] = lexer.__class__
        return lexer

    return wrap_get_lexer_by_name


CUSTOM_DIR_PATH = "overrides"
"""A relative path to the custom directory based from the `docs_dir` parent directory."""

LEXER_CLASS_CACHE = {}
"""Lexer class cache directory for patch_lexers_cache"""

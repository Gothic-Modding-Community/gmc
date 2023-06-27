"""MkDocs hook, which patches the Social plugin of the Material theme.

The hook fixes a crash when using theme.font.code without theme.font.text.
The hook overrides the `theme.logo` file lookup to use the custom_dir instead of the docs_dir.
The hook does not override `theme.logo.icon` file lookup.

MIT Licence 2023 Kamil Krzyśków
"""
from copy import deepcopy
from pathlib import Path
from typing import Optional

from mkdocs import plugins
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig


@plugins.event_priority(100)
def on_config(config: MkDocsConfig) -> Optional[Config]:
    for name in {"social", "material/social"}:
        plugin = config.plugins.get(name)
        if plugin:
            break
    else:
        print("Social-Plugin-Patch: Did not find plugin!?!?!")
        return None

    plugin._load_font = patch_font_crash(plugin._load_font)
    plugin._load_logo = patch_custom_dir(plugin._load_logo)

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


CUSTOM_DIR_PATH = "overrides"
"""A relative path to the custom directory based from the `docs_dir` parent directory."""

"""MkDocs hook, which patches different plugins and modules used within Gothic Modding Community.

Social Plugin (from the Material theme)
- The hook fixes a crash when using theme.font.code without theme.font.text.
- The hook overrides the `theme.logo` file lookup to use the custom_dir instead of the docs_dir.
- The hook does not override `theme.logo.icon` file lookup.
- The hook overrides the `on_page_markdown` function to make it compatible with the i18n plugin 

Pygments Lexers (used to highlight code)
- The hook decorates the pygments.lexers.get_lexer_by_name function,
  adding cache for custom lexers, like the Gothic Lexer used in GMC

i18n Plugin (mkdocs-static-i18n)
- The hook creates redirects for all built alternate languages using the mkdocs-redirects plugin
- The hook merges nav_translations of alternate languages with the default language

MIT Licence 2023 Kamil "HRY" Krzyśków
"""
import logging
from copy import deepcopy
from pathlib import Path
from typing import Optional

from mkdocs import plugins
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig
from mkdocs.plugins import PrefixedLogger
from pygments import lexers
from pymdownx import highlight


@plugins.event_priority(100)
def on_config(config: MkDocsConfig) -> Optional[Config]:
    social_plugin = config.plugins.get("material/social") or config.plugins.get("social")
    i18n_plugin = config.plugins.get("i18n")
    redirects_plugin = config.plugins.get("redirects")

    has_been_patched = hasattr(config.extra, "all_plugin_patch")

    # these patches can be run multiple times
    # as they are aware of multiple executions
    if i18n_plugin and redirects_plugin:
        process_i18n_redirects(has_been_patched, i18n_plugin, redirects_plugin)

    # the rest of the patches only need to be applied once
    # as they aren't aware of multiple executions
    if has_been_patched:
        return None

    LOG.info("Adding cache to custom lexers")

    highlight.get_lexer_by_name = patch_lexers_cache(lexers.get_lexer_by_name)
    lexers.get_lexer_by_name = patch_lexers_cache(lexers.get_lexer_by_name)

    if social_plugin:
        LOG.info("Fixing possible social card plugin crash")
        social_plugin._load_font = patch_social_font_crash(social_plugin._load_font)
        social_plugin._load_logo = patch_social_custom_dir(social_plugin._load_logo)

    if i18n_plugin:
        process_i18n_nav_translations(i18n_plugin)

    return None


@plugins.event_priority(100)
def on_env(env, config, **_):
    has_been_patched = hasattr(config.extra, "all_plugin_patch")
    if not has_been_patched:
        LOG.info("Enabling simple whitespace trimming in the Jinja2 environment")

    env.trim_blocks = True
    env.lstrip_blocks = True

    return env


@plugins.event_priority(100)
def on_post_build(config) -> None:
    has_been_patched = hasattr(config.extra, "all_plugin_patch")
    if has_been_patched:
        return

    social_plugin = config.plugins.get("material/social") or config.plugins.get("social")
    i18n_plugin = config.plugins.get("i18n")

    if social_plugin and i18n_plugin:
        LOG.info("Wrapping social plugin to prevent overlapping file names")
        process_social_cards_i18n(config, social_plugin, i18n_plugin)

    config.extra.all_plugin_patch = True


class Mock:
    ...


def patch_social_font_crash(func):
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


def patch_social_custom_dir(func):
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


def process_i18n_redirects(has_been_patched, i18n_plugin, redirects_plugin):
    import mkdocs_redirects.plugin as module

    # clear the redirects_maps in the alternate builds,
    # because everything is created in the default build
    if has_been_patched:
        redirects_plugin.config["redirect_maps"].clear()
        return

    # assert API is available to change
    if not hasattr(module, "write_html"):
        LOG.warning("Current version of mkdocs-redirects plugin isn't compatible with the patch")
        return

    LOG.info("Wrapping mkdocs-redirects to also create redirects for alternate languages")

    def write_html_decorator(func):
        def write_html_wrapper(site_dir, old_path, new_path):
            # write html for default build
            func(site_dir, old_path, new_path)
            # write html for each built alternate
            for lang in i18n_plugin.config.languages:
                if lang.build is True and lang.default is False:
                    func(site_dir, lang.link[1:] + old_path, new_path)

        return write_html_wrapper

    module.write_html = write_html_decorator(module.write_html)


def process_i18n_nav_translations(i18n_plugin):
    for lang in i18n_plugin.config.languages:
        if lang.default is True:
            default_translations = lang.nav_translations or {}

    if not default_translations:
        return

    LOG.info("Merging nav_translations of alternate languages with default")

    for lang in i18n_plugin.config.languages:
        if lang.default is False and lang.build is True:
            lang.nav_translations = {**default_translations, **(lang.nav_translations or {})}


def process_social_cards_i18n(config, social_plugin, i18n_plugin):
    """
    The social plugin uses the page.file.src_path and page.file.src_uri
    to generate both the card image filename and html meta tag url to that file.
    To avoid overwriting the default language cards, when another language page
    isn't translated it's required to wrap the plugin's on_page_markdown event
    and provide the page object with replaced values
    TODO The Insiders Social Plugin could behave differently, and the wrapper might not work
    """

    def on_page_markdown_decorator(func):
        def on_page_markdown_wrapper(markdown, page, config, files):
            src_path = Path(page.file.src_path)

            # if the source path has multiple suffixes it won't override the default language
            if len(src_path.suffixes) > 1:
                return func(markdown, page, config, files)

            src_uri = Path(page.file.src_uri)

            page.file.src_path = str(
                src_path.parent / f"{src_path.stem}.{i18n_plugin.current_language}{src_path.suffix}"
            )
            page.file.src_uri = (
                src_uri.parent / f"{src_uri.stem}.{i18n_plugin.current_language}{src_uri.suffix}"
            ).as_posix()

            output = func(markdown, page, config, files)

            # restore the page object paths to initial state
            page.file.src_path = str(src_path)
            page.file.src_uri = src_uri.as_posix()

            return output

        return on_page_markdown_wrapper

    for i, event in enumerate(config.plugins.events["page_markdown"]):
        if not hasattr(event, "__self__"):
            continue
        if event.__self__.__class__ is social_plugin.__class__:
            config.plugins.events["page_markdown"][i] = on_page_markdown_decorator(event)
            break


CUSTOM_DIR_PATH = "overrides"
"""A relative path to the custom directory based from the `docs_dir` parent directory."""

HOOK_NAME: str = "all_plugin_patch"
"""Name of this hook. Used in logging."""

LEXER_CLASS_CACHE = {}
"""Lexer class cache dictionary for patch_lexers_cache"""

LOG: PrefixedLogger = PrefixedLogger(HOOK_NAME, logging.getLogger(f"mkdocs.hooks.{HOOK_NAME}"))
"""Logger instance for this hook."""

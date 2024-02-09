"""Hook that manages the preferences.md page, primarily i18n dynamics.
"""
import re

from mkdocs import plugins
from mkdocs.config.defaults import MkDocsConfig
from mkdocs.structure.files import Files
from mkdocs.structure.pages import Page


@plugins.event_priority(100)
def on_page_markdown(
    markdown: str, /, *, page: Page, config: MkDocsConfig, files: Files
) -> str | None:
    if "preferences_i18n" not in page.meta:
        return markdown

    default_lang_code: str = "en"
    lang_code: str = (
        config.theme["language"]
        if config.theme["language"] in page.meta["preferences_i18n"]
        else default_lang_code
    )
    current_i18n: dict[str, str] = {
        **page.meta["preferences_i18n"][default_lang_code],
        **page.meta["preferences_i18n"][lang_code],
    }
    tokens: list[str] = re.findall(r"\{\{.*?}}", markdown)

    for token in tokens:
        short_token = token.lstrip("{{").rstrip("}}").strip()
        markdown = markdown.replace(token, current_i18n[short_token])

    # print(1, lang_code)
    # print(2, current_i18n)
    # print(3, tokens)

    return markdown

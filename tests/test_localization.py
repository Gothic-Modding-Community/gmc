"""
Test suite to check if everything related to localization is in order.
"""
import glob
import json
import os
import unittest
import regex

# noinspection PyPackageRequirements
import yaml

from tests.path_constants import DOCS_DIR, OVERRIDES_DIR, ROOT_DIR


class LocalizationTest(unittest.TestCase):
    """
    Localization TestCase Class
    """

    config: dict = None

    @classmethod
    def setUpClass(cls) -> None:
        with open(os.path.join(ROOT_DIR, "mkdocs.yml"), encoding="utf8") as file:
            lines = file.readlines()

        # The default safe loader doesn't handle values containing !, they're not needed for localization
        # for the exception of !ENV which are important
        lines = [regex.sub(r"!ENV.*,\s*?(\w+)\]", r"\g<1>", line) for line in lines]
        output = "\n".join([regex.sub(r"!.*", "false", line) for line in lines])

        for plugin in yaml.safe_load(output)["plugins"]:
            if isinstance(plugin, dict):
                cls.config = plugin.get("i18n")
            if cls.config is not None:
                break

    def setUp(self) -> None:
        self.assertIsNot(self.config, None, msg="Localization config is None")

    def test_default(self) -> None:
        """
        Test that the default language is properly set, and that all languages are built
        """
        default = "en"
        self.assertEqual(
            self.config["default_language"], default, msg=f"Default must be '{default}'"
        )
        self.assertTrue(
            default in self.config["languages"], msg=f"Language selector must contain '{default}'"
        )
        self.assertFalse(
            self.config["default_language_only"], msg=f"All languages must be deployed"
        )

    def test_announcement(self) -> None:
        """
        Test that every localization has an announcement for untranslated content
        """
        languages = list(self.config["languages"].keys())
        languages.remove("en")

        with open(os.path.join(OVERRIDES_DIR, "main.html"), encoding="utf8") as file:
            main = file.read()

        announcement_token = "set announcement = {"
        action_token = "set call_to_action = {"

        announcement_start = main.find(announcement_token)

        self.assertNotEqual(announcement_start, -1, msg="main.html must contain announcement dict")

        action_start = main.find(action_token)

        self.assertNotEqual(action_start, -1, msg="main.html must contain call_to_action dict")

        announcement_end = main.find(" }", announcement_start)
        action_end = main.find(" }", action_start)

        self.assertNotEqual(announcement_end, -1, msg="dicts open but doesn't close them?")
        self.assertNotEqual(announcement_end, action_end, msg="dicts share the closing '}' tag")

        announcement_start = announcement_start + len(announcement_token) - 1
        action_start = action_start + len(action_token) - 1

        announcement_content = main[announcement_start : announcement_end + 2]
        action_content = main[action_start : action_end + 2]

        announcement = json.loads(
            regex.sub(r",\s*}", "}", regex.sub(r"\s+", " ", announcement_content))
        )
        action = json.loads(regex.sub(r",\s*}", "}", regex.sub(r"\s+", " ", action_content)))

        for language in languages:
            self.assertTrue(
                language in announcement and language in action,
                msg=f"'{language}' is missing from at least one of the announcement dicts in main.html",
            )
            self.assertTrue(
                len(announcement[language]) > 0 and len(action[language]) > 0,
                msg=f"'{language}' is empty in at least one of the announcement dicts in main.html",
            )

    def test_files(self) -> None:
        """
        Test that each localized file has exactly 1 English equivalent
        """
        paths = glob.glob("**/*.*.md", root_dir=DOCS_DIR, recursive=True)
        for path in paths:
            if path.endswith(".en.md"):
                continue

            default_path = os.path.join(DOCS_DIR, regex.sub(r"\.[a-z]{2}\.md", ".md", path))
            en_path = os.path.join(DOCS_DIR, regex.sub(r"\.[a-z]{2}\.md", ".en.md", path))

            path_exists = os.path.exists(en_path) or os.path.exists(default_path)
            self.assertTrue(path_exists, msg=f"Path '{path}' doesn't have any English equivalent")

            only_one_en = not (os.path.exists(en_path) and os.path.exists(default_path))
            self.assertTrue(only_one_en, msg=f"Path '{path}' has 2 English equivalent files")


if __name__ == "__main__":
    unittest.main()

"""
Test suite to check if everything related to localization is in order.
"""
import glob
import json
import os
import unittest

import regex

# noinspection PyPackageRequirements
from mkdocs.utils import yaml_load
from path_constants import DOCS_DIR, OVERRIDES_DIR, ROOT_DIR


class LocalizationTest(unittest.TestCase):
    """
    Localization TestCase Class
    """

    config: dict = None
    settings_to_check: list[tuple] = None
    expected_settings: dict = None

    @classmethod
    def setUpClass(cls) -> None:
        with open(os.path.join(ROOT_DIR, "mkdocs.yml"), encoding="utf8") as file:
            content = file.read()

        # Extract the ENV options, and assert that the selected boolean variables
        # are set to the correct boolean values (aka weren't changed by mistake)
        dirty_settings = regex.findall(r"\s*(.*?):\s*!ENV\s*\[(.*?)\]", content)
        cls.settings_to_check = []

        # Assure only controlled cases use undefined fallback values
        allow_undefined = {
            "GMC_DEV_LOCALE",
        }

        # some settings might have multiple !ENV toggles, so the catch all regex
        # result needs to be cleaned up
        for setting_group in dirty_settings:
            if len(setting_group) != 2:
                raise ValueError("Unhandled case setting_group isn't 2 values")

            prop_name, envar = setting_group

            fallback_value = None
            splitted = list(map(str.strip, envar.split(",")))

            if splitted[-1].lower() in {"true", "false"} or "'" in splitted[-1]:
                fallback_value = eval(splitted.pop())

            if fallback_value is None:
                for var in splitted:
                    if var not in allow_undefined:
                        raise ValueError(
                            f"{prop_name} - {envar} should also define a default fallback"
                        )
            else:
                for var in splitted:
                    cls.settings_to_check.append((prop_name, var, fallback_value))

        cls.expected_settings = {
            "GMC_ENABLE_ON_PUBLISH": False,
            "GMC_BUILD_ALTERNATES": False,
        }

        for plugin in yaml_load(content)["plugins"]:
            if isinstance(plugin, dict):
                cls.config = plugin.get("i18n")
            if cls.config is not None:
                break

    def setUp(self) -> None:
        self.assertIsNot(self.config, None, msg="Localization config is None")
        for setting_name, envar_name, actual in self.settings_to_check:
            if envar_name not in self.expected_settings:
                continue
            expected = self.expected_settings[envar_name]
            self.assertEqual(
                actual,
                expected,
                msg=f"Setting '{setting_name}'->{envar_name} is set to {actual} instead of {expected}",
            )

    def test_default(self) -> None:
        """
        Test that the default language is properly set, and that all languages are built
        """
        default = "en"
        default_present = False

        for lang in self.config["languages"]:
            lang_default = lang.get("default", False)
            if lang["locale"] == default:
                default_present = True
                self.assertTrue(lang_default, msg=f"'{default}' must be set Default")
            else:
                self.assertFalse(lang_default, msg=f"Only '{default}' can be set Default")
            self.assertTrue(
                lang["build"], msg=f"All languages must be deployed - '{lang['locale']}' isn't"
            )

        self.assertTrue(default_present, msg=f"Language selector must contain '{default}'")

    def test_announcement(self) -> None:
        """
        Test that every localization has an announcement for untranslated content
        """
        languages: list = self.config["languages"]

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
            locale = language["locale"]
            self.assertTrue(
                locale in announcement and locale in action,
                msg=f"'{locale}' is missing from at least one of the announcement dicts in main.html",
            )
            self.assertTrue(
                len(announcement[locale]) > 0 and len(action[locale]) > 0,
                msg=f"'{locale}' is empty in at least one of the announcement dicts in main.html",
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

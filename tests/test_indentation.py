"""
Test suite to check if the indentation of the .md is mostly correct.
"""
import glob
import os
import unittest

TESTS_DIR_PATH = os.path.abspath(os.path.dirname(__file__))
DOCS_ROOT = os.path.join(TESTS_DIR_PATH, "..", "docs")


class IndentationTest(unittest.TestCase):
    """
    Indentation TestCase Class
    """

    admonition_prefixes = ("!!!", "???", "===")

    def test_admonitions(self) -> None:
        """
        Test that the indentation after the admonition line is properly indented
        TODO might be reasonable to change the inside_admonition = False logic
        """
        paths = glob.glob("**/*.md", root_dir=DOCS_ROOT, recursive=True)
        for path in paths:
            file_path = os.path.join(DOCS_ROOT, path)

            with open(file_path, encoding="utf8") as file:
                lines = file.readlines()

            last_line = ""
            inside_admonition = False

            for line in lines:
                if inside_admonition:
                    if last_line.startswith(self.admonition_prefixes):
                        self.assertTrue(
                            line.strip(),
                            "The starting line of the admonition shouldn't be empty\n"
                            f"File: {file_path}\n"
                            f"Admonition line: {last_line}",
                        )
                        self.assertTrue(
                            len(line) - len(line.lstrip(" ")) == 4,
                            f"The admonition content has to start with 4 spaces\n"
                            f"File: {file_path}\n"
                            f"Admonition line: {last_line}",
                        )
                    elif (
                        len(last_line) - len(last_line.lstrip(" ")) == 4 or not last_line.strip()
                    ) and line.lstrip(" ") == line:
                        inside_admonition = False

                if line.startswith(self.admonition_prefixes):
                    inside_admonition = True

                last_line = line

        print(f"✅Tested {len(paths)} paths")


if __name__ == "__main__":
    unittest.main()

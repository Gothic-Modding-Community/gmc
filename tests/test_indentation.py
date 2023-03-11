"""
Test suite to check if the indentation of the .md is mostly correct.
"""
import glob
import os
import unittest

import mkdocs.utils.meta

from tests.path_constants import DOCS_DIR


class IndentationTest(unittest.TestCase):
    """
    Indentation TestCase Class
    """

    admonition_prefixes = ("!!!", "???", "===")
    list_prefixes = ("-", "+", "*")
    codeblock_prefix = "```"

    def test_admonitions_and_lists(self) -> None:
        """
        Test that the indentation of admonitions and lists is correct
        """
        paths = glob.glob("**/*.md", root_dir=DOCS_DIR, recursive=True)
        for path in paths:
            file_path = os.path.join(DOCS_DIR, path)

            with open(file_path, encoding="utf-8-sig") as file:
                source = file.read()

            contents, meta = mkdocs.utils.meta.get_data(source)

            last_line = ""
            inside_admonition = False
            admonition_valid = False
            inside_codeblock = False
            inside_list = False

            for n, line in enumerate(contents.split("\n"), start=1):
                if inside_admonition and admonition_valid:
                    if line.lstrip(" ") == line:
                        inside_admonition = False

                if inside_admonition and line.strip():
                    self.assertTrue(
                        len(line) - len(line.lstrip(" ")) >= 4,
                        f"The admonition content has to start with 4 or more spaces\n"
                        f"File: {file_path}\n"
                        f"Line:{n}: {line}",
                    )
                    admonition_valid = True

                if line.startswith(self.admonition_prefixes):
                    inside_admonition = True
                    admonition_valid = False

                if line.startswith(self.codeblock_prefix):
                    inside_codeblock = not inside_codeblock

                if line.strip() == "":
                    inside_list = False

                # TODO rewrite it someday with regex
                if line.startswith(self.list_prefixes) and not inside_codeblock:
                    self.assertTrue(
                        len(line) >= 2,
                        "List entries must have content\n"
                        f"File: {file_path}\n"
                        f"Line:{n}: {line}",
                    )
                    if line[1] == " ":
                        self.assertTrue(
                            last_line.strip() == ""
                            or last_line.strip().startswith(self.list_prefixes)
                            or last_line.strip().startswith("#")
                            or inside_list,
                            "Lists need to have an empty line before them\n"
                            f"File: {file_path}\n"
                            f"Line:{n}: {line}",
                        )
                        inside_list = True

                    self.assertTrue(
                        line[1] == " " or (line[0] == "*" and line.count("*") % 2 == 0),
                        "List markers need to be separated by a space\n"
                        f"File: {file_path}\n"
                        f"Line:{n}: '{line}'",
                    )

                last_line = line

            self.assertTrue(
                not inside_codeblock, f"File: {file_path} ended without closing a codeblock"
            )

        print(f"✅Tested {len(paths)} paths")


if __name__ == "__main__":
    unittest.main()

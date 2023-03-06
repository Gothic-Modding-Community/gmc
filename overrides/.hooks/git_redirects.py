"""MkDocs hook that fills out the redirection mapping based on the Git commit history.

The hook uses GitPython to iterate over the commit history constrained
by the `MAX_DATE` and `MAX_HASH` constants. It checks the diff between 2 adjacent commits
and processes the diff items marked with the "R" (moved/renamed) status.

MIT Licence 2023 Kamil Krzyśków
"""
import datetime
import logging
from pathlib import Path
from typing import Dict, Optional, Set

try:
    from git import Repo
except (ModuleNotFoundError, ImportError):
    GIT_MODULE = False
else:
    GIT_MODULE = True
from mkdocs.config import Config
from mkdocs.config.defaults import MkDocsConfig

# region Core Logic


def on_config(config: MkDocsConfig) -> Optional[Config]:
    """Main function. Check the `redirects` plugin is present and fill the redirects mapping."""

    if not GIT_MODULE:
        LOG.warning(f"{HOOK_NAME}: The `GitPython` module is not installed")
        return None

    if "redirects" not in config["plugins"]:
        LOG.warning(f"{HOOK_NAME}: The `redirects` plugin is not in the config")
        return None

    if "redirect_maps" not in config["plugins"]["redirects"].config:
        LOG.warning(f"{HOOK_NAME}: The `redirects` plugin is not configured correctly")
        return None

    _add_redirects_based_on_git_history(config=config)

    return None


def _add_redirects_based_on_git_history(*, config: MkDocsConfig) -> None:
    """Process the Git history looking for rename actions."""

    docs_dir: Path = Path(config.get("docs_dir"))
    file_paths: Set[str] = {str(path) for path in docs_dir.glob("**/*.md")}
    docs_prefix: str = docs_dir.name + "/"
    project_root: Path = docs_dir.parent

    redirects: Dict[str, str] = config["plugins"]["redirects"].config["redirect_maps"]
    initial_len: int = len(redirects)

    LOG.info(f"{HOOK_NAME}: Processing Git history...")

    for commit in Repo(project_root).iter_commits(since=MAX_DATE):
        if not commit.parents:
            break

        for diff in commit.parents[-1].diff(commit).iter_change_type(change_type="R"):
            old: str = diff.rename_from
            new: str = diff.rename_to

            old_parts_len: int = len(old.split("/")[-1].split("."))
            new_parts_len: int = len(new.split("/")[-1].split("."))
            old_exists: bool = str(project_root / old) in file_paths
            old_index_exists: bool = str(project_root / old.replace(".md", "/index.md")) in file_paths

            type_md: bool = old.endswith(".md") and new.endswith(".md")
            inside_docs: bool = old.startswith(docs_prefix) and new.startswith(docs_prefix)
            name_ext: bool = old_parts_len == 2 and new_parts_len == 2
            old_conflicts: bool = old_exists or (
                config.get("use_directory_urls") and old_index_exists
            )

            if not type_md or not inside_docs or not name_ext or old_conflicts:
                continue

            old_inner = old.replace(docs_prefix, "", 1)
            new_inner = new.replace(docs_prefix, "", 1)

            # Avoid creating redirection chains
            if new_inner in redirects:
                new_inner = redirects[new_inner]
            elif str(project_root / new) not in file_paths:
                continue

            if old_inner not in redirects:
                redirects[old_inner] = new_inner
            else:
                LOG.info(f"{HOOK_NAME}: '{old_inner}' already in redirects, keeping more recent one")

        if commit.hexsha == MAX_HASH:
            break

    len_diff: int = len(redirects) - initial_len

    if len_diff > 0:
        LOG.info(f"{HOOK_NAME}: Created {len_diff} redirects")


# endregion

# region Constants

HOOK_NAME: str = "git_redirects"
"""Name of this hook. Used in logging."""

LOG: logging.Logger = logging.getLogger(f"mkdocs.hooks.{HOOK_NAME}")
"""Logger instance for this hook."""

# MAX_DATE: datetime.datetime = datetime.datetime.now() - datetime.timedelta(days=99)
MAX_DATE: Optional[datetime.datetime] = datetime.datetime.fromisoformat("2023-02-25")
"""The oldest included commit date in the history lookup."""

MAX_HASH: Optional[str] = "08f09465b85f17e327759278fe09582fcdaeda7a"
"""The oldest included commit hash in the history lookup."""

# endregion

"""MkDocs hook that fills out the redirection mapping based on the Git commit history.

The hook uses GitPython to iterate over the commit history constrained
by the `MAX_DATE` and `MAX_HASH` constants. It checks the diff between 2 adjacent commits
and processes the diff items marked with the "R" (moved/renamed) status.

MIT Licence 2023 Kamil Krzyśków
"""
import datetime
import json
import logging
import os
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

    try:
        hook_enabled = custom_getenv(HOOK_VAR, False)
    except ValueError as err:
        LOG.error(f"{HOOK_NAME}: {err}")
        return None

    if not hook_enabled:
        LOG.info(f"{HOOK_NAME}: {HOOK_VAR} is not set to True in the environment")
        return None

    if not GIT_MODULE:
        LOG.warning(f"{HOOK_NAME}: The `GitPython` module is not installed")
        return None

    if "redirects" not in config["plugins"]:
        LOG.warning(f"{HOOK_NAME}: The `redirects` plugin is not in the config")
        return None

    if "redirect_maps" not in config["plugins"]["redirects"].config:
        LOG.warning(f"{HOOK_NAME}: The `redirects` plugin is not configured correctly")
        return None

    if config.extra.get("git_redirects_finished", False):
        LOG.info(f"{HOOK_NAME}: MkDocsConfig wasn't reset since last run, skipping run...")
        return None

    try:
        cache_enabled = custom_getenv(CACHE_VAR, False)
    except ValueError as err:
        LOG.error(f"{HOOK_NAME}: {err}")
        return None

    if cache_enabled:
        CacheHelper.setup(config=config)
        commit_hash = _add_redirects_based_on_git_history(config=config, cache_enabled=True)
        if commit_hash is not None and commit_hash != CacheHelper.cache_obj["commit_hash"]:
            CacheHelper.cache_obj["commit_hash"] = commit_hash
            CacheHelper.save(config=config)
    else:
        _add_redirects_based_on_git_history(config=config)

    config.extra["git_redirects_finished"] = True

    return None


# Credit to https://stackoverflow.com/a/65407083
def custom_getenv(name: str, default_value: bool = None):
    positive: tuple[str] = ("true", "1")
    negative: tuple[str] = ("false", "0")
    value: str = os.getenv(name, None)

    if value is None:
        if default_value is None:
            raise ValueError(f"Variable '{name}' is not set and no default provided!")
        else:
            value = str(default_value)

    if value.lower() not in positive + negative:
        raise ValueError(f"Invalid value '{value}' for variable '{name}'")

    return value.lower() in positive


def _add_redirects_based_on_git_history(
    *, config: MkDocsConfig, cache_enabled: bool = False
) -> Optional[str]:
    """Process the Git history looking for rename actions."""

    docs_dir: Path = Path(config.get("docs_dir"))
    docs_prefix: str = docs_dir.name + "/"
    project_root: Path = docs_dir.parent
    repo = Repo(project_root)

    redirects: Dict[str, str] = config["plugins"]["redirects"].config["redirect_maps"]
    if cache_enabled:
        redirects.update(CacheHelper.cache_obj["redirects"])

    if MAX_HASH and len(repo.commit(MAX_HASH).parents) > 1:
        LOG.warning(f"{HOOK_NAME}: Using a Merge commit revision for 'MAX_HASH' is not supported")
        return None

    if cache_enabled and repo.head.commit.hexsha == CacheHelper.cache_obj["commit_hash"]:
        LOG.info(f"{HOOK_NAME}: HEAD commit already cached")
        return None

    file_paths: Set[str] = {str(path) for path in docs_dir.glob("**/*.md")}

    initial_len: int = len(redirects)

    LOG.info(f"{HOOK_NAME}: Processing Git history with{'' if cache_enabled else 'out'} cache...")

    for commit in repo.iter_commits(since=MAX_DATE, max_parents=1):
        if not commit.parents:
            break

        for diff in commit.parents[0].diff(commit).iter_change_type(change_type="R"):
            old: str = diff.rename_from
            new: str = diff.rename_to

            old_parts_len: int = len(old.split("/")[-1].split("."))
            new_parts_len: int = len(new.split("/")[-1].split("."))
            old_exists: bool = str(project_root / old) in file_paths
            old_index_exists: bool = (
                str(project_root / old.replace(".md", "/index.md")) in file_paths
            )

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
                LOG.info(
                    f"{HOOK_NAME}: '{old_inner}' already in redirects, keeping more recent one"
                )

        if commit.hexsha == MAX_HASH:
            break

        if cache_enabled and commit.parents[0].hexsha == CacheHelper.cache_obj["commit_hash"]:
            LOG.info(f"{HOOK_NAME}: Reached cached commits")
            break

    len_diff: int = len(redirects) - initial_len

    if len_diff > 0:
        LOG.info(f"{HOOK_NAME}: Created {len_diff} redirects")

    if cache_enabled:
        return repo.head.commit.hexsha


class CacheHelper:
    """Class contains variables related to caching"""

    cache_dir: Optional[Path] = None
    """Directory path to the plugin cache directory"""

    cache_file: Optional[Path] = None
    """File path where the cached redirects will be saved"""

    cache_obj: Optional[Dict] = None
    """Object, which will be saved to cache"""

    @classmethod
    def setup(cls, *, config: MkDocsConfig) -> None:
        cls.cache_dir = Path(config.get("docs_dir")).parent / CACHE_PATH
        formatted_date: str = (
            MAX_DATE.isoformat().replace(":", "") if isinstance(MAX_DATE, datetime.datetime) else ""
        )
        cls.cache_file = cls.cache_dir / f"{formatted_date}-{MAX_HASH}.json"

        if cls.cache_file.exists():
            cls.cache_obj = json.loads(cls.cache_file.read_text(encoding="utf8"))
        else:
            cls.cache_obj: Dict = {"commit_hash": "", "redirects": {}}
            cls.cache_dir.mkdir(parents=True, exist_ok=True)
            cls.cache_file.write_text(json.dumps(cls.cache_obj), encoding="utf8")

    @classmethod
    def save(cls, *, config: MkDocsConfig) -> None:
        cls.cache_obj["redirects"] = config["plugins"]["redirects"].config["redirect_maps"]
        cls.cache_file.write_text(json.dumps(cls.cache_obj, indent=2), encoding="utf8")


# endregion

# region Constants
CACHE_VAR: str = "GMC_ENABLE_ON_PUBLISH"
"""Name of the environmental variable to enable caching."""

HOOK_NAME: str = "git_redirects"
"""Name of this hook. Used in logging."""

CACHE_PATH: str = f".cache/hooks/{HOOK_NAME}"
"""A relative path to the cache directory, based from the `config.docs_dir` parent directory."""

HOOK_VAR: str = "GMC_ENABLE_ON_PUBLISH"
"""Name of the environmental variable to enable the hook."""

LOG: logging.Logger = logging.getLogger(f"mkdocs.hooks.{HOOK_NAME}")
"""Logger instance for this hook."""

# MAX_DATE: datetime.datetime = datetime.datetime.now() - datetime.timedelta(days=99)
MAX_DATE: Optional[datetime.datetime] = datetime.datetime.fromisoformat("2023-02-25")
"""The oldest included commit date in the history lookup."""

MAX_HASH: Optional[str] = "08f09465b85f17e327759278fe09582fcdaeda7a"
"""The oldest included commit hash in the history lookup."""

# endregion

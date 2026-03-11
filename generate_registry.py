#!/usr/bin/env python3
"""Generate registry.json from files in the output directory."""

import json
from pathlib import Path
import sys

TARGET_DIR=sys.argv[1] if len(sys.argv) > 1 else "output"

OUTPUT_DIR = Path(__file__).parent / TARGET_DIR
REGISTRY_PATH = Path(__file__).parent / TARGET_DIR / "registry.json"

# Map file extensions to language names
EXTENSION_MAP = {
    "sh": "bash",
    "bash": "bash",
    "c": "c",
    "h": "c",
    "cs": "c-sharp",
    "cpp": "cpp",
    "cc": "cpp",
    "cxx": "cpp",
    "hpp": "cpp",
    "hxx": "cpp",
    "css": "css",
    "go": "go",
    "hs": "haskell",
    "html": "html",
    "htm": "html",
    "java": "java",
    "js": "javascript",
    "mjs": "javascript",
    "cjs": "javascript",
    "json": "json",
    "jl": "julia",
    "md": "markdown",
    "ml": "ocaml",
    "mli": "ocaml-interface",
    "php": "php",
    "py": "python",
    "pyi": "python",
    "rb": "ruby",
    "rs": "rust",
    "scala": "scala",
    "sc": "scala",
    "swift": "swift",
    "toml": "toml",
    "tsx": "tsx",
    "ts": "typescript",
    "lua": "lua",
    "scm": "query",
    "mk": "make",
    "yml": "yaml",
    "yaml": "yaml",
    "vue": "vue",
    "xml": "xml",
    "xsl": "xml",
    "xsd": "xml",
    "svg": "xml",
    "dtd": "dtd",
    "scss": "scss",
    "zig": "zig",
    "bicep": "bicep",
    "svelte": "svelte",
    "m": "objc",
    "kt": "kotlin",
    "kts": "kotlin",
    "pp": "puppet",
}

# Known .scm query file types
SCM_KEYS = [
    "highlights",
    "folds",
    "indents",
]


def generate_registry():
    languages = {}

    for lang_dir in sorted(OUTPUT_DIR.iterdir()):
        if not lang_dir.is_dir():
            continue

        lang_name = lang_dir.name
        lang_entry = {}

        # Find the .wasm file
        wasm_files = list(lang_dir.glob("*.wasm"))
        if not wasm_files:
            continue
        lang_entry["wasm"] = f"{lang_name}/{wasm_files[0].name}"

        # Find .scm query files
        for scm_file in sorted(lang_dir.glob("*.scm")):
            key = scm_file.stem  # e.g. "highlights", "tags", "injections"
            if key not in SCM_KEYS:
                print(f"Info: Unrecognized .scm file {scm_file} (skipping)")
                continue
            lang_entry[key] = f"{lang_name}/{scm_file.name}"

        languages[lang_name] = lang_entry

    registry = {
        "schema_version": 1,
        # "root_dir": str(REGISTRY_PATH.parent),
        "extension_map": EXTENSION_MAP,
        "languages": languages,
    }

    with open(REGISTRY_PATH, "w", encoding="utf-8") as f:
        json.dump(registry, f, indent="\t", ensure_ascii=False)
        f.write("\n")

    print(f"Generated {REGISTRY_PATH}")
    print(f"  {len(EXTENSION_MAP)} extension mappings")
    print(f"  {len(languages)} languages")


if __name__ == "__main__":
    generate_registry()

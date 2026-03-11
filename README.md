# tree-sitter-grammars

This repo provides the grammar assets for [AttoEditor](https://github.com/windoze/editor-core).

The project contains a collection of [Tree-sitter](https://tree-sitter.github.io/tree-sitter/) grammars compiled to WebAssembly, bundled with syntax highlighting, folding, and indentation queries.

## Included Languages

Bash, Bicep, C, C#, C++, CSS, Go, Haskell, HTML, Java, JavaScript (+ JSX), JSON, Julia, Kotlin, Lua, Make, Markdown, Objective-C, OCaml, PHP, Puppet, Python, Ruby, Rust, Scala, SCSS, Svelte, Swift, TOML, TSX, TypeScript, Vue, XML (+ DTD), YAML, Zig, and Tree-sitter Query.

## How It Works

1. **`batch-git.sh`** — Clones all grammar repos (shallow clone), builds each grammar to `.wasm` using `tree-sitter build --wasm`, and copies the WASM binaries along with `highlights.scm`, `folds.scm`, and `indents.scm` query files into the `treesitter/` output directory.
2. **`generate_registry.py`** — Scans the output directory and produces a `registry.json` that maps file extensions to languages and lists all available WASM/query files.

## Usage

### Build locally

Prerequisites: [Node.js](https://nodejs.org/), [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md), Python 3.

```sh
# Clone all grammar repositories
bash batch-git.sh clone

# The script also builds all grammars and generates the registry
# Output goes to the treesitter/ directory
```

### CI / Releases

A GitHub Actions workflow (`.github/workflows/build-and-release.yml`) automatically builds all grammars and creates a `treesitter.tar.gz` release artifact when a version tag (`v*`) is pushed.

## Output Structure

```
treesitter/
  registry.json
  <language>/
    tree-sitter-<language>.wasm
    highlights.scm
    folds.scm
    indents.scm
```

## License

Individual grammars retain their own licenses. See each `tree-sitter-*` subdirectory for details.

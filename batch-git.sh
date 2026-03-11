#!/bin/sh


GIT_REPOS=(
	"https://github.com/tree-sitter/tree-sitter-ruby.git"
	"https://github.com/tree-sitter/tree-sitter-go.git"
	"https://github.com/tree-sitter/tree-sitter-cpp.git"
	"https://github.com/tree-sitter/tree-sitter-php.git"
	"https://github.com/tree-sitter/tree-sitter-java.git"
	"https://github.com/tree-sitter/tree-sitter-bash.git"
	"https://github.com/tree-sitter/tree-sitter-html.git"
	"https://github.com/tree-sitter/tree-sitter-c.git"
	"https://github.com/tree-sitter/tree-sitter-rust.git"
	"https://github.com/tree-sitter/tree-sitter-javascript.git"
	"https://github.com/tree-sitter/tree-sitter-json.git"
	"https://github.com/tree-sitter/tree-sitter-julia.git"
	"https://github.com/tree-sitter/tree-sitter-css.git"
	"https://github.com/tree-sitter/tree-sitter-python.git"
	"https://github.com/tree-sitter/tree-sitter-typescript.git"
	"https://github.com/tree-sitter/tree-sitter-haskell.git"
	"https://github.com/tree-sitter/tree-sitter-scala.git"
	"https://github.com/tree-sitter/tree-sitter-ocaml.git"
	"https://github.com/tree-sitter/tree-sitter-toml.git"
	"https://github.com/tree-sitter/tree-sitter-c-sharp.git"
	# 3rd party
	"https://github.com/tree-sitter-grammars/tree-sitter-markdown.git"
)

function clone_git {
	for repo in "${GIT_REPOS[@]}" ; do
		git clone --depth=1 $repo
	done
}

if [ "$1" = "clone" ]; then
	clone_git
fi

# For building, we need to pull the latest changes, so we can't use --depth=1
ARRAY=( "ruby"
	"go"
	"cpp"
	"php"
	"java"
	"bash"
	"html"
	"c"
	"rust"
	"javascript"
	"json"
	"julia"
	"css"
	"python"
	"typescript"
	"haskell"
	"scala"
	"ocaml"
	"toml"
	"swift"
	"c-sharp"
	"markdown" )

OUTPUT_DIR="treesitter"

mkdir $OUTPUT_DIR

# This one is active, original one is deprecated
# git clone https://github.com/alex-pinkus/tree-sitter-swift.git

function build {
	echo "Building $dir"
	dir="$1"
	if [ "$dir" = "typescript" ]; then
		build_typescript
		return
	fi
	if [ "$dir" = "javascript" ]; then
		build_javascript
		return
	fi
	if [ "$dir" = "php" ]; then
		build_php
		return
	fi
	if [ "$dir" = "ocaml" ]; then
		build_ocaml
		return
	fi
	if [ "$dir" = "swift" ]; then
		build_swift
		return
	fi
	if [ "$dir" = "markdown" ]; then
		build_markdown
		return
	fi
	mkdir -p "$OUTPUT_DIR/${dir}"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm
	cp *.wasm "../$OUTPUT_DIR/${dir}"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/${dir}"
	cd ..
}

function build_javascript {
	dir="javascript"
	mkdir -p "$OUTPUT_DIR/jsx"
	mkdir -p "$OUTPUT_DIR/javascript"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm
	cp tree-sitter-javascript.wasm "../$OUTPUT_DIR/javascript"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/javascript"
	cp tree-sitter-javascript.wasm "../$OUTPUT_DIR/jsx/tree-sitter-jsx.wasm"
	cp queries/{folds,indents}.scm "../$OUTPUT_DIR/jsx"
	cp queries/highlights-jsx.scm "../$OUTPUT_DIR/jsx/highlights.scm"
	cd ..
}

function build_typescript {
	dir="typescript"
	mkdir -p "$OUTPUT_DIR/tsx"
	mkdir -p "$OUTPUT_DIR/typescript"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm tsx	
	cp tree-sitter-tsx.wasm "../$OUTPUT_DIR/tsx"
	cp queries/*.scm "../$OUTPUT_DIR/tsx"
	tree-sitter build --wasm typescript
	cp tree-sitter-typescript.wasm "../$OUTPUT_DIR/typescript"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/typescript"
	cd ..
}

function build_ocaml {
	dir="ocaml"
	mkdir -p "$OUTPUT_DIR/ocaml"
	mkdir -p "$OUTPUT_DIR/ocaml-interface"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm grammars/ocaml
	cp tree-sitter-ocaml.wasm "../$OUTPUT_DIR/ocaml"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/ocaml"
	tree-sitter build --wasm grammars/interface
	cp tree-sitter-ocaml.wasm "../$OUTPUT_DIR/ocaml-interface"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/ocaml-interface"
	cd ..
}

function build_php {
	dir="php"
	mkdir -p "$OUTPUT_DIR/php"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm php	
	cp tree-sitter-php.wasm "../$OUTPUT_DIR/php"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/php"
	cd ..
}

function build_swift {
	dir="swift"
	mkdir -p "$OUTPUT_DIR/swift"
	cd "tree-sitter-${dir}"
	git pull
	npm install
	npx tree-sitter build --wasm
	cp tree-sitter-swift.wasm "../$OUTPUT_DIR/swift"
	cp queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/${dir}"
	cd ..
}

function build_markdown {
	dir="markdown"
	mkdir -p "$OUTPUT_DIR/markdown"
	cd "tree-sitter-${dir}"
	git pull
	tree-sitter build --wasm tree-sitter-markdown/
	cp tree-sitter-markdown.wasm "../$OUTPUT_DIR/markdown"
	cp tree-sitter-markdown/queries/{highlights,folds,indents}.scm "../$OUTPUT_DIR/markdown"
	cd ..
}

for dir in "${ARRAY[@]}" ; do
	#url="https://github.com/tree-sitter/tree-sitter-${dir}"
	#git clone --depth=1 $url
	build $dir
done

python3 generate_registry.py $OUTPUT_DIR
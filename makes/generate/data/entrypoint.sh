# shellcheck shell=bash

function main {
  : && rm -rf content \
    && rm -rf data \
    && mkdir -p content/nixpkgs \
    && mkdir -p data/nixpkgs \
    && for attr_path in __argData__/nixpkgs/*; do
      : && attr="$(basename "${attr_path}")" \
        && attr="${attr%.*}" \
        && echo --- > "content/nixpkgs/${attr}.md" \
        && echo "attr: ${attr}" >> "content/nixpkgs/${attr}.md" \
        && echo --- >> "content/nixpkgs/${attr}.md"
    done \
    && cp -rLT __argData__/nixpkgs data/nixpkgs \
    && :
}

main "${@}"

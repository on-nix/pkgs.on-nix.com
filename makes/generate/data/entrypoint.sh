# shellcheck shell=bash

function main {
  : && rm -rf content/* \
    && rm -rf data/* \
    && mkdir -p content/nixpkgs \
    && mkdir -p data/nixpkgs \
    && cp -rLT __argData__/nixpkgs data/nixpkgs \
    && :
}

main "${@}"

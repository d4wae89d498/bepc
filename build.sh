#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

TEXLIVE='texlive.withPackages (ps: with ps; [
  scheme-small
  pgfgantt
  titlesec
  tocloft
  eurosym
  enumitem
  lastpage
  multirow
  collection-langfrench
])'

nix-shell -p pandoc "$TEXLIVE" --run '
  xelatex -interaction=nonstopmode -halt-on-error reponse_ao.tex
  xelatex -interaction=nonstopmode -halt-on-error reponse_ao.tex
'

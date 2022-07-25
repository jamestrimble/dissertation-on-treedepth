#!/bin/bash

set -eu -o pipefail

mkdir -p plots
mkdir -p plots/by-family

gnuplot scripts/scatter-plots.gnuplot

gnuplot scripts/plots.gnuplot

sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex

#!/bin/bash

set -eu -o pipefail

mkdir -p plots

awk -f make-density-extremeness.awk ../fatanode-results/runtimes.randomplaininstances2.txt > runtimes-and-extremeness.randomplaininstances2.txt

gnuplot scatter-plots.gnuplot

gnuplot plots.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex
#cd plots && latexmk -pdf left-vs-right-random3.tex
#cd plots && latexmk -pdf *order-when-swap*.tex

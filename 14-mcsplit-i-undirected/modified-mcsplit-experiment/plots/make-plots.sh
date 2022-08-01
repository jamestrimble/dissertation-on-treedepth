#!/bin/bash

set -eu -o pipefail

mkdir -p plots
mkdir -p mcsplit-down-plots

awk -f make-density-extremeness.awk ../fatanode-results/runtimes.randomplaininstances2.txt > runtimes-and-extremeness.randomplaininstances2.txt

gnuplot scatter-plots.gnuplot

gnuplot plots.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex

gnuplot mcsplit-down-plots.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' mcsplit-down-plots/*.tex
cd mcsplit-down-plots && latexmk -pdf *.tex

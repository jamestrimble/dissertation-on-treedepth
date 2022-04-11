#!/bin/bash

set -eu -o pipefail

mkdir -p plots

awk -f make-density-extremeness.awk ../results/results/runtimes.randomplaininstances2.txt > runtimes-and-extremeness.randomplaininstances2.txt

gnuplot plots.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex

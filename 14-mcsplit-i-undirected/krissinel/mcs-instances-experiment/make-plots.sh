#!/bin/bash

set -eu -o pipefail

gnuplot runtime-comparisons.gnuplot

gnuplot cumulative-plot.gnuplot

sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex
#cd plots && latexmk -pdf cumulative.tex

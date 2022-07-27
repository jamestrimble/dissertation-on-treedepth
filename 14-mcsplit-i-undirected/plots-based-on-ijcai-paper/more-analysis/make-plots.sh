#!/bin/bash

set -eu -o pipefail

gnuplot small-multiples.gnuplot

gnuplot scatter-plots.gnuplot

gnuplot node-scatters.gnuplot

gnuplot runtime-comparisons.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
cd plots && latexmk -pdf *.tex

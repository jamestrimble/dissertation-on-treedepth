#!/bin/bash

set -eu -o pipefail

gnuplot scatter-plots.gnuplot

###  gnuplot runtime-comparisons.gnuplot
###  sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*.tex
###  cd plots && latexmk -pdf *.tex
###  #cd plots && latexmk -pdf *runtime-ratio*.tex
###  #cd plots && latexmk -pdf sip-runtime-ratio-vs-solution-size.tex

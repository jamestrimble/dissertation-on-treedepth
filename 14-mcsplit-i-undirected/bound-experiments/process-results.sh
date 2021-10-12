#!/bin/bash
Rscript scripts/reshape.R
gnuplot scripts/scatter.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/bounds-plot.tex # Ciaran's trick
cd plots && latexmk -pdf

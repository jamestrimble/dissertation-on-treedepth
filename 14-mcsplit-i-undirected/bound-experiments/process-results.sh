#!/bin/bash
Rscript scripts/reshape.R
gnuplot scripts/scatter.gnuplot
gnuplot scripts/scatter_mcsa2.gnuplot
gnuplot scripts/scatter_mcsa1vs2.gnuplot
sed -i -e '19s/^\(\\path.*\)/\% \1/' plots/*-plot.tex # Ciaran's trick
cd plots && latexmk -pdf

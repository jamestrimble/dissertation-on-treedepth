# vim: set et ft=gnuplot sw=4 :

#set terminal tikz standalone color size 9cm,5.5cm font '\scriptsize' preamble '\usepackage{times}'
set terminal tikz standalone color size 9cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set output "plots/n-density.tex"
#set terminal png
#set output "bounds-plot.png"

set xlabel '$n$'
set ylabel 'Density'
set border 3
set grid x y front
set xtics nomirror
set ytics nomirror
set tics front
set logscale y
#set size square
#set xrange [0:21]
#set xtics 0,5,20
#set yrange [0:2.5]
#set ytics 0,.5,2.5
#set format x '$10^{%T}$'
#set format y '$10^{%T}$'

plot "target-graph-stats.txt" u 1:2 w p pt 7 lc rgb "#991f77b4" ps .3 notitle

set term pdfcairo size 9cm,5.5cm font "Times,10"
set xlabel 'Target graph order'
set ylabel 'Target graph density'
set output "plots/n-density-pdf.pdf"
plot "target-graph-stats.txt" u 1:2 w p pt 7 lc rgb "#881f77b4" ps .15 notitle

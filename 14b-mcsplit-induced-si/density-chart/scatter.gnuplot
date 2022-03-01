# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 8cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
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

plot \
    "target-graph-stats-sample.txt" u 1:2 w p pt 7 lc rgb "#991f77b4" ps .3 notitle
#plot \
#    "results_pivoted.tsv" u 2:7 pt 7 lc rgb "#991f77b4" ps .3 notitle, \
#    "results_summary.tsv" using ($1-.3):2:(.6):(0) with vectors nohead lw 2 lc rgb "#000000" notitle

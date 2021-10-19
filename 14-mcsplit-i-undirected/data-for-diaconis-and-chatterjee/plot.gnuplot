# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 8cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set output "plot.tex"
#set terminal png
#set output "bounds-plot.png"

set xlabel 'Number of vertices in each input graph'
set ylabel 'Number of vertices in MCIS'
set border 3
set grid x y front
set xtics nomirror
set ytics nomirror
set tics front
#set size square
#set xrange [.5:4.5]
set yrange [0:]
#set ytics 0,.5,2.5
#set format x '$10^{%T}$'
#set format y '$10^{%T}$'

plot \
    "bands.txt" using 1:4:(0):($5-$4) with vectors nohead lw 2.5 lc rgb "#441f77b4" notitle, \
    "< awk '$1 != 1' 32-summary.txt" using 1:2:(0):($3-$2) with vectors nohead lw 1.2 lc 4 notitle, \
    "< awk '$1 != 1' 32-summary.txt" u 1:4 pt 7 lc 4 ps .3 notitle, \
    "< awk 'NR==1 || $1 > 32' one-run-to-45.txt" u 1:2 pt 7 lc 4 ps .3 notitle

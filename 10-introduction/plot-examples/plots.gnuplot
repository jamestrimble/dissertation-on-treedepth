# vim: set et ft=gnuplot sw=4 :

load "../../plot-utils/plot-utils.gnuplot"

set size nosquare
set border 3
set grid
set xtics nomirror
set ytics nomirror
#set key outside
set key right bottom

set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
#set xtics 1,1000,1000000
set ytics autofreq
set xrange[1:1000000]
unset yrange

set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set output "plots/cumulative.tex"
plot \
     "data.txt" u (cumux($1)):(cumuy($1)) smooth cumulative w l ti 'Algorithm A' lc rgb '#a6cee3', \
     "data.txt" u (cumux($2)):(cumuy($2)) smooth cumulative w l ti 'Algorithm B' lc rgb '#1f78b4'


set terminal tikz standalone color size 8cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set size square
set logscale
set title
set format x '$10^{%T}$'
set format y '$10^{%T}$'
set xrange[.5:1400000]
set yrange[.5:1400000]
set xtics autofreq
set key off

set style rect fc lt -1 fs solid 0.15 noborder

set obj 1 rect from .5, 1000000.5 to graph 1, 1400000
set obj 2 rect from 1000000.5, graph 0 to 1400000, graph 1

set output "plots/scatter.tex"
set xlabel "Algorithm A"
set ylabel "Algorithm B"
plot \
    x lc rgb '#888888' notitle, \
    "data.txt" using (jitt($1)):(jitt($2)) w p pointtype 7 pointsize .3 lc rgb '#1f77b4' notitle

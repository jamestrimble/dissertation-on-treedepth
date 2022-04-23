# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 5.5cm,4.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror
set size square

set xlabel "Krissinel and Henrick"
set format x '$10^{%T}$'
set format y '$10^{%T}$'

set output "plots/kh-vs-mcsplit.tex"
set ylabel "McSplit"
plot "results.txt" u 4:2 notitle w points pointtype 7 pointsize .2, x notitle lc rgb '#444444'

set output "plots/kh-vs-mcsplit-prime.tex"
set ylabel "Modified McSplit"
plot "results.txt" u 4:3 notitle w points pointtype 7 pointsize .2, x notitle lc rgb '#444444'

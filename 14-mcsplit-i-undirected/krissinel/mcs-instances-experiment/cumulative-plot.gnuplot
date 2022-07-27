# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

set terminal tikz standalone color size 9cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set border 3
set grid
set xtics nomirror
set ytics nomirror

set size nosquare
set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set ylabel "Number of instances solved"
set xtics autofreq
set ytics autofreq
set xrange[1:1000000]
unset format y
unset yrange
#set key samplen 2
#set key left Left reverse
set key off
set output "plots/cumulative.tex"
plot "fatanode-results/runtimes.txt" u 2:(cumuy($2)) smooth cumulative w l ti '\raisebox{1.3mm}{\textproc{McSplit}}' at end lc 1, \
     "fatanode-results/runtimes.txt" u 3:(cumuy($3)) smooth cumulative w l ti '\raisebox{-.5mm}{\textproc{McSplit}-1}'  at end lc 2, \
     "fatanode-results/runtimes.txt" u 4:(cumuy($4)) smooth cumulative w l ti '\textproc{McSplit}-1,2' at end lc 3, \
     "fatanode-results/runtimes.txt" u 5:(cumuy($5)) smooth cumulative w l ti '\raisebox{.5mm}{\textproc{McSplit}-1,2,3}' at end lc 4, \
     "fatanode-results/runtimes.txt" u 6:(cumuy($6)) smooth cumulative w l ti '\raisebox{-.3mm}{Krissinel and Henrick}' at end lc 5


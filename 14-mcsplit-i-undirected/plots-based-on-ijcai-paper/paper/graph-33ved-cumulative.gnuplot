# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 7cm,4.82cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set output "gen-graph-33ved-cumulative.tex"

set xlabel "Runtime (ms)"
set ylabel "Number of Instances Solved"
set border 3
set grid x y
set xtics nomirror
set ytics nomirror
set xrange [1:1e6]
set logscale x
set format x '$10^{%T}$'
set yrange [0:8140]
set key off
set ytics add ('$8140$' 8140) add ('' 8000)

plot \
    "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\raisebox{1mm}{clique}' at end lc 3, \
    "../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($4*1000):($4>=1e3?1e-10:1) smooth cumulative w l ti 'CP-MAC' at end lc 4, \
    "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti '\raisebox{.78mm}{\textproc{McSplit}}' at end lc 1, \
    "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\raisebox{-.78mm}{\textproc{McSplit}${\downarrow}$}' at end lc 7


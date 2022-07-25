# vim: set et ft=gnuplot sw=4 :

set size nosquare
set border 3
set grid
set xtics nomirror
set ytics nomirror
set key outside
set key right bottom

set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set xtics 1,1000,1000000
set ytics autofreq
set xrange[1:1000000]
unset yrange
set key right bottom

set key right bottom
set xtics autofreq
set ylabel "Number of instances solved"
set terminal tikz standalone color size 12cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set output "plots/cumulative.tex"
plot "fatanode-results/runtimes.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-sparse' lc 1, \
     "fatanode-results/runtimes.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti 'kDown2017' lc 2, \
     "fatanode-results/runtimes.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti 'kDown2019' lc 3, \
     "fatanode-results/runtimes.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti 'kDown2019-restarts' lc 4

set ylabel 'Number of instances solved, \textbf{rescaled}'
set output "plots/cumulative-rescaled.tex"
plot "fatanode-results/runtimes-with-family-scaling.txt" u 2:($2>=1e6?1e-10:$6) smooth cumulative w l ti '\textproc{McSplit}-sparse' lc 1, \
     "fatanode-results/runtimes-with-family-scaling.txt" u 3:($3>=1e6?1e-10:$6) smooth cumulative w l ti 'kDown2017' lc 2, \
     "fatanode-results/runtimes-with-family-scaling.txt" u 4:($4>=1e6?1e-10:$6) smooth cumulative w l ti 'kDown2019' lc 3, \
     "fatanode-results/runtimes-with-family-scaling.txt" u 5:($5>=1e6?1e-10:$6) smooth cumulative w l ti 'kDown2019-restarts' lc 4


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

#### Scatter small multiples: by family ####

set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set key off

unset xlabel
unset ylabel

set logscale

set format x '10^{%T}'
set format y '10^{%T}'
set term pdfcairo size 5cm,5cm font "Times,10"

set output "plots/by-family/scatter-Scalefree.pdf"
plot "fatanode-results/by-family/runtimes-Scalefree.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV.pdf"
plot "fatanode-results/by-family/runtimes-LV.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG.pdf"
plot "fatanode-results/by-family/runtimes-BVG.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D.pdf"
plot "fatanode-results/by-family/runtimes-M4D.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand.pdf"
plot "fatanode-results/by-family/runtimes-Rand.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR.pdf"
plot "fatanode-results/by-family/runtimes-PR.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase.pdf"
plot "fatanode-results/by-family/runtimes-Phase.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes.pdf"
plot "fatanode-results/by-family/runtimes-Meshes.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images.pdf"
plot "fatanode-results/by-family/runtimes-Images.txt" using ($2-.5+rand(0)):($5-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

#### end of Scatter small multiples: by family  ####

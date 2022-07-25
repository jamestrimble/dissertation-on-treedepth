# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror

set format x '$10^{%T}$'
set format y '$10^{%T}$'

set size square

set output "plots/decision-problems-last-two-all-others.tex"
set title
set xlabel "Last two decision problems"
set ylabel "All other decision problems"
plot "< awk 'NR==1 || $6 < 1000000' ../fatanode-results/runtimes.mcsplaindecisioninstances.txt" using ($2+$3):($4-$2-$3) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/decision-problems-last-two.tex"
set title
set xlabel "Last UNSAT decision problem"
set ylabel "SAT decision problem"
plot "< awk 'NR==1 || $6 < 1000000' ../fatanode-results/runtimes.mcsplaindecisioninstances.txt" using 2:3 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle


######################################################################################################
# Plot showing densities of MCS plain graph pairs
######################################################################################################

set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

unset logscale
set output "plots/mcsplain-densities.tex"
set title
set xlabel "Density of $G$"
set ylabel "Density of $H$"
set format x
set format y
set xtics 0,.2
set ytics 0,.2
set xrange[0:.8]
set yrange[0:.8]
plot "densities.mcsplaininstances.txt" using 2:3 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

######################################################################################################
# Cumulative plots
######################################################################################################

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set size nosquare
set output "plots/mcsplit-random-smart-density-cumulative.tex"
set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set ylabel "Number of instances solved"
set xtics autofreq
set ytics autofreq
set xrange[1:1000000]
unset yrange
set key right bottom
plot "../fatanode-results/runtimes.randomplaininstances2.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.randomplaininstances2.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
     "< awk 'NR==1 {print} NR>1 {print $6<$7 ? $6 : $7}' ../fatanode-results/runtimes.randomplaininstances2.txt" u 1:($1>=1e6?1e-10:1) smooth cumulative w l ti 'VBS' lc 3

set size nosquare
set output "plots/mcsplit-random-smart-order-cumulative.tex"
set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set ylabel "Number of instances solved"
set xtics autofreq
set ytics autofreq
set xrange[1:1000000]
unset yrange
set key right bottom
plot "../fatanode-results/runtimes.randomplaininstances3.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.randomplaininstances3.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 2, \
     "< awk 'NR==1 {print} NR>1 {print $6<$7 ? $6 : $7}' ../fatanode-results/runtimes.randomplaininstances3.txt" u 1:($1>=1e6?1e-10:1) smooth cumulative w l ti 'VBS' lc 3

######################################################################################################
# Cumulative plots, McSplit vs McSplit2 vs McSplit2'
######################################################################################################

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set size nosquare
set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set ylabel "Number of instances solved"
set xtics autofreq
set ytics autofreq
set xrange[1:1000000]
unset yrange
set key right bottom
set output "plots/mcsplain-mcsplit2-cumulative.tex"
plot "../fatanode-results/runtimes.mcsplaininstances.txt" u 1:($1>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.mcsplaininstances.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.mcsplaininstances.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/random2-mcsplit2-cumulative.tex"
plot "../fatanode-results/runtimes.randomplaininstances2.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.randomplaininstances2.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
     "../fatanode-results/runtimes.randomplaininstances2.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.randomplaininstances2.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/random3-mcsplit2-cumulative.tex"
plot "../fatanode-results/runtimes.randomplaininstances3.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.randomplaininstances3.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
     "../fatanode-results/runtimes.randomplaininstances3.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.randomplaininstances3.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/random4-mcsplit2-cumulative.tex"
plot "../fatanode-results/runtimes.randomplaininstances4.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.randomplaininstances4.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
     "../fatanode-results/runtimes.randomplaininstances4.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
     "../fatanode-results/runtimes.randomplaininstances4.txt" u 11:($11>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.randomplaininstances4.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/mixandmatch-cumulative.tex"
plot "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 1:($1>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/ba-cumulative.tex"
plot "../fatanode-results/runtimes.barabasialbertinstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.barabasialbertinstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.barabasialbertinstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/ba-gnm-cumulative.tex"
plot "../fatanode-results/runtimes.ba-gnpinstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.ba-gnpinstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.ba-gnpinstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

set output "plots/gnm-cumulative.tex"
plot "../fatanode-results/runtimes.gnminstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
     "../fatanode-results/runtimes.gnminstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
     "../fatanode-results/runtimes.gnminstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4

######################################################################################################
# Plots showing when it's better to swap graphs: varying density
######################################################################################################

set size square
unset logscale
set output "plots/density-when-swap.tex"
set title
set xlabel "Density of $G$"
set ylabel "Density of $H$"
set format x
set format y
set xtics 0,.2
set ytics 0,.2
set xrange[0:1]
set yrange[0:1]
plot "< awk 'NR==1 || ($6 < $7*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($6 < $7 && $6 >= $7*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
     "< awk 'NR==1 || ($7 < $6*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
     "< awk 'NR==1 || ($7 < $6 && $7 >= $6*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
    x lc rgb '#888888' notitle, \
    1-x lc rgb '#888888' notitle

set output "plots/density-extremeness-when-swap.tex"
set title
set xlabel "$\\left|\\frac{1}{2} - d_G\\right|$"
set ylabel "$\\left|\\frac{1}{2} - d_H\\right|$"
set format x
set format y
set xtics 0,.1
set ytics 0,.1
set xrange[0:.5]
set yrange[0:.5]
plot "< awk 'NR==1 || ($3 < $4*.5 && ($3<1000000 || $4<1000000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($3 < $4 && $3 >= $4*.5 && ($3<1000000 || $4<1000000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
     "< awk 'NR==1 || ($4 < $3*.5 && ($3<1000000 || $4<1000000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
     "< awk 'NR==1 || ($4 < $3 && $4 >= $3*.5 && ($3<1000000 || $4<1000000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
    x lc rgb '#888888' notitle

set output "plots/density-when-swap-b.tex"
set title
set xlabel "Density of $G$"
set ylabel "Density of $H$"
set format x
set format y
set xtics 0,.2
set ytics 0,.2
set xrange[0:1]
set yrange[0:1]
plot "< awk 'NR==1 || ($11 < $12 && ($11<1000000 || $12<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 12 pointsize .18 lc rgb '#1f1212b4' notitle, \
     "< awk 'NR==1 || ($12 < $11 && ($11<1000000 || $12<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 12 pointsize .18 lc rgb '#ff0000' notitle, \
    x lc rgb '#888888' notitle, \
    1-x lc rgb '#888888' notitle

set output "plots/density-when-swap-nosort.tex"
set title
set xlabel "Density of $G$"
set ylabel "Density of $H$"
set format x
set format y
plot "< awk 'NR==1 || ($14 < $15 && ($14<1000000 || $15<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 15 pointsize .18 lc rgb '#1f1515b4' notitle, \
     "< awk 'NR==1 || ($15 < $14 && ($14<1000000 || $15<1000000))' ../fatanode-results/runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 15 pointsize .18 lc rgb '#ff0000' notitle, \
    x lc rgb '#888888' notitle, \
    1-x lc rgb '#888888' notitle


######################################################################################################
# Plots showing when it's better to swap graphs: varying order
######################################################################################################

set size square
unset logscale
set output "plots/order-when-swap.tex"
set title
set xlabel "Order of $G$"
set ylabel "Order of $H$"
set format x
set format y
set xtics 10,5
set ytics 10,5
set xrange[10:50]
set yrange[10:50]
plot "< awk 'NR==1 || ($6 < $7*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances3.txt" using (slightjitt($2)):(slightjitt($4)) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($6 < $7 && $6 >= $7*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances3.txt" using (slightjitt($2)):(slightjitt($4)) w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
     "< awk 'NR==1 || ($7 < $6*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances3.txt" using (slightjitt($2)):(slightjitt($4)) w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
     "< awk 'NR==1 || ($7 < $6 && $7 >= $6*.5 && ($6<1000000 || $7<1000000))' ../fatanode-results/runtimes.randomplaininstances3.txt" using (slightjitt($2)):(slightjitt($4)) w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
    x lc rgb '#888888' notitle

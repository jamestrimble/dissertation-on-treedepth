# vim: set et ft=gnuplot sw=4 :

set size nosquare
set border 3
set grid
set xtics nomirror
set ytics nomirror
set key outside
set key right bottom

set terminal tikz standalone color size 12cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

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
set output "plots/cumulative-with-disconnected-patterns-treated-as-timeout.tex"
plot "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI' lc 1, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-adjmat' lc 3, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 4, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 5, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 6, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 7

set output "plots/cumulative-without-disconnected-pattern.tex"
plot "fatanode-results/runtimes-without-disconnected-patterns.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI' lc 1, \
     "fatanode-results/runtimes-without-disconnected-patterns.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "fatanode-results/runtimes-without-disconnected-patterns.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-adjmat' lc 3, \
     "fatanode-results/runtimes-without-disconnected-patterns.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 4, \
     "fatanode-results/runtimes-without-disconnected-patterns.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 5, \
     "fatanode-results/runtimes-without-disconnected-patterns.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 6, \
     "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 7

set terminal tikz standalone color size 8cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set size square
set logscale
set title
set format x '$10^{%T}$'
set format y '$10^{%T}$'
set xrange[.5:1000000.5]
set yrange[.5:1000000.5]
set output "plots/mcsplit-si-vs-glasgow.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "Glasgow"
plot "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" using ($2-.5+rand(0)):($6-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-vf3.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "VF3"
plot "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" using ($2-.5+rand(0)):($10-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-dom.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "\\textproc{McSplit}-dom"
plot "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt" using ($2-.5+rand(0)):($3-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-adjmat.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "\\textproc{McSplit}-adjmat"
set logscale cb
plot "fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout-and-densities.txt" using ($2-.5+rand(0)):($4-.5+rand(0)):17 w p pointtype 7 pointsize .15 lc var notitle, \
    x lc rgb '#888888' notitle
#
# set terminal tikz standalone color size 12cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
# 
# set size nosquare
# set border 3
# set grid
# set xtics nomirror
# set ytics nomirror
# unset logscale x
# set logscale y
# 
# #set format x '$10^{%T}$'
# #set format y '$10^{%T}$'
# 
# set xlabel "Target graph order"
# set ylabel "Run time (ms)"
# set xtics autofreq
# set ytics autofreq
# set xrange[1:1000000]
# unset xrange
# unset yrange
# set key outside
# set key right bottom

## set output "plots/runtimes0.05-1.tex"
## plot "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:4 w lp ti '\textproc{McSplit}-SI' lc 1, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:6 w lp ti '\textproc{McSplit}-SI-a' lc 3, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:8 w lp ti 'Glasgow' lc 5, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:9 w lp ti 'Glasgow no-supp' lc 6, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:10 w lp ti 'RI' lc 7, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:11 w lp ti 'RI-DS' lc 8, \
##      "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:12 w lp ti 'VF3' lc 9


####  set size square
####  
####  set output "plots/decision-problems-last-two-all-others.tex"
####  set title
####  set xlabel "Last two decision problems"
####  set ylabel "All other decision problems"
####  plot "< awk 'NR==1 || $6 < 100000' ../runtimes.mcsplaindecisioninstances.txt" using ($2+$3):($4-$2-$3) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  set output "plots/decision-problems-last-two.tex"
####  set title
####  set xlabel "Last UNSAT decision problem"
####  set ylabel "SAT decision problem"
####  plot "< awk 'NR==1 || $6 < 100000' ../runtimes.mcsplaindecisioninstances.txt" using 2:3 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  
####  ######################################################################################################
####  # Run times, not swapping graphs vs swapping them
####  ######################################################################################################
####  
####  set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  
####  set output "plots/left-vs-right-mcsplain.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit} with $G$ and $H$ swapped"
####  plot "../runtimes.mcsplaininstances.txt" using 1:6 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  
####  set output "plots/left-vs-right-random2.tex"
####  set title
####  plot "../runtimes.randomplaininstances2.txt" using 6:7 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  ######################################################################################################
####  # Run times, not swapping graphs vs smart swapping them
####  ######################################################################################################
####  
####  set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  
####  set output "plots/left-vs-smart-random2.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit}-SD"
####  plot "../runtimes.randomplaininstances2.txt" using 6:8 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  set output "plots/left-vs-smart-random3.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit}-SO"
####  plot "../runtimes.randomplaininstances3.txt" using 6:8 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  ######################################################################################################
####  # Run times, McSplit vs McSplit2 Barabasi-Albert and G(n,m)
####  ######################################################################################################
####  
####  set output "plots/mcsplit-vs-mcsplit2-ba.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit}-2S"
####  plot "../runtimes.barabasialbertinstances.txt" using 6:8 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  set output "plots/mcsplit-vs-mcsplit2-ba-gnm.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit}-2S"
####  plot "../runtimes.ba-gnpinstances.txt" using 6:8 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  set output "plots/mcsplit-vs-mcsplit2-gnm.tex"
####  set title
####  set xlabel "\\textproc{McSplit}"
####  set ylabel "\\textproc{McSplit}-2S"
####  plot "../runtimes.gnminstances.txt" using 6:8 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  ######################################################################################################
####  # Plot showing densities of MCS plain graph pairs
####  ######################################################################################################
####  
####  set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  
####  unset logscale
####  set output "plots/mcsplain-densities.tex"
####  set title
####  set xlabel "Density of $G$"
####  set ylabel "Density of $H$"
####  set format x
####  set format y
####  set xtics 0,.2
####  set ytics 0,.2
####  set xrange[0:.8]
####  set yrange[0:.8]
####  plot "densities.mcsplaininstances.txt" using 2:3 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####      x lc rgb '#888888' notitle
####  
####  ######################################################################################################
####  # Cumulative plots
####  ######################################################################################################
####  
####  set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  
####  set size nosquare
####  set output "plots/mcsplit-random-smart-density-cumulative.tex"
####  set logscale x
####  unset logscale y
####  set format x '$10^{%T}$'
####  set xlabel "Run time (ms)"
####  set ylabel "Number of instances solved"
####  set xtics autofreq
####  set ytics autofreq
####  set xrange[1:1000000]
####  unset yrange
####  set key right bottom
####  plot "../runtimes.randomplaininstances2.txt" u 6:($6>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.randomplaininstances2.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
####       "< awk 'NR==1 {print} NR>1 {print $6<$7 ? $6 : $7}' ../runtimes.randomplaininstances2.txt" u 1:($1>=1e5?1e-10:1) smooth cumulative w l ti 'VBS' lc 3
####  
####  set size nosquare
####  set output "plots/mcsplit-random-smart-order-cumulative.tex"
####  set logscale x
####  unset logscale y
####  set format x '$10^{%T}$'
####  set xlabel "Run time (ms)"
####  set ylabel "Number of instances solved"
####  set xtics autofreq
####  set ytics autofreq
####  set xrange[1:1000000]
####  unset yrange
####  set key right bottom
####  plot "../runtimes.randomplaininstances3.txt" u 6:($6>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.randomplaininstances3.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 2, \
####       "< awk 'NR==1 {print} NR>1 {print $6<$7 ? $6 : $7}' ../runtimes.randomplaininstances3.txt" u 1:($1>=1e5?1e-10:1) smooth cumulative w l ti 'VBS' lc 3
####  
####  ######################################################################################################
####  # Cumulative plots, McSplit vs McSplit2 vs McSplit2'
####  ######################################################################################################
####  
####  set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  
####  set size nosquare
####  set logscale x
####  unset logscale y
####  set format x '$10^{%T}$'
####  set xlabel "Run time (ms)"
####  set ylabel "Number of instances solved"
####  set xtics autofreq
####  set ytics autofreq
####  set xrange[1:1000000]
####  unset yrange
####  set key right bottom
####  set output "plots/mcsplain-mcsplit2-cumulative.tex"
####  plot "../runtimes.mcsplaininstances.txt" u 1:($1>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.mcsplaininstances.txt" u 5:($5>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.mcsplaininstances.txt" u 3:($3>=1e5?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/random2-mcsplit2-cumulative.tex"
####  plot "../runtimes.randomplaininstances2.txt" u 6:($6>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.randomplaininstances2.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
####       "../runtimes.randomplaininstances2.txt" u 10:($10>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.randomplaininstances2.txt" u 9:($9>=1e5?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/random3-mcsplit2-cumulative.tex"
####  plot "../runtimes.randomplaininstances3.txt" u 6:($6>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.randomplaininstances3.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
####       "../runtimes.randomplaininstances3.txt" u 10:($10>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.randomplaininstances3.txt" u 9:($9>=1e5?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/random4-mcsplit2-cumulative.tex"
####  plot "../runtimes.randomplaininstances4.txt" u 6:($6>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.randomplaininstances4.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
####       "../runtimes.randomplaininstances4.txt" u 9:($9>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
####       "../runtimes.randomplaininstances4.txt" u 11:($11>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.randomplaininstances4.txt" u 10:($10>=1e5?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/mixandmatch-cumulative.tex"
####  plot "../runtimes.mcsplainmixandmatchinstances.txt" u 1:($1>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.mcsplainmixandmatchinstances.txt" u 7:($7>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SD' lc 2, \
####       "../runtimes.mcsplainmixandmatchinstances.txt" u 8:($8>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SO' lc 5, \
####       "../runtimes.mcsplainmixandmatchinstances.txt" u 5:($5>=1e5?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.mcsplainmixandmatchinstances.txt" u 3:($3>=1e5?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/ba-cumulative.tex"
####  plot "../runtimes.barabasialbertinstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.barabasialbertinstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.barabasialbertinstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/ba-gnm-cumulative.tex"
####  plot "../runtimes.ba-gnpinstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.ba-gnpinstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.ba-gnpinstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  set output "plots/gnm-cumulative.tex"
####  plot "../runtimes.gnminstances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}' lc 1, \
####       "../runtimes.gnminstances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-2S' lc 3, \
####       "../runtimes.gnminstances.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}-2S'" lc 4
####  
####  ######################################################################################################
####  # Plots showing when it's better to swap graphs: varying density
####  ######################################################################################################
####  
####  set size square
####  unset logscale
####  set output "plots/density-when-swap.tex"
####  set title
####  set xlabel "Density of $G$"
####  set ylabel "Density of $H$"
####  set format x
####  set format y
####  set xtics 0,.2
####  set ytics 0,.2
####  set xrange[0:1]
####  set yrange[0:1]
####  plot "< awk 'NR==1 || ($6 < $7*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($6 < $7 && $6 >= $7*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
####       "< awk 'NR==1 || ($7 < $6*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
####       "< awk 'NR==1 || ($7 < $6 && $7 >= $6*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
####      x lc rgb '#888888' notitle, \
####      1-x lc rgb '#888888' notitle
####  
####  set output "plots/density-extremeness-when-swap.tex"
####  set title
####  set xlabel "$\\left|\\frac{1}{2} - d_G\\right|$"
####  set ylabel "$\\left|\\frac{1}{2} - d_H\\right|$"
####  set format x
####  set format y
####  set xtics 0,.1
####  set ytics 0,.1
####  set xrange[0:.5]
####  set yrange[0:.5]
####  plot "< awk 'NR==1 || ($3 < $4*.5 && ($3<100000 || $4<100000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($3 < $4 && $3 >= $4*.5 && ($3<100000 || $4<100000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
####       "< awk 'NR==1 || ($4 < $3*.5 && ($3<100000 || $4<100000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
####       "< awk 'NR==1 || ($4 < $3 && $4 >= $3*.5 && ($3<100000 || $4<100000))' runtimes-and-extremeness.randomplaininstances2.txt" using 1:2 w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
####      x lc rgb '#888888' notitle
####  
####  set output "plots/density-when-swap-b.tex"
####  set title
####  set xlabel "Density of $G$"
####  set ylabel "Density of $H$"
####  set format x
####  set format y
####  set xtics 0,.2
####  set ytics 0,.2
####  set xrange[0:1]
####  set yrange[0:1]
####  plot "< awk 'NR==1 || ($11 < $12 && ($11<100000 || $12<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 12 pointsize .18 lc rgb '#1f1212b4' notitle, \
####       "< awk 'NR==1 || ($12 < $11 && ($11<100000 || $12<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 12 pointsize .18 lc rgb '#ff0000' notitle, \
####      x lc rgb '#888888' notitle, \
####      1-x lc rgb '#888888' notitle
####  
####  set output "plots/density-when-swap-nosort.tex"
####  set title
####  set xlabel "Density of $G$"
####  set ylabel "Density of $H$"
####  set format x
####  set format y
####  plot "< awk 'NR==1 || ($14 < $15 && ($14<100000 || $15<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 15 pointsize .18 lc rgb '#1f1515b4' notitle, \
####       "< awk 'NR==1 || ($15 < $14 && ($14<100000 || $15<100000))' ../runtimes.randomplaininstances2.txt" using 3:5 w p pointtype 15 pointsize .18 lc rgb '#ff0000' notitle, \
####      x lc rgb '#888888' notitle, \
####      1-x lc rgb '#888888' notitle
####  
####  
####  ######################################################################################################
####  # Plots showing when it's better to swap graphs: varying order
####  ######################################################################################################
####  
####  set size square
####  unset logscale
####  set output "plots/order-when-swap.tex"
####  set title
####  set xlabel "Order of $G$"
####  set ylabel "Order of $H$"
####  set format x
####  set format y
####  set xtics 10,5
####  set ytics 10,5
####  set xrange[10:40]
####  set yrange[10:40]
####  plot "< awk 'NR==1 || ($6 < $7*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances3.txt" using 2:4 w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($6 < $7 && $6 >= $7*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances3.txt" using 2:4 w p pointtype 7 pointsize .18 lc rgb '#afcbe0' notitle, \
####       "< awk 'NR==1 || ($7 < $6*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances3.txt" using 2:4 w p pointtype 7 pointsize .18 lc rgb '#e00d0d' notitle, \
####       "< awk 'NR==1 || ($7 < $6 && $7 >= $6*.5 && ($6<100000 || $7<100000))' ../runtimes.randomplaininstances3.txt" using 2:4 w p pointtype 7 pointsize .18 lc rgb '#efacac' notitle, \
####      x lc rgb '#888888' notitle
####  
####  ######################################################################################################
####  exit
####  ######################################################################################################
####  
####  
####  set output "plots/mcs33ved-nodes.tex"
####  set title "33 per cent labelled MCS instances, nodes"
####  plot "../experiments/gpgnode-results/mcs33ved/nodes.data" u 5:7 notitle w points pointtype 7 pointsize .1, x notitle
####  
####  
####  set xlabel '\textproc{McSplit} runtime (ms)'
####  set ylabel '\textproc{McSplit}${\downarrow}$ runtime (ms)'
####  
####  plot "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 7:8 notitle w points pointtype 7 pointsize .1, x notitle
####  
####  
####  set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.tex"
####  set title
####  plot "< awk 'NR==1 || $7 >= .7' kup-vs-kdown-mcsplain.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || $7 < .7' kup-vs-kdown-mcsplain.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#ff7f0e' notitle, \
####       x lc rgb '#888888' notitle
####  
####  set output "plots/mcs33ved-runtime-mcsplit-vs-mcsplitdown.tex"
####  set title
####  plot "< awk 'NR==1 || $7 >= .5' kup-vs-kdown-mcs33ved.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || $7 < .5' kup-vs-kdown-mcs33ved.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#ff7f0e' notitle, \
####       x lc rgb '#888888' notitle
####  
####  
####  
####  set terminal tikz standalone color size 6cm,4cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  set xlabel 'Solution size as a proportion of $n_G$'
####  set ylabel 'Ratio of run times'
####  unset logscale x
####  set output "plots/mcsplain-runtime-ratio-vs-solution-size.tex"
####  unset format x
####  unset format y
####  set title
####  plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' kup-vs-kdown-mcsplain.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' kup-vs-kdown-mcsplain.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
####      1 lc rgb '#888888' notitle
####  
####  set output "plots/mcs33ved-runtime-ratio-vs-solution-size.tex"
####  set title
####  plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' kup-vs-kdown-mcs33ved.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' kup-vs-kdown-mcs33ved.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
####      1 lc rgb '#888888' notitle
####  
####  set border 1
####  set terminal tikz standalone color size 8cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
####  set format y '$10^{%T}$'
####  set output "plots/sip-runtime-ratio-vs-solution-size.tex"
####  set title
####  set xlabel '$n_G$ minus order of max common subgraph'
####  plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' realkdown-vs-kdown-sip.txt" using ($2-$6):($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
####       "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' realkdown-vs-kdown-sip.txt" using ($2-$6):($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
####      1 lc rgb '#888888' notitle

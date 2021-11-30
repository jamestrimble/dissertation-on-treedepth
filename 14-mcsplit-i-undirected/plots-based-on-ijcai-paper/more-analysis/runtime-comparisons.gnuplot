# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 7cm,7cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror

set xlabel "Heuristic: minimise product"
set ylabel "Heuristic: minimise max(leftsize, rightsize)"
set format x '$10^{%T}$'
set format y '$10^{%T}$'

set output "plots/mcsplain-runtime.tex"
set title "Plain MCS instances, run time"
plot "../experiments/gpgnode-results/mcsplain/runtimes.data" u 6:8 notitle w points pointtype 7 pointsize .1, x notitle

set output "plots/mcsplain-nodes.tex"
set title "Plain MCS instances, nodes"
plot "../experiments/gpgnode-results/mcsplain/nodes.data" u 6:8 notitle w points pointtype 7 pointsize .1, x notitle

set output "plots/mcs33ved-runtime.tex"
set title "33 per cent labelled MCS instances, run time"
plot "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 5:7 notitle w points pointtype 7 pointsize .1, x notitle

set output "plots/mcs33ved-nodes.tex"
set title "33 per cent labelled MCS instances, nodes"
plot "../experiments/gpgnode-results/mcs33ved/nodes.data" u 5:7 notitle w points pointtype 7 pointsize .1, x notitle


set xlabel '\textproc{McSplit} runtime (ms)'
set ylabel '\textproc{McSplit}${\downarrow}$ runtime (ms)'

plot "../experiments/gpgnode-results/mcs33ved/runtimes.data" u 7:8 notitle w points pointtype 7 pointsize .1, x notitle


set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.tex"
set title
plot "< awk 'NR==1 || $7 >= .7' kup-vs-kdown-mcsplain.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || $7 < .7' kup-vs-kdown-mcsplain.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#ff7f0e' notitle, \
     x lc rgb '#888888' notitle

set output "plots/mcs33ved-runtime-mcsplit-vs-mcsplitdown.tex"
set title
plot "< awk 'NR==1 || $7 >= .5' kup-vs-kdown-mcs33ved.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || $7 < .5' kup-vs-kdown-mcs33ved.txt" u 4:5 w points pointtype 7 pointsize .18 lc rgb '#ff7f0e' notitle, \
     x lc rgb '#888888' notitle



set terminal tikz standalone color size 6cm,4cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set xlabel 'Solution size as a proportion of $n_G$'
set ylabel 'Ratio of run times'
unset logscale x
set output "plots/mcsplain-runtime-ratio-vs-solution-size.tex"
unset format x
unset format y
set title
plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' kup-vs-kdown-mcsplain.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' kup-vs-kdown-mcsplain.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
    1 lc rgb '#888888' notitle

set output "plots/mcs33ved-runtime-ratio-vs-solution-size.tex"
set title
plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' kup-vs-kdown-mcs33ved.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' kup-vs-kdown-mcs33ved.txt" using 7:($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
    1 lc rgb '#888888' notitle

set border 1
set terminal tikz standalone color size 8cm,5.5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set format y '$10^{%T}$'
set output "plots/sip-runtime-ratio-vs-solution-size.tex"
set title
set xlabel '$n_G$ minus order of max common subgraph'
plot "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && $4<1000000 && $5<1000000)' realkdown-vs-kdown-sip.txt" using ($2-$6):($4/$5) w p pointtype 7 pointsize .18 lc rgb '#1f77b4' notitle, \
     "< awk 'NR==1 || ($4>=1 && $5>=1 && ($4>=100||$5 >= 100) && ($4>=1000000||$5>=1000000))' realkdown-vs-kdown-sip.txt" using ($2-$6):($4/$5) w p pointtype 7 pointsize .18 lc rgb '#ff4444' notitle, \
    1 lc rgb '#888888' notitle



set terminal tikz standalone color size 7cm,7cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set logscale x
set border 3

set format x '$10^{%T}$'
set format y '$10^{%T}$'

load 'moreland.pal'
set cbrange [0:1]

set xlabel '\textproc{McSplit} runtime (ms)'
set ylabel '\textproc{McSplit}${\downarrow}$ runtime (ms)'

set output "plots/mcsplain-runtime-kasc-kdesc.tex"
set title "Plain MCS instances, run time, k-ascending vs k-descending"
plot "kup-vs-kdown-mcsplain.txt" u 4:5:7 w points pointtype 7 pointsize .1 lc palette notitle, x notitle, 2.6*x with line notitle

set output "plots/mcs33ved-runtime-kasc-kdesc.tex"
set title "33 per cent labelled MCS instances, run time, k-ascending vs k-descending"
plot "kup-vs-kdown-mcs33ved.txt" u 4:5:7 w points pointtype 7 pointsize .1 lc palette notitle, x notitle, 2.6*x with line notitle

#####################################################

#  Commented out: scatter plot with instance types coloured. Small multiples will probably be easier to read.
#  set title
#  set terminal tikz standalone color size 12cm,7cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
#  set xlabel 'CP-FC runtime (ms)'
#  set ylabel '\textproc{McSplit} runtime (ms)'
#  set output "plots/mcsplain-runtime-mcsplit-cpfc.tex"
#  set xrange [1:1000100]
#  set yrange [1:1000100]
#  set size square
#  set key outside
#  set key right center reverse Left
#  plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 title "Random", \
#       "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):8 w points lc rgb "#ff7f0e" pointtype 7 pointsize .1 title "Regular mesh", \
#       "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):8 w points lc rgb "#2ca02c" pointtype 7 pointsize .1 title "Irregular mesh", \
#       "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):8 w points lc rgb "#d62728" pointtype 7 pointsize .1 title "BV", \
#       "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):8 w points lc rgb "#9467bd" pointtype 7 pointsize .1 title "Irregular BV", \
#      x notitle

set title
set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set xrange [1:1000100]
set yrange [1:1000100]
set size square

#MCS plain
set xlabel 'CP-FC runtime (ms)'
set ylabel '\textproc{McSplit}$\downarrow$ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-random.tex"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-regular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-irregular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-irregular-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u ($3*1000):9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle

set xlabel 'Clique runtime (ms)'
set ylabel '\textproc{McSplit}$\downarrow$ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-clique-random.tex"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data | awk 'NR==1 || !/r02/'" u 2:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, \
     "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data | awk 'NR==1 || /r02/'" u 2:9 w points lc rgb "#ff7f0e" pointtype 7 pointsize .1 notitle, \
    x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-regular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 2:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-irregular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 2:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 2:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-irregular-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 2:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle

set xlabel '$k\downarrow$ runtime (ms)'
set ylabel '\textproc{McSplit}$\downarrow$ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-kdown-random.tex"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 5:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-regular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 5:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-irregular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 5:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 5:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-irregular-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u 5:9 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle


# MCS 33ved instances
set xlabel 'CP-FC runtime (ms)'
set ylabel '\textproc{McSplit}$\downarrow$ runtime (ms)'
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-random.tex"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-regular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-irregular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-irregular-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u ($3*1000):8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle

set xlabel 'Clique runtime (ms)'
set ylabel '\textproc{McSplit}$\downarrow$ runtime (ms)'
set output "plots/mcs33ved-runtime-mcsplitdown-clique-random.tex"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-regular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-irregular-mesh.tex"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-irregular-bv.tex"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u 2:8 w points lc rgb "#1f77b4" pointtype 7 pointsize .1 notitle, x lc rgb "#444444" notitle

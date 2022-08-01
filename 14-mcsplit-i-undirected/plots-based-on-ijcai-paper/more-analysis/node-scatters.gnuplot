# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

###  NODE COMPARISONS VS CP-FC  ###

set terminal pdfcairo size 5cm,5cm font "Times,10"

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror

set format x '10^{%L}'
set format y '10^{%L}'

set size square

set xrange [1:1e10]
set yrange [1:1e10]

set style circle radius screen 0.0035

set xlabel 'CP-FC recursive calls'
set ylabel 'MᴄSᴘʟɪᴛ recursive calls'

set output "plots/plain-nodes-scatter.pdf"
plot "../experiments/gpgnode-results/mcsplain/nodes.data" u 3:8 w circles lc rgb circleColour fill solid noborder notitle, \
     x lc rgb "#444444" notitle

set output "plots/33ved-nodes-scatter.pdf"
plot "../experiments/gpgnode-results/mcs33ved/nodes.data" u 3:7 w circles lc rgb circleColour fill solid noborder notitle, \
     x lc rgb "#444444" notitle



set xlabel 'Clique recursive calls'
set ylabel 'MᴄSᴘʟɪᴛ recursive calls'

set output "plots/plain-nodes-scatter-vs-clique.pdf"
plot "../experiments/gpgnode-results/mcsplain/nodes.data" u 2:8 w circles lc rgb circleColour fill solid noborder notitle, \
     x lc rgb "#444444" notitle

set output "plots/33ved-nodes-scatter-vs-clique.pdf"
plot "../experiments/gpgnode-results/mcs33ved/nodes.data" u 2:7 w circles lc rgb circleColour fill solid noborder notitle, \
     x lc rgb "#444444" notitle

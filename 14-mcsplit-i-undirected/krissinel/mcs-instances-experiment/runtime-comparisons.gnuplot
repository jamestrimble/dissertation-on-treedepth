# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

set terminal pdfcairo size 5cm,5cm font "Times,10"

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror
set size square
set xrange [.5:1500000]
set yrange [.5:1500000]

set style circle radius screen 0.0035

set style rect fc lt -1 fs solid 0.15 noborder
set obj 1 rect from .5, 1000000.5 to graph 1, 1500000
set obj 2 rect from 1000000.5, graph 0 to 1500000, graph 1

set xlabel "Krissinel and Henrick"
set format x '10^{%L}'
set format y '10^{%L}'

set output "plots/kh-vs-mcsplit.pdf"
set ylabel 'MᴄSᴘʟɪᴛ'
plot x notitle lc rgb '#444444' lw 0.6, \
     "fatanode-results/runtimes.txt" u (jitt($6)):(jitt($2)) notitle w circles lc rgb circleColour fill solid noborder

set output "plots/kh-vs-mcsplit-1.pdf"
set ylabel 'MᴄSᴘʟɪᴛ – 1'
plot x notitle lc rgb '#444444' lw 0.6, \
     "fatanode-results/runtimes.txt" u (jitt($6)):(jitt($3)) notitle w circles lc rgb circleColour fill solid noborder

set output "plots/kh-vs-mcsplit-2.pdf"
set ylabel 'MᴄSᴘʟɪᴛ – 1, 2'
plot x notitle lc rgb '#444444' lw 0.6, \
     "fatanode-results/runtimes.txt" u (jitt($6)):(jitt($4)) notitle w circles lc rgb circleColour fill solid noborder

set output "plots/kh-vs-mcsplit-3.pdf"
set ylabel 'MᴄSᴘʟɪᴛ – 1, 2, 3'
plot x notitle lc rgb '#444444' lw 0.6, \
     "fatanode-results/runtimes.txt" u (jitt($6)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder



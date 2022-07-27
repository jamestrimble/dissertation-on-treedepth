# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

load "moreland.pal"

set terminal pdfcairo size 7cm,7cm font "Times,10"

set border 3
set grid
set logscale x
set logscale y
set xtics nomirror
set ytics nomirror

set format x '10^{%L}'
set format y '10^{%L}'

set xrange [.5:1500000]
set yrange [.5:1500000]

set style circle radius screen 0.0025

set style rect fc lt -1 fs solid 0.15 noborder
set obj 1 rect from .5, 1000000.5 to graph 1, 1500000
set obj 2 rect from 1000000.5, graph 0 to 1500000, graph 1
set xlabel 'MᴄSᴘʟɪᴛ runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'

set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.pdf"
set title
plot x lc rgb '#888888' notitle, \
     "kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)):7 notitle w circles lc palette z fill solid noborder

set output "plots/mcs33ved-runtime-mcsplit-vs-mcsplitdown.pdf"
set title
plot x lc rgb '#888888' notitle, \
     "kup-vs-kdown-mcs33ved.txt" u (jitt($4)):(jitt($5)):7 notitle w circles lc palette z fill solid noborder

# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

set terminal pdfcairo size 5cm,5cm font "Times,10"

set size square

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

set style circle radius screen 0.0035

set style rect fc lt -1 fs solid 0.15 noborder
set obj 1 rect from .5, 1000000.5 to graph 1, 1500000
set obj 2 rect from 1000000.5, graph 0 to 1500000, graph 1

######################################################################################################
# Run times, not swapping graphs vs swapping them
######################################################################################################

set output "plots/left-vs-right-mcsplain-jittered.pdf"
set title
set xlabel 'MᴄSᴘʟɪᴛ' 
set ylabel 'MᴄSᴘʟɪᴛ with graphs swapped'
plot "../fatanode-results/runtimes.mcsplaininstances.txt" using (jitt($1)):(jitt($6)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/left-vs-right-random2-jittered.pdf"
set title
plot "../fatanode-results/runtimes.randomplaininstances2.txt" using (jitt($6)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/left-vs-right-random3-jittered.pdf"
set title
plot "../fatanode-results/runtimes.randomplaininstances3.txt" using (jitt($6)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

######################################################################################################
# Run times, not swapping graphs vs smart swapping them
######################################################################################################

set output "plots/left-vs-smart-random2-jittered.pdf"
set title
set xlabel 'MᴄSᴘʟɪᴛ' 
set ylabel 'MᴄSᴘʟɪᴛ-SD'
plot "../fatanode-results/runtimes.randomplaininstances2.txt" using (jitt($6)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/left-vs-smart-random3-jittered.pdf"
set title
set xlabel 'MᴄSᴘʟɪᴛ' 
set ylabel 'MᴄSᴘʟɪᴛ-SO'
plot "../fatanode-results/runtimes.randomplaininstances3.txt" using (jitt($6)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

######################################################################################################
# Run times, McSplit vs McSplit2 Barabasi-Albert and G(n,m)
######################################################################################################

set output "plots/mcsplit-vs-mcsplit2-ba-jittered.pdf"
set title
set xlabel "MᴄSᴘʟɪᴛ"
set ylabel "MᴄSᴘʟɪᴛ-2S"
plot "../fatanode-results/runtimes.barabasialbertinstances.txt" using (jitt($6)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-vs-mcsplit2-ba-gnm-jittered.pdf"
set title
set xlabel "MᴄSᴘʟɪᴛ"
set ylabel "MᴄSᴘʟɪᴛ-2S"
plot "../fatanode-results/runtimes.ba-gnpinstances.txt" using (jitt($6)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-vs-mcsplit2-gnm-jittered.pdf"
set title
set xlabel "MᴄSᴘʟɪᴛ"
set ylabel "MᴄSᴘʟɪᴛ-2S"
plot "../fatanode-results/runtimes.gnminstances.txt" using (jitt($6)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle


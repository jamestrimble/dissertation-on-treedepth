# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

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

set style circle radius screen 0.003

set style rect fc lt -1 fs solid 0.15 noborder
set obj 1 rect from .5, 1000000.5 to graph 1, 1500000
set obj 2 rect from 1000000.5, graph 0 to 1500000, graph 1
set xlabel 'MᴄSᴘʟɪᴛ runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'

set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.pdf"
set title
plot "< awk 'NR==1 || $7 >= .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, \
     "< awk 'NR==1 || $7 < .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColourOrange fill solid noborder, \
     x lc rgb '#888888' notitle

set output "plots/mcs33ved-runtime-mcsplit-vs-mcsplitdown.pdf"
set title
plot "< awk 'NR==1 || $7 >= .5' kup-vs-kdown-mcs33ved.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, \
     "< awk 'NR==1 || $7 < .5' kup-vs-kdown-mcs33ved.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColourOrange fill solid noborder, \
     x lc rgb '#888888' notitle


###  SMALL MULTIPLES BY FAMILY  ###

set title
set terminal pdfcairo size 5cm,5cm font "Times,10"
set size square

set style circle radius screen 0.0035

#MCS plain
set xlabel 'CP-FC runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-random.pdf"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($3*1000)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-regular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($3*1000)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-irregular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($3*1000)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($3*1000)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-cpfc-irregular-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($3*1000)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle

set xlabel 'Clique runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-clique-random.pdf"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data | awk 'NR==1 || !/r02/'" u (jitt($2)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, \
     "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data | awk 'NR==1 || /r02/'" u (jitt($2)):(jitt($9)) w circles lc rgb circleColourOrange fill solid noborder notitle, \
    x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-regular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($2)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-irregular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($2)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($2)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-clique-irregular-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($2)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle

set xlabel 'k↓ runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'
set output "plots/mcsplain-runtime-mcsplitdown-kdown-random.pdf"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($5)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-regular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($5)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-irregular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($5)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($5)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcsplain-runtime-mcsplitdown-kdown-irregular-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcsplain/runtimes.data" u (jitt($5)):(jitt($9)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle


# MCS 33ved instances
set xlabel 'CP-FC runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-random.pdf"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($3*1000)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-regular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($3*1000)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-irregular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($3*1000)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($3*1000)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-cpfc-irregular-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($3*1000)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle

set xlabel 'Clique runtime (ms)'
set ylabel 'MᴄSᴘʟɪᴛ↓ runtime (ms)'
set output "plots/mcs33ved-runtime-mcsplitdown-clique-random.pdf"
plot "< awk 'NR==1 || /_r[0-9]*_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($2)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-regular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]D_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($2)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-irregular-mesh.pdf"
plot "< awk 'NR==1 || /_m[0-9]Dr[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($2)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($2)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle
set output "plots/mcs33ved-runtime-mcsplitdown-clique-irregular-bv.pdf"
plot "< awk 'NR==1 || /_b0[0-9]m_/' ../experiments/gpgnode-results/mcs33ved/runtimes.data" u (jitt($2)):(jitt($8)) w circles lc rgb circleColour fill solid noborder notitle, x lc rgb "#444444" notitle

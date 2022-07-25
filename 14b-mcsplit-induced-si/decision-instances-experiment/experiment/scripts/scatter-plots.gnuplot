# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

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

## set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.pdf"
## set title
## plot "< awk 'NR==1 || $7 >= .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, \
##      "< awk 'NR==1 || $7 < .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColourOrange fill solid noborder, \
##      x lc rgb '#888888' notitle

#### Scatter small multiples ####

set terminal pdfcairo size 5cm,5cm font "Times,10"

set key off

unset xlabel
unset ylabel

set output "plots/scatter-mcsplit-si-ll-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($2)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-am-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-static-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($6)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow-nosupp-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($9)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($10)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri-ds-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($11)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-vf3-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($12)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle


set output "plots/scatter-presolve-mcsplit-si-ll-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($2)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-am-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-static-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($6)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow-nosupp-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($9)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($10)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri-ds-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($11)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-vf3-jittered.pdf"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($12)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

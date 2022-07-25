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

set style circle radius screen 0.0035

set style rect fc lt -1 fs solid 0.15 noborder
set obj 1 rect from .5, 1000000.5 to graph 1, 1500000
set obj 2 rect from 1000000.5, graph 0 to 1500000, graph 1

## set output "plots/mcsplain-runtime-mcsplit-vs-mcsplitdown.png"
## set title
## plot "< awk 'NR==1 || $7 >= .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, \
##      "< awk 'NR==1 || $7 < .7' kup-vs-kdown-mcsplain.txt" u (jitt($4)):(jitt($5)) notitle w circles lc rgb circleColourOrange fill solid noborder, \
##      x lc rgb '#888888' notitle

#### Scatter small multiples ####

#set terminal.pngcairo size 5cm,5cm font "Times,10"
set terminal pngcairo font "Times,48" size 1280,1280

set key off

unset xlabel
unset ylabel

set output "plots/scatter-mcsplit-si-ll-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($2)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-am-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-static-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($6)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow-nosupp-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($9)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($10)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri-ds-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($11)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-vf3-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($3)):(jitt($12)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle


set output "plots/scatter-presolve-mcsplit-si-ll-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($2)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-am-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($7)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-static-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($6)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow-nosupp-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($9)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($10)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri-ds-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($11)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-vf3-jittered.png"
plot "fatanode-results/runtimes-tidied.txt" using (jitt($14)):(jitt($12)) notitle w circles lc rgb circleColour fill solid noborder, \
    x lc rgb '#888888' notitle


#### Scatter small multiples: by family ####

set output "plots/by-family/scatter-Scalefree-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Scalefree.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-LV.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-BVG.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-M4D.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Rand.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-PR.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Phase.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Meshes.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Images.txt" using (jitt($3)):(jitt($8)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle


set output "plots/by-family/scatter-Scalefree-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Scalefree.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-LV.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-BVG.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-M4D.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Rand.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-PR.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Phase.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Meshes.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images-vbos-jittered.png"
plot "fatanode-results/by-family/runtimes-tidied-Images.txt" using (jitt($3)):(jitt($16)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

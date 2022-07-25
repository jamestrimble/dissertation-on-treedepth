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

set terminal pngcairo font "Times,48" size 1280,1280

set key off

unset xlabel
unset ylabel

#### Scatter small multiples: by family ####

set output "plots/by-family/scatter-Scalefree-jittered.png"
plot "fatanode-results/by-family/runtimes-Scalefree.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV-jittered.png"
plot "fatanode-results/by-family/runtimes-LV.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG-jittered.png"
plot "fatanode-results/by-family/runtimes-BVG.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D-jittered.png"
plot "fatanode-results/by-family/runtimes-M4D.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand-jittered.png"
plot "fatanode-results/by-family/runtimes-Rand.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR-jittered.png"
plot "fatanode-results/by-family/runtimes-PR.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase-jittered.png"
plot "fatanode-results/by-family/runtimes-Phase.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes-jittered.png"
plot "fatanode-results/by-family/runtimes-Meshes.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images-jittered.png"
plot "fatanode-results/by-family/runtimes-Images.txt" using (jitt($2)):(jitt($5)) notitle w circles lc rgb circleColour fill solid noborder, x lc rgb '#888888' notitle

#### end of Scatter small multiples: by family  ####

# vim: set et ft=gnuplot sw=4 :

set size nosquare
set border 3
set grid
set xtics nomirror
set ytics nomirror
set key outside
set key right bottom

set logscale x
unset logscale y
set format x '$10^{%T}$'
set xlabel "Run time (ms)"
set xtics 1,1000,1000000
set ytics autofreq
set xrange[1:1000000]
unset yrange
set key right bottom

#### Cumulative small multiples ####

set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set key off

set output "plots/cumulative-mcsplit-si-ll.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-LL' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-si-am.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 7:($7>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-AM' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-si-static.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-static' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-glasgow.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-glasgow-nosupp.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supp.' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-ri.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-ri-ds.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 11:($11>=1e6?1e-10:1) smooth cumulative w l ti 'RI-DS' lc rgb '#1f78b4'

set output "plots/cumulative-mcsplit-vf3.tex"
plot \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc rgb '#a6cee3', \
     "fatanode-results/runtimes-tidied.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc rgb '#1f78b4'

#### end of Cumulative small multiples ####

set key right bottom
set xtics autofreq
set ylabel "Number of instances solved"
set terminal tikz standalone color size 12cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set output "plots/cumulative-presolve.tex"
plot "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI' lc 1, \
     "fatanode-results/runtimes-tidied.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 2, \
     "fatanode-results/runtimes-tidied.txt" u 14:($14>=1e6?1e-10:1) smooth cumulative w l ti 'Dom then static' lc 3, \
     "fatanode-results/runtimes-tidied.txt" u 13:($13>=1e6?1e-10:1) smooth cumulative w l ti 'Static then dom' lc 4

set output "plots/cumulative.tex"
plot "fatanode-results/runtimes-tidied.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-LL' lc 1, \
     "fatanode-results/runtimes-tidied.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "fatanode-results/runtimes-tidied.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom-D1' lc 3, \
     "fatanode-results/runtimes-tidied.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom-D2' lc 4, \
     "fatanode-results/runtimes-tidied.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-static' lc 5, \
     "fatanode-results/runtimes-tidied.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 6, \
     "fatanode-results/runtimes-tidied.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 7, \
     "fatanode-results/runtimes-tidied.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 8, \
     "fatanode-results/runtimes-tidied.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 9

set output "plots/sat-cumulative.tex"
plot "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-LL' lc 1, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 3, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 4, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-static' lc 5, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 6, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 7, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 8, \
     "< awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 9

set output "plots/unsat-cumulative.tex"
plot "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-LL' lc 1, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom-D1' lc 3, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom-D2' lc 4, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-static' lc 5, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 6, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 7, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 8, \
     "< awk 'NR==1 || $15==0' fatanode-results/runtimes-tidied-and-satisfiabilities.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 9

set output "plots/cumulative-without-disconnected-instances.tex"
plot "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 2:($2>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-LL' lc 1, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 3:($3>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom' lc 2, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 4:($4>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom-D1' lc 3, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 5:($5>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-dom.D2' lc 4, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 6:($6>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}-SI-static' lc 5, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 8:($8>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow' lc 6, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti 'Glasgow, no supplementals' lc 7, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti 'RI' lc 8, \
     "fatanode-results/runtimes-tidied-without-disconnected-instances.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti 'VF3' lc 9

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
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-domstatic-vs-glasgow.tex"
set xlabel "\\textproc{McSplit} dom then static"
set ylabel "Glasgow"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-vf3.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "VF3"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($12-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-ll.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "\\textproc{McSplit}-SI-LL"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($2-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-static.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "\\textproc{McSplit}-static"
set logscale cb
plot "fatanode-results/runtimes-tidied-and-densities.txt" using ($3-.5+rand(0)):($6-.5+rand(0)):19 w p pointtype 7 pointsize .15 lc var notitle, \
    x lc rgb '#888888' notitle

set output "plots/mcsplit-si-vs-adjmat.tex"
set xlabel "\\textproc{McSplit}"
set ylabel "\\textproc{McSplit}-adjmat"
set logscale cb
plot "fatanode-results/runtimes-tidied-and-densities.txt" using ($3-.5+rand(0)):($7-.5+rand(0)):19 w p pointtype 7 pointsize .15 lc var notitle, \
    x lc rgb '#888888' notitle

#### Scatter small multiples ####

set terminal tikz standalone color size 5cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set key off

unset xlabel
unset ylabel

#### Scatter small multiples: by family ####

set format x '10^{%T}'
set format y '10^{%T}'
##awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-Scalefree.txt
##awk 'NR==1 || $15==2 || $15==11' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-LV.txt
##awk 'NR==1 || $15==3 || $15==4' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-BVG.txt
##awk 'NR==1 || $15==5 || $15==6' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-M4D.txt
##awk 'NR==1 || $15==7' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-Rand.txt
##awk 'NR==1 || $15==9' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-PR.txt
##awk 'NR==1 || $15==12' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-Phase.txt
##awk 'NR==1 || $15==13' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-Meshes.txt
##awk 'NR==1 || $15==14' fatanode-results/runtimes-tidied-with-families.txt > fatanode-results/by-family/runtimes-tidied-Images.txt
set term pdfcairo size 5cm,5cm font "Times,10"

set output "plots/by-family/scatter-Scalefree.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Scalefree.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV.pdf"
plot "fatanode-results/by-family/runtimes-tidied-LV.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG.pdf"
plot "fatanode-results/by-family/runtimes-tidied-BVG.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D.pdf"
plot "fatanode-results/by-family/runtimes-tidied-M4D.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Rand.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR.pdf"
plot "fatanode-results/by-family/runtimes-tidied-PR.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Phase.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Meshes.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Images.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle


set output "plots/by-family/scatter-Scalefree-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Scalefree.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-LV.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-BVG.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-M4D.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Rand.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-PR.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Phase.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Meshes.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Images.txt" using ($3-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle


set output "plots/by-family/scatter-Scalefree-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Scalefree.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-LV-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-LV.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-BVG-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-BVG.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-M4D-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-M4D.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Rand-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Rand.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-PR-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-PR.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Phase-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Phase.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Meshes-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Meshes.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set output "plots/by-family/scatter-Images-vbmcsplit-vbos.pdf"
plot "fatanode-results/by-family/runtimes-tidied-Images.txt" using ($17-.5+rand(0)):($16-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#cc1f77b4' notitle, x lc rgb '#888888' notitle

set format x '$10^{%T}$'
set format y '$10^{%T}$'

#### end of Scatter small multiples: by family  ####

#### Density of target graph vs runtime ratio ####

unset xrange
unset yrange
unset format x
unset format y
set size nosquare
set xlabel "Density of target graph"
set ylabel "Ratio of run times"

set term pdfcairo size 8cm,6cm font "Times,10"

set output "plots/density-runtime-ratio.pdf"
plot "<awk 'NR==1 || (($3>1 && $7>1) && $3<1000000 && $7<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using 19:($3/$7) pointtype 7 pointsize .15 lc rgb '#bb1f77b4'

set xlabel "Combined density"
# Instead of using just the target graph density, try using "number of possible edges across both graphs"
set output "plots/density-runtime-ratio-using-both-graphs.pdf"
plot "<awk 'NR==1 || (($3>1 && $7>1) && $3<1000000 && $7<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using (($17*$16*($16-1) + $19*$18*($18-1)) / ($16*($16-1) + $18*($18-1))):($3/$7) pointtype 7 pointsize .15 lc rgb '#bb1f77b4'

set xlabel "Density of target graph"
set output "plots/density-runtime-ratio-glasgow.pdf"
plot "<awk 'NR==1 || (($3>1 && $8>1) && $3<1000000 && $8<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using 19:($3/$8) pointtype 7 pointsize .15 lc rgb '#bb1f77b4'

set xlabel "Density of target graph"
set output "plots/density-runtime-ratio-glasgow-nosupps.pdf"
plot "<awk 'NR==1 || (($3>1 && $9>1) && $3<1000000 && $9<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using 19:($3/$9) pointtype 7 pointsize .15 lc rgb '#bb1f77b4'

set xlabel "Density of target graph"
set output "plots/density-runtime-ratio-glasgow-adjmat.pdf"
plot "<awk 'NR==1 || (($7>1 && $8>1) && $7<1000000 && $8<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using 19:($7/$8) pointtype 7 pointsize .15 lc rgb '#bb1f77b4'

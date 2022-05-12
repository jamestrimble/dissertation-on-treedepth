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

set output "plots/scatter-mcsplit-si-ll.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($2-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-am.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($7-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-si-static.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($6-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-glasgow-nosupp.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($9-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($10-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-ri-ds.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($11-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-mcsplit-vf3.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($3-.5+rand(0)):($12-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle


set output "plots/scatter-presolve-mcsplit-si-ll.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($2-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-am.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($7-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-si-static.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($6-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($8-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-glasgow-nosupp.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($9-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($10-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-ri-ds.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($11-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

set output "plots/scatter-presolve-mcsplit-vf3.tex"
plot "fatanode-results/runtimes-tidied.txt" using ($14-.5+rand(0)):($12-.5+rand(0)) w p pointtype 7 pointsize .15 lc rgb '#1f77b4' notitle, \
    x lc rgb '#888888' notitle

#### end of Scatter small multiples ####

#### Density of target graph vs runtime ratio ####

unset xrange
unset yrange
unset format x
unset format y
set size nosquare

set terminal tikz standalone color size 8cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'
set output "plots/density-runtime-ratio.tex"
plot "<awk 'NR==1 || (($3>1 && $7>1) && $3<1000000 && $7<1000000)' fatanode-results/runtimes-tidied-and-densities.txt" \
	using 19:($3/$7) pointtype 7 pointsize .15 lc rgb '#1f77b4'

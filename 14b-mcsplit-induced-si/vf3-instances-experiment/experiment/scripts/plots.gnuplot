# vim: set et ft=gnuplot sw=4 :

set terminal tikz standalone color size 12cm,6cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set size nosquare
set border 3
set grid
set xtics nomirror
set ytics nomirror
unset logscale x
set logscale y

#set format x '$10^{%T}$'
#set format y '$10^{%T}$'

set xlabel "Target graph order"
set ylabel "Run time (ms)"
set xtics autofreq
set ytics autofreq
unset xrange
unset yrange
set yrange [1:10000000]
set key outside
set key right bottom

set output "plots/runtimes0.05-1.tex"
plot "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==1 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.1-1.tex"
plot "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==1 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.2-1.tex"
plot "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==1 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.3-1.tex"
plot "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==1 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.4-1.tex"
plot "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==1 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9



set output "plots/runtimes0.05-8.tex"
plot "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==8 && $2==0.05' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.1-8.tex"
plot "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==8 && $2==0.1' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.2-8.tex"
plot "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==8 && $2==0.2' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.3-8.tex"
plot "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==8 && $2==0.3' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

set output "plots/runtimes0.4-8.tex"
plot "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($5==10000000 ? 1/0 : $5) w lp ti '\textproc{McSplit}-SI' lc 1, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($4==10000000 ? 1/0 : $4) w lp ti '\textproc{McSplit}-SI-LL' lc 2, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($9==10000000 ? 1/0 : $9) w lp ti '\textproc{McSplit}-SI-a' lc 3, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($10==10000000 ? 1/0 : $10) w lp ti 'Glasgow' lc 5, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($11==10000000 ? 1/0 : $11) w lp ti 'Glasgow no-supp' lc 6, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($12==10000000 ? 1/0 : $12) w lp ti 'RI' lc 7, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($13==10000000 ? 1/0 : $13) w lp ti 'RI-DS' lc 8, \
     "< awk '$1==8 && $2==0.4' fatanode-results/runtimes-summary.txt" using 3:($14==10000000 ? 1/0 : $14) w lp ti 'VF3' lc 9

# vim: set et ft=gnuplot sw=4 :

load "../../../plot-utils/plot-utils.gnuplot"

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set border 3
set grid
set logscale x
set xtics nomirror
set ytics nomirror
set xrange[1:1000000]

set format x '$10^{%T}$'
set key right bottom

######################################################################################################
# Cumulative plots
######################################################################################################

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

######################################################################################################
# Cumulative plots, McSplit vs McSplit2 vs McSplit2'
######################################################################################################

set terminal tikz standalone color size 7cm,5cm font '\scriptsize' preamble '\usepackage{times,microtype,algorithm2e,algpseudocode,amssymb}'

set output "mcsplit-down-plots/mixandmatch-cumulative.tex"
plot "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 9:($9>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}$\downarrow$' lc 1, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 12:($12>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}$\downarrow$-SD' lc 2, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 13:($13>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}$\downarrow$-SO' lc 5, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 11:($11>=1e6?1e-10:1) smooth cumulative w l ti '\textproc{McSplit}$\downarrow$-2S' lc 3, \
     "../fatanode-results/runtimes.mcsplainmixandmatchinstances.txt" u 10:($10>=1e6?1e-10:1) smooth cumulative w l ti "\\textproc{McSplit}$\\downarrow$-2S'" lc 4

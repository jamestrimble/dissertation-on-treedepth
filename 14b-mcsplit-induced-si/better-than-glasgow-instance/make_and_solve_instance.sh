#!/bin/bash

#set -euo pipefail

TIMELIMIT=30

python3 make_instance.py $1 $2

python3 lad_to_gfu.py < P.lad > P.gfu
python3 lad_to_gfu.py < T.lad > T.gfu
python3 lad_to_vf3_undirected.py < P.lad > P.grf
python3 lad_to_vf3_undirected.py < T.lad > T.grf

timeout $TIMELIMIT ~/OthersCode/solnon-benchmarks/mcsplit-induced-subgraph-isomorphism/mcsp_sparse --lad --enumerate B P.lad T.lad | grep time | awk '{print $4}'
timeout $TIMELIMIT ~/OthersCode/glasgow-subgraph-solver/glasgow_subgraph_solver --format lad --induced --enumerate P.lad T.lad | grep runtime | awk '{print $3}'
#~/OthersCode/solnon-benchmarks/vf3lib/bin/vf3 -r 0 -u P.grf T.grf
timeout $TIMELIMIT ~/OthersCode/solnon-benchmarks/RI/ri36 ind gfu T.gfu P.gfu | grep 'total time' | awk '{print int($3 * 1000)}'

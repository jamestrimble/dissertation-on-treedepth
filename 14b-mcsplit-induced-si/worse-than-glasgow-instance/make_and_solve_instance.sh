#!/bin/bash

#set -euo pipefail

TIMELIMIT=100

python3 make_instance.py $1

python3 ../better-than-glasgow-instance/lad_to_gfu.py < P.lad > P.gfu
python3 ../better-than-glasgow-instance/lad_to_gfu.py < T.lad > T.gfu
python3 ../better-than-glasgow-instance/lad_to_vf3_undirected.py < P.lad > P.grf
python3 ../better-than-glasgow-instance/lad_to_vf3_undirected.py < T.lad > T.grf

timeout $((TIMELIMIT + 2)) ~/OthersCode/solnon-benchmarks/mcsplit-induced-subgraph-isomorphism/mcsp_sparse --lad --enumerate B P.lad T.lad > tmp.txt
if [ "$?" -eq "124" ]; then
    echo TIMEOUT
else
    cat tmp.txt | grep time | awk '{print $4}'
fi

timeout $((TIMELIMIT + 2)) ~/OthersCode/glasgow-subgraph-solver/glasgow_subgraph_solver --format lad --induced --enumerate P.lad T.lad > tmp.txt
if [ "$?" -eq "124" ]; then
    echo TIMEOUT
else
    cat tmp.txt | grep runtime | awk '{print $3}'
fi

timeout $((TIMELIMIT + 2)) ~/OthersCode/glasgow-subgraph-solver/glasgow_subgraph_solver --no-supplementals --format lad --induced --enumerate P.lad T.lad > tmp.txt
if [ "$?" -eq "124" ]; then
    echo TIMEOUT
else
    cat tmp.txt | grep runtime | awk '{print $3}'
fi

#~/OthersCode/solnon-benchmarks/vf3lib/bin/vf3 -r 0 -u P.grf T.grf

timeout $((TIMELIMIT + 2)) ~/OthersCode/solnon-benchmarks/RI/ri36 ind gfu T.gfu P.gfu > tmp.txt
if [ "$?" -eq "124" ]; then
    echo TIMEOUT
else
    cat tmp.txt | grep 'total time' | awk '{print int($3 * 1000)}'
fi

rm -f tmp.txt
echo

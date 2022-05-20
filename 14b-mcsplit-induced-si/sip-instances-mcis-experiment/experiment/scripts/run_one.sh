#!/bin/bash

set -euo pipefail

ulimit -s 10485760

instance=$1
file_a=$2
file_b=$3
timelimit=$4

mkdir -p instances
mkdir -p program-output

pf=../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/instances/$file_a
tf=../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/instances/$file_b
out=program-output/$instance

../programs/mcsplit-mcis-sparse-code/mcsplit-mcis-sparse --lad A $pf $tf --timeout $timelimit > $out.mcsplit-mcis-sparse.out
../programs/ijcai2017-kdown-code/solve_subgraph_isomorphism sequentialix $pf $tf --induced --timeout $timelimit > $out.kdown2017.out 2>/dev/null
../programs/cpaior2019-kdown-code/solve_subgraph_isomorphism sequentialix $pf $tf --induced --timeout $timelimit > $out.kdown2019.out 2>/dev/null
../programs/cpaior2019-kdown-code/solve_subgraph_isomorphism sequentialix $pf $tf --induced --restarts --timeout $timelimit > $out.kdown2019-restarts.out 2>/dev/null

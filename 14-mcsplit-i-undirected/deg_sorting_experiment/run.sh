#!/bin/bash

set -euo pipefail

iters=1
timeout=1
run_num=$1

mkdir -p instances
mkdir -p results

for i in $(seq 1 ${iters}); do
    for p in $(seq -w 5 10 95); do
        for q in $(seq -w 5 10 95); do
            echo $p $q $(
                for n in $(seq 3 100); do
                    python ../modified-mcsplit-experiment/random_graph.py $n 0.$p > g.grf
                    python ../modified-mcsplit-experiment/random_graph.py $n 0.$q > h.grf
                    echo $n > /dev/stderr
                    ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 1 -H 1 min_max g.grf h.grf > instances/instance${run_num}.txt
                    ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 1 -H 2 min_max g.grf h.grf >> instances/instance${run_num}.txt
                    ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 2 -H 1 min_max g.grf h.grf >> instances/instance${run_num}.txt
                    ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 2 -H 2 min_max g.grf h.grf >> instances/instance${run_num}.txt
                    #cat instances/instance${run_num}.txt > /dev/stderr
                    if grep -q '^TIMEOUT' instances/instance${run_num}.txt; then
                        break
                    fi
                    cp instances/instance${run_num}.txt tmp_prev.txt
#                    if [ "$(cat instances/instance${run_num}.txt | datamash sum 1)" -gt "2000" ]; then
#                        break
#                    fi
                done
                cat tmp_prev.txt | grep CPU | awk '{print $4}'
            )
        done
    done
done | tee results/run${run_num}.txt

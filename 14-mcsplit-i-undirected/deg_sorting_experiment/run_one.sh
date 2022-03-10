#!/bin/bash

set -euo pipefail

timeout=5
run_num=$1

for p in $(seq -w 5 10 95); do
    for q in $(seq -w 5 10 95); do
        echo $p $q $(
            for n in $(seq 3 100); do
                python ../modified-mcsplit-experiment/random_graph.py $n 0.$p > instances/g${run_num}.grf
                python ../modified-mcsplit-experiment/random_graph.py $n 0.$q > instances/h${run_num}.grf
                echo $n > /dev/stderr
                ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 1 -H 1 min_max instances/g${run_num}.grf instances/h${run_num}.grf > instances/run_result${run_num}.txt
                ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 1 -H 2 min_max instances/g${run_num}.grf instances/h${run_num}.grf >> instances/run_result${run_num}.txt
                ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 2 -H 1 min_max instances/g${run_num}.grf instances/h${run_num}.grf >> instances/run_result${run_num}.txt
                ../modified-mcsplit-experiment/james-cpp-modified/mcsp -t $timeout -d -G 2 -H 2 min_max instances/g${run_num}.grf instances/h${run_num}.grf >> instances/run_result${run_num}.txt
                #cat instances/run_result${run_num}.txt > /dev/stderr
                if grep -q '^TIMEOUT' instances/run_result${run_num}.txt; then
                    break
                fi
                cp instances/run_result${run_num}.txt instances/run_results_prev${run_num}.txt
            done
            cat instances/run_results_prev${run_num}.txt | grep CPU | awk '{print $4}'
        )
    done
done | tee results/run${run_num}.txt

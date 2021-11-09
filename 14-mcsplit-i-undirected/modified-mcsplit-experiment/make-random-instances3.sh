#!/bin/bash

set -euo pipefail

mkdir -p random-instances3

for i in $(seq 1 3); do
    for p in $(seq 10 40); do
        python random_graph.py $p 0.3 > random-instances3/r$p-$i.grf
    done
done

rm -f randomplaininstances3.txt

for i in $(seq 1 3); do
    for j in $(seq 1 3); do
        for p in $(seq 10 40); do
            for q in $(seq 10 40); do
                echo r$i-$j-$p-$q modified-mcsplit-experiment/random-instances3/r$p-$i.grf modified-mcsplit-experiment/random-instances3/r$q-$j.grf 0 >> randomplaininstances3.txt
            done
        done
    done
done

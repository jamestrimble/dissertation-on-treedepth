#!/bin/bash

set -euo pipefail

rm -rf random-instances
mkdir random-instances

for i in $(seq 1 3); do
    for p in $(seq 1 9); do
        python scripts-to-make-instances/random_graph.py 24 0.$p > random-instances/r$p-$i.grf
    done
done

rm -f instance-lists/randomplaininstances.txt

for i in $(seq 1 3); do
    for j in $(seq 1 3); do
        for p in $(seq 1 9); do
            for q in $(seq 1 9); do
                echo r$i-$j-$p-$q modified-mcsplit-experiment/random-instances/r$p-$i.grf modified-mcsplit-experiment/random-instances/r$q-$j.grf 0 >> instance-lists/randomplaininstances.txt
            done
        done
    done
done

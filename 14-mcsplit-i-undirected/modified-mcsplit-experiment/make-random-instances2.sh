#!/bin/bash

set -euo pipefail

mkdir -p random-instances2

for p in $(seq -w 1 99); do
    python random_graph.py 24 0.$p > random-instances2/r$p.grf
done

rm -f randomplaininstances2.txt

for p in $(seq -w 1 99); do
    for q in $(seq -w 1 99); do
        echo r-$p-$q modified-mcsplit-experiment/random-instances2/r$p.grf modified-mcsplit-experiment/random-instances2/r$q.grf 0 >> randomplaininstances2.txt
    done
done

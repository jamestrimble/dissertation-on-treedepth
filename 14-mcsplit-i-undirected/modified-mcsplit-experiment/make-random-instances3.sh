#!/bin/bash

set -euo pipefail

mkdir -p random-instances2

rm -f randomplaininstances2.txt

for i in $(seq 1 1000); do
    echo $i
    python random_graph.py 10-40 0.3 > random-instances2/r${i}A.grf
    python random_graph.py 10-40 0.3 > random-instances2/r${i}B.grf
    echo r-$i modified-mcsplit-experiment/random-instances2/r${i}A.grf modified-mcsplit-experiment/random-instances2/r${i}B.grf 0 >> randomplaininstances2.txt
done

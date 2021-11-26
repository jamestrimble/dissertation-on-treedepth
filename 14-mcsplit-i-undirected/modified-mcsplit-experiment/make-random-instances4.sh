#!/bin/bash

set -euo pipefail

mkdir -p random-instances4

rm -f randomplaininstances4.txt

for i in $(seq 1 1000); do
    echo $i
    python random_graph.py 10-50 0-1 > random-instances4/r${i}A.grf
    python random_graph.py 10-50 0-1 > random-instances4/r${i}B.grf
    echo r-$i modified-mcsplit-experiment/random-instances4/r${i}A.grf modified-mcsplit-experiment/random-instances4/r${i}B.grf 0 >> randomplaininstances4.txt
done

#!/bin/bash

set -euo pipefail

mkdir -p random-instances3

rm -f instance-lists/randomplaininstances3.txt

for i in $(seq 1 1000); do
    echo $i
    python scripts-to-make-instances/random_graph.py 10-50 0.3 > random-instances3/r${i}A.grf
    python scripts-to-make-instances/random_graph.py 10-50 0.3 > random-instances3/r${i}B.grf
    echo r-$i modified-mcsplit-experiment/random-instances3/r${i}A.grf modified-mcsplit-experiment/random-instances3/r${i}B.grf 0 >> instance-lists/randomplaininstances3.txt
done

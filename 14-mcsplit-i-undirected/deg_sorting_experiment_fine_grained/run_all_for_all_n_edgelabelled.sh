#!/bin/bash

set -euo pipefail

for n in $(seq 6 2 10); do
    echo Running n=$n
    ./run_all_edgelabelled.sh $n
    python3 summarise.py $n edgelabelled > summary-edgelabelled$n.txt
done

#!/bin/bash

set -euo pipefail

for n in $(seq 6 2 10); do
    echo Running n=$n
    ./run_all_directed.sh $n
    python3 summarise.py $n --directed > summary-directed$n.txt
done

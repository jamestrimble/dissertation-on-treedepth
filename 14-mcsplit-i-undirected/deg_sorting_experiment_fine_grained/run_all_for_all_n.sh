#!/bin/bash

set -euo pipefail

for n in $(seq 6 2 12); do
    echo Running n=$n
    ./run_all.sh $n
    python3 summarise.py $n > summary$n.txt
done

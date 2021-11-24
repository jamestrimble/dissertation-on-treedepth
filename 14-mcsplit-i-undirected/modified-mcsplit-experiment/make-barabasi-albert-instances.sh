#!/bin/bash

set -euo pipefail

m=5
NUM_INST=1000

mkdir -p barabasi-albert-instances

rm -f barabasialbertinstances.txt

python3 make-barabasi-albert-instances.py $m ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/barabasi-albert-instances/r${i}A.grf modified-mcsplit-experiment/barabasi-albert-instances/r${i}B.grf 0 >> barabasialbertinstances.txt
done

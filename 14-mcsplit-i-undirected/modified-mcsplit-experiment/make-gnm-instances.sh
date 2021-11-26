#!/bin/bash

set -euo pipefail

NUM_INST=1000

mkdir -p gnm-instances

rm -f gnminstances.txt

python3 make-gnm-instances.py ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/gnm-instances/r${i}A.grf modified-mcsplit-experiment/gnm-instances/r${i}B.grf 0 >> gnminstances.txt
done

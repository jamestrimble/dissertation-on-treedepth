#!/bin/bash

set -euo pipefail

NUM_INST=1000

mkdir -p ba-gnp-instances

rm -f ba-gnpinstances.txt

python3 make-ba-gnp-instances.py ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/ba-gnp-instances/r${i}A.grf modified-mcsplit-experiment/ba-gnp-instances/r${i}B.grf 0 >> ba-gnpinstances.txt
done

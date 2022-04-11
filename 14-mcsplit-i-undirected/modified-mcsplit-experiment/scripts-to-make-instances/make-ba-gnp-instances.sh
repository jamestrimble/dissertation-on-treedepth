#!/bin/bash

set -euo pipefail

NUM_INST=1000

mkdir -p ba-gnp-instances

rm -f instance-lists/ba-gnpinstances.txt

python3 scripts-to-make-instances/make-ba-gnp-instances.py ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/ba-gnp-instances/r${i}A.grf modified-mcsplit-experiment/ba-gnp-instances/r${i}B.grf 0 >> instance-lists/ba-gnpinstances.txt
done

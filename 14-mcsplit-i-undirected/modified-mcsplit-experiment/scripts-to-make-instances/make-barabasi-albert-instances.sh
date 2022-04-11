#!/bin/bash

set -euo pipefail

NUM_INST=1000

mkdir -p barabasi-albert-instances

rm -f instance-lists/barabasialbertinstances.txt

python3 scripts-to-make-instances/make-barabasi-albert-instances.py ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/barabasi-albert-instances/r${i}A.grf modified-mcsplit-experiment/barabasi-albert-instances/r${i}B.grf 0 >> instance-lists/barabasialbertinstances.txt
done

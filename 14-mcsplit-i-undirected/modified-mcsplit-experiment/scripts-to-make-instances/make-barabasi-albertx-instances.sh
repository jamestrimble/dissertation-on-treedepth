#!/bin/bash

set -euo pipefail

NUM_INST=1000

mkdir -p barabasi-albertx-instances

rm -f instance-lists/barabasialbertxinstances.txt

python3 scripts-to-make-instances/make-barabasi-albertx-instances.py ${NUM_INST}

for i in $(seq 1 ${NUM_INST}); do
    echo r-$i modified-mcsplit-experiment/barabasi-albertx-instances/r${i}A.grf modified-mcsplit-experiment/barabasi-albertx-instances/r${i}B.grf 0 >> instance-lists/barabasialbertxinstances.txt
done

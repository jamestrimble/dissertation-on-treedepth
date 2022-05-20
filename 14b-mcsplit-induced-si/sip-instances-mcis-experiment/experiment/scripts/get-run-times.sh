#!/bin/bash

set -euo pipefail

mkdir -p results

echo instance mcsplit-mcis-sparse kdown2017 kdown2019 kdown2019-restarts
cat ../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read instance rest; do
    echo $(
        echo $instance
        cat program-output/$instance.mcsplit-mcis-sparse.out | grep Time | awk '{print $3}'
        cat program-output/$instance.kdown2017.out | tac | awk 'NR==2 {print $1}'
        cat program-output/$instance.kdown2019.out | tac | awk 'NR==2 {print $1}'
        cat program-output/$instance.kdown2019-restarts.out | tac | awk 'NR==2 {print $1}'
    )
done

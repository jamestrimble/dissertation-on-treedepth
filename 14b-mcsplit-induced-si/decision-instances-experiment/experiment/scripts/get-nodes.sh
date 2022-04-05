#!/bin/bash

set -euo pipefail

mkdir -p results

echo instance mcsplit-si mcsplit-si-dom mcsplit-si-adjmat mcsplit-si-adjmat-dom
cat ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read instance rest; do
    echo $(
        echo $instance
        cat program-output/$instance.mcsplit-si.out | grep Time | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-dom.out | grep Time | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-adjmat.out | grep Time | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-adjmat-dom.out | grep Time | awk -f scripts/get-mcsplit-nodes.awk
    )
done

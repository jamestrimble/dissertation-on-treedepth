#!/bin/bash

set -euo pipefail

mkdir -p results

echo instance mcsplit-si-ll mcsplit-si-dom mcsplit-si-dom-D1 mcsplit-si-dom-D2 mcsplit-si-static mcsplit-si-adjmat-dom
cat ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read instance rest; do
    echo $(
        echo $instance
        cat program-output/$instance.mcsplit-si-ll.out | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-dom.out | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-dom-D1.out | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-dom-D2.out | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-static.out | awk -f scripts/get-mcsplit-nodes.awk
        cat program-output/$instance.mcsplit-si-adjmat-dom.out | awk -f scripts/get-mcsplit-nodes.awk
    )
done

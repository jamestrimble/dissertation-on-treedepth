#!/bin/bash

mkdir -p lad-graphs

ls lad-graphs-before-random-permutation/*.lad | while read f; do
    b=$(basename $f)
    echo $b
    python3 scripts/randomly-permute-lad-vertices.py < $f > lad-graphs/$b
done

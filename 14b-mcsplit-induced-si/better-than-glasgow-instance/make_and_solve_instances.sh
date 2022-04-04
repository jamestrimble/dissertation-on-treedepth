#!/bin/bash

set -euo pipefail

for i in $(seq 3 20) 100 1000 10000 100000 1000000; do
    echo $i $((i+3))
    ./make_and_solve_instance.sh $i $((i+3))
done | tee results.txt

#!/bin/bash

set -euo pipefail

for i in $(seq 1 10) 100 1000 10000; do
    echo $i
    ./make_and_solve_instance.sh $i
done | tee results.txt

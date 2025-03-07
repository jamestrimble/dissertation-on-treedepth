#!/bin/bash

set -euo pipefail

n=$1

seq 1 32 | parallel ./run_one.sh $n

cat results/run$n-*.txt > results/run$n.txt

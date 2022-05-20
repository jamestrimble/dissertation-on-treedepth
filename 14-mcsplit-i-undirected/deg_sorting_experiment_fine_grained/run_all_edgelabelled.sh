#!/bin/bash

set -euo pipefail

n=$1

rm -rf instances
rm -rf results
mkdir instances
mkdir results

seq 1 64 | parallel ./run_one_edgelabelled.sh $n

cat results/run*.txt > results-edgelabelled$n.txt

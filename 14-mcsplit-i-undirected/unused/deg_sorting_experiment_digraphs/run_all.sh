#!/bin/bash

set -euo pipefail

rm -rf instances
rm -rf results
mkdir instances
mkdir results

seq 1 12 | parallel ./run_one.sh

cat results/run*.txt > results.txt

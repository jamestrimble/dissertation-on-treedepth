#!/bin/bash

set -euo pipefail

rm -rf results
mkdir results
rm -rf summary
mkdir summary

for n in 8 12 16; do
    echo Running n=$n
    time ./run_all.sh $n
    python3 summarise.py $n > summary/summary${n}sip.txt
done

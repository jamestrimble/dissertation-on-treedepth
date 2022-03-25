#!/bin/bash

set -euo pipefail

timelimit=5

rm -f intermediate/commands.txt
rm -f program-output/*

cat intermediate/instances.txt | while read i count labels p nt np; do
    echo ./scripts/run_one.sh $i $labels $p $nt $np $timelimit >> intermediate/commands.txt
done

parallel --bar -P2 :::: intermediate/commands.txt

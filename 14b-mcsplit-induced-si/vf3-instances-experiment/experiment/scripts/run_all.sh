#!/bin/bash

set -euo pipefail

timelimit=1000

rm -f intermediate/commands.txt
rm -f program-output/*

cat intermediate/instances.txt | while read i count labels p nt np; do
    echo ./scripts/run_one.sh $i $labels $p $nt $np $timelimit >> intermediate/commands.txt
done

parallel --bar -P32 :::: intermediate/commands.txt

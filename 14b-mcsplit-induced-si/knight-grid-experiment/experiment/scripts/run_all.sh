#!/bin/bash

set -euo pipefail

timelimit=10000

mkdir -p intermediate
rm -f intermediate/commands.txt

cat instances.txt | while read inst file_a file_b _; do
    echo ./scripts/run_one.sh $inst $file_a $file_b $timelimit >> intermediate/commands.txt
done

parallel --bar -P32 :::: intermediate/commands.txt

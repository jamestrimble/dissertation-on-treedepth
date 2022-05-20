#!/bin/bash

set -euo pipefail

timelimit=10

#rm -rf program-output
#mkdir program-output

mkdir -p intermediate
rm -f intermediate/commands.txt

cat ../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read inst file_a file_b _; do
    echo ./scripts/run_one.sh $inst $file_a $file_b $timelimit >> intermediate/commands.txt
done

parallel --bar -P32 :::: intermediate/commands.txt

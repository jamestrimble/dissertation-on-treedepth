#!/bin/bash

set -euo pipefail

INSTANCETYPE=$1

rm -f results/which-swap.$INSTANCETYPE.txt

cat $INSTANCETYPE.sample.txt | while read a b c d; do
    ./james-cpp-modified/mcsp -w min_max ../$b ../$c >> results/which-swap.$INSTANCETYPE.txt
done


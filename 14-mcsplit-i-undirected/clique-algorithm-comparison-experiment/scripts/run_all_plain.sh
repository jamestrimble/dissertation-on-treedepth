#!/bin/bash

rm -rf association-graphs-plain/
rm -rf program-output-plain/

mkdir -p association-graphs-plain
mkdir -p program-output-plain

rm -f commands.txt

cat mcsplaininstances.txt | while read i p t; do
    echo './scripts/run_one_plain.sh' $i $p $t >> commands.txt
done

parallel -P32 --bar < commands.txt

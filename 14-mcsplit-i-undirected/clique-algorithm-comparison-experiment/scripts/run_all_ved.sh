#!/bin/bash

rm -rf association-graphs-ved/
rm -rf program-output-ved/

mkdir -p association-graphs-ved
mkdir -p program-output-ved

rm -f commands_ved.txt

cat mcs33vedinstances.txt | while read i p t; do
    echo './scripts/run_one_ved.sh' $i $p $t >> commands_ved.txt
done

parallel -P4 --bar < commands_ved.txt

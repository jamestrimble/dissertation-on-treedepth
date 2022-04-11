#!/bin/bash

set -euo pipefail

INSTANCETYPE=$1

# mkdir -p partial-results
# 
# PROGRAMS=$(cut -d' ' -f1 program-lists/programs.$INSTANCETYPE.txt)
# PROGRAMS_COMMA_SEP=$(echo $PROGRAMS | sed 's/ /,/g')
# PARTIAL_FILES=$(echo $PROGRAMS | tr ' ' '\n' | sed 's/^/partial-results\//' | sed 's/$/.txt/')
# 
# echo $PROGRAMS
# echo $PARTIAL_FILES
# 
# for p in $PROGRAMS; do
#     echo $p
#     cat program-output/$INSTANCETYPE/*.$p.out | grep CPU | awk '{print $4}' > partial-results/$p.txt
# done
# paste $PARTIAL_FILES | head
# 
# cat program-output/$INSTANCETYPE/*.mcsplit.out | grep CPU | awk '{print $4}' > a.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+f.out | grep CPU | awk '{print $4}' > b.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+fmm.out | grep CPU | awk '{print $4}' > c.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+bigf.out | grep CPU | awk '{print $4}' > d.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+r.out | grep CPU | awk '{print $4}' > e.txt
# cat program-output/$INSTANCETYPE/*.mcsplit-h.out | grep CPU | awk '{print $4}' > f.txt
# echo 'mcsplit mcsplitf mcsplitfmm mcsplitbigf mcsplitr mcsplitminush' > results/runtimes.$INSTANCETYPE.txt
# paste a.txt b.txt c.txt d.txt e.txt f.txt | awk '{print $1, $2, $3, $4, $5, $6}' >> results/runtimes.$INSTANCETYPE.txt
# 
# cat program-output/$INSTANCETYPE/*.mcsplit.out | grep Nodes | awk '{print $2}' > a.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+f.out | grep Nodes | awk '{print $2}' > b.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+bigf.out | grep Nodes | awk '{print $2}' > c.txt
# cat program-output/$INSTANCETYPE/*.mcsplit+r.out | grep Nodes | awk '{print $2}' > d.txt
# cat program-output/$INSTANCETYPE/*.mcsplit-h.out | grep Nodes | awk '{print $2}' > e.txt
# echo 'mcsplit mcsplitf mcsplitbigf mcsplitr mcsplitminush' > searchnodes.$INSTANCETYPE.txt
# paste a.txt b.txt c.txt d.txt e.txt | awk '{print $1, $2, $3, $4, $5}' >> searchnodes.$INSTANCETYPE.txt

PROGRAMS=$(cut -d' ' -f1 program-lists/programs.$INSTANCETYPE.txt)

echo $PROGRAMS > results/runtimes.$INSTANCETYPE.txt
cat $INSTANCETYPE.sample.txt | while read instance a b _; do
    echo $(
        for p in $PROGRAMS; do
            cat program-output/$INSTANCETYPE/$instance.$p.out | grep CPU | awk '{print $4}'
        done
    ) >> results/runtimes.$INSTANCETYPE.txt
done

echo $PROGRAMS > searchnodes.$INSTANCETYPE.txt
cat $INSTANCETYPE.sample.txt | while read instance a b _; do
    echo $(
        for p in $PROGRAMS; do
            cat program-output/$INSTANCETYPE/$instance.$p.out | grep NODES_OR_TIMEOUT | awk '{print $4}'
        done
    ) >> searchnodes.$INSTANCETYPE.txt
done

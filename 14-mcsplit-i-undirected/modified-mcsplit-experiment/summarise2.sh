#!/bin/bash

set -euo pipefail

INSTANCETYPE=$1

mkdir -p partial-results

PROGRAMS=$(cut -d' ' -f1 program-lists/programs.$INSTANCETYPE.txt)
PROGRAMS_COMMA_SEP=$(echo $PROGRAMS | sed 's/ /,/g')
PARTIAL_FILES=$(echo $PROGRAMS | tr ' ' '\n' | sed 's/^/partial-results\//' | sed 's/$/.txt/')

cat config/vars.txt | while read var s; do   # e.g. s=runtimes, var=CPU
    echo instance n1 density1 n2 density2 $PROGRAMS > results/$var.$INSTANCETYPE.txt
    cat $INSTANCETYPE.sample.txt | while read instance a b _; do
        echo $(
            echo $instance
            awk -f get-density.awk ../$a
            awk -f get-density.awk ../$b
            for p in $PROGRAMS; do
                cat program-output/$INSTANCETYPE/$instance.$p.out | grep $s | awk '{print $4}'
            done
        ) >> results/$var.$INSTANCETYPE.txt
    done
done

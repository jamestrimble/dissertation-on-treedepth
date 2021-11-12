#!/bin/bash

set -euo pipefail

INSTANCETYPE=$1

mkdir -p partial-results

PROGRAMS=$(cut -d' ' -f1 programs.$INSTANCETYPE.txt)
PROGRAMS_COMMA_SEP=$(echo $PROGRAMS | sed 's/ /,/g')
PARTIAL_FILES=$(echo $PROGRAMS | tr ' ' '\n' | sed 's/^/partial-results\//' | sed 's/$/.txt/')

TIME_COLUMNS="last_unsat_time sat_time total_subproblem_time total_subproblem_time_minus_last_unsat"


echo instance $TIME_COLUMNS run_time > runtimes.$INSTANCETYPE.txt
cat $INSTANCETYPE.sample.txt | while read instance a b _; do
    echo $(
        echo $instance
        for p in $PROGRAMS; do
            for c in $TIME_COLUMNS; do
                cat program-output/$INSTANCETYPE/$instance.$p.out | grep ^$c: | awk '{print $2}'
            done
            cat program-output/$INSTANCETYPE/$instance.$p.out | grep CPU | awk '{print $4}'
        done
    ) >> runtimes.$INSTANCETYPE.txt
done

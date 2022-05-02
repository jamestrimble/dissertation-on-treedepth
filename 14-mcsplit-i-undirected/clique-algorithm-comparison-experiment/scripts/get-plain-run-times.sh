#!/bin/bash

set -euo pipefail

mkdir -p results

show_time_or_timeout() {
    FILENAME=$1
    if grep -q 'TIMEOUT' $FILENAME; then
        echo "1000000"
    else
        cat $FILENAME | grep '^TIME' | awk '{print $2}' | awk -f 'scripts/tidy_timeout.awk'
    fi
}

show_cp2016_time_or_timeout() {
    FILENAME=$1
    if grep -q 'aborted' $FILENAME; then
        echo "1000000"
    else
        cat $FILENAME | tail -n1 | cut -d' ' -f1 | awk -f 'scripts/tidy_timeout.awk'
    fi
}

echo instance cp2016 incmc2 incmc2o1 incmc2o2
cat mcsplaininstances.txt | while read instance rest; do
    echo $(
        echo $instance
        show_cp2016_time_or_timeout program-output-plain/$instance.cp2016.txt
        show_time_or_timeout program-output-plain/$instance.incmc2.txt
        show_time_or_timeout program-output-plain/$instance.incmc2o1.txt
        show_time_or_timeout program-output-plain/$instance.incmc2o2.txt
    )
done

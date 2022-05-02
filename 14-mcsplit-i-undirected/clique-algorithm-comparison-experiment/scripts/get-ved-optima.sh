#!/bin/bash

set -euo pipefail

mkdir -p results

show_optimum_or_timeout() {
    FILENAME=$1
    if grep -q 'TIMEOUT' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | grep 'Max_CLQ' | awk '{print $5}'
    fi
}

show_cp2016_optimum_or_timeout() {
    FILENAME=$1
    if grep -q 'aborted' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | grep '^true' | cut -d' ' -f3
    fi
}

echo instance cp2016 incmc2 incmc2o1 incmc2o2
cat mcs33vedinstances.txt | while read instance rest; do
    echo $(
        echo $instance
        show_cp2016_optimum_or_timeout program-output-ved/$instance.cp2016.txt
        show_optimum_or_timeout program-output-ved/$instance.incmc2.txt
        show_optimum_or_timeout program-output-ved/$instance.incmc2o1.txt
        show_optimum_or_timeout program-output-ved/$instance.incmc2o2.txt
    )
done

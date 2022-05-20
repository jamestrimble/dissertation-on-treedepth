#!/bin/bash

set -euo pipefail

mkdir -p results

show_mcsp_optimum() {
    FILENAME=$1
    if grep -q 'TIMEOUT' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | awk '/Solution size/ {print $3}'
    fi
}

show_kdown_optimum() {
    FILENAME=$1
    if grep -q 'aborted' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | awk '/SIZE=/ {print $2}' | sed 's/.*SIZE=//' | cut -d' ' -f1
    fi
}

echo instance mcsplit-mcis-sparse kdown2017 kdown2019 kdown2019-restarts
cat ../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read instance rest; do
    echo $(
        echo $instance
        show_mcsp_optimum program-output/$instance.mcsplit-mcis-sparse.out
        show_kdown_optimum program-output/$instance.kdown2017.out
        show_kdown_optimum program-output/$instance.kdown2019.out
        show_kdown_optimum program-output/$instance.kdown2019-restarts.out
    )
done

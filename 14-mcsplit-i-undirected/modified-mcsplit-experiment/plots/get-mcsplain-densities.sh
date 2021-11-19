#!/bin/bash

echo instance densityA densityB
cat ../../plots-based-on-ijcai-paper/experiments/mcsplaininstances.txt | while read a b c d; do
    echo \
        $a \
        $(./mcsplain-density-calculator/density-calculator ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$b) \
        $(./mcsplain-density-calculator/density-calculator ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$c)
done | tee densities.mcsplaininstances.txt

#!/bin/bash

echo instance densityA densityB > densities.mcsplaininstances.txt
cat ../../plots-based-on-ijcai-paper/experiments/mcsplaininstances.txt | while read a b c d; do
    echo \
        $a \
        $(./mcsplain-density-calculator/density-calculator ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$b) \
        $(./mcsplain-density-calculator/density-calculator ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$c)
done | tee -a densities.mcsplaininstances.txt

echo instance nA densityA nB densityB > densities.mixandmatchinstances.txt
cat ../mcsplainmixandmatchinstances.sample.txt | while read a b c d; do
    echo \
        $a \
        $(./mcsplain-density-calculator/density-calculator -n ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$b) \
        $(./mcsplain-density-calculator/density-calculator -n ~/OthersCode/cp2016-max-common-connected-subgraph-paper/datasets/$c)
done | tee -a densities.mixandmatchinstances.txt

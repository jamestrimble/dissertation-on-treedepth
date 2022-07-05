#!/bin/bash

paste -d' ' fatanode-results/runtimes.txt <(echo family; cut -d' ' -f4 ../../decision-instances-experiment/cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt) \
    > fatanode-results/runtimes-with-families.txt

# Make files of results by family
mkdir -p fatanode-results/by-family
awk 'NR==1 || $6==1' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-Scalefree.txt
awk 'NR==1 || $6==2 || $6==11' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-LV.txt
awk 'NR==1 || $6==3 || $6==4' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-BVG.txt
awk 'NR==1 || $6==5 || $6==6' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-M4D.txt
awk 'NR==1 || $6==7' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-Rand.txt
awk 'NR==1 || $6==9' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-PR.txt
awk 'NR==1 || $6==12' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-Phase.txt
awk 'NR==1 || $6==13' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-Meshes.txt
awk 'NR==1 || $6==14' fatanode-results/runtimes-with-families.txt > fatanode-results/by-family/runtimes-Images.txt

head -n1 fatanode-results/runtimes-with-families.txt > fatanode-results/runtimes-with-family-scaling.txt
for f in fatanode-results/by-family/runtimes-*.txt; do
    numlines=$(wc -l $f | cut -d' ' -f1)
    awk -v numlines="$numlines" 'NR>1 {$6 = 100 / (numlines - 1); print}' $f >> fatanode-results/runtimes-with-family-scaling.txt
done

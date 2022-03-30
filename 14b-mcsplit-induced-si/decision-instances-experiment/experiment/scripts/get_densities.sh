#!/bin/bash

set -euo pipefail

mkdir -p intermediate

echo instance pattern_n pattern_d target_n target_d > intermediate/densities.txt

cat ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read inst file_a file_b _; do
echo $inst \
    $(../cpp-utils/get-density/get_lad_density < ../cpaior2019-sbs-for-subgraphs-paper/instances/$file_a) \
    $(../cpp-utils/get-density/get_lad_density < ../cpaior2019-sbs-for-subgraphs-paper/instances/$file_b)
done | tee -a intermediate/densities.txt | nl

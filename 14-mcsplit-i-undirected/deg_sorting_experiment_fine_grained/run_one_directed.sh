#!/bin/bash

set -euo pipefail

n=$1
seed=$2

./mcsp_density_experiment -i min_max $n $seed > results/run${seed}.txt

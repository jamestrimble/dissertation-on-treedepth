#!/bin/bash

set -euo pipefail

n=$1
seed=$2

./mcsp_density_experiment -a min_max $n $seed > results/run${seed}.txt

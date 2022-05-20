#!/bin/bash

set -euo pipefail

n=$1
seed=$2

./mcsp_sparse_density_experiment --node-limit 100000000 A $n 80 $seed > results/run${n}-${seed}.txt

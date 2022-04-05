#!/bin/bash

set -euo pipefail

n=$1
seed=$2

./mcsp_sparse_density_experiment --node-limit 1000000 A $n 100 $seed > results/run${n}-${seed}.txt

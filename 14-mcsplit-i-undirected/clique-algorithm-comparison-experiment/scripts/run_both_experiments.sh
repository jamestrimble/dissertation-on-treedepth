#!/bin/bash

mkdir -p results

./scripts/run_all_plain.sh
./scripts/get-plain-run-times.sh > results/plain-runtimes.txt
./scripts/get-plain-optimal.sh > results/plain-optima.txt

./scripts/run_all_ved.sh
./scripts/get-ved-run-times.sh > results/ved-runtimes.txt
./scripts/get-ved-optimal.sh > results/ved-optima.txt

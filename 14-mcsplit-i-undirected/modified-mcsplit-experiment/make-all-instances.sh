#!/bin/bash

set -euo pipefail

rm -rf instance-lists

mkdir -p instance-lists

./scripts-to-make-instances/make-ba-gnp-instances.sh
./scripts-to-make-instances/make-barabasi-albert-instances.sh
./scripts-to-make-instances/make-barabasi-albertx-instances.sh
./scripts-to-make-instances/make-gnm-instances.sh
./scripts-to-make-instances/make-mix-and-match-instances.sh
./scripts-to-make-instances/make-random-instances2.sh
./scripts-to-make-instances/make-random-instances3.sh
./scripts-to-make-instances/make-random-instances4.sh
./scripts-to-make-instances/make-random-instances.sh

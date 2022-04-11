#!/bin/bash

set -euo pipefail

echo ./scripts-to-make-instances/make-ba-gnp-instances.sh
./scripts-to-make-instances/make-ba-gnp-instances.sh

echo ./scripts-to-make-instances/make-barabasi-albert-instances.sh
./scripts-to-make-instances/make-barabasi-albert-instances.sh

echo ./scripts-to-make-instances/make-gnm-instances.sh
./scripts-to-make-instances/make-gnm-instances.sh

echo ./scripts-to-make-instances/make-mix-and-match-instances.sh
./scripts-to-make-instances/make-mix-and-match-instances.sh

echo ./scripts-to-make-instances/make-random-instances2.sh
./scripts-to-make-instances/make-random-instances2.sh

echo ./scripts-to-make-instances/make-random-instances3.sh
./scripts-to-make-instances/make-random-instances3.sh

echo ./scripts-to-make-instances/make-random-instances4.sh
./scripts-to-make-instances/make-random-instances4.sh

#echo ./scripts-to-make-instances/make-random-instances.sh
#./scripts-to-make-instances/make-random-instances.sh

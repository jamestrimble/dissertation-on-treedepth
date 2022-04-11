#!/bin/bash

set -euo pipefail

TIMEOUT=100
NUM_INSTANCES=100

#INSTANCETYPE should be mcs33vedinstances or mcsplaininstances etc.
INSTANCETYPE=$1

./make-subset.sh $INSTANCETYPE $NUM_INSTANCES

rm -rf program-output/$INSTANCETYPE
mkdir -p program-output/$INSTANCETYPE

python3 make-commands.py $INSTANCETYPE $TIMEOUT > commands.txt

parallel -P32 --bar < commands.txt

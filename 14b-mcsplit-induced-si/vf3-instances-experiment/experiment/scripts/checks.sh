#!/bin/bash

set -euo pipefail

cat program-output/*.connected.out | sort | uniq -c

cat program-output/*.out | grep Failed | sort | uniq -c

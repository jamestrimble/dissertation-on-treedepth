#!/bin/bash

cat fatanode-results/runtimes.txt \
    | sed 's/TIMEOUT/10000000/g' \
    | sed 's/DISCONNECTED/10000000/g' \
    | awk 'NR==1 {print} NR>1 {print ($1,
                                 $2 > 10000000 ? 10000000 : $2,
                                 $3 > 10000000 ? 10000000 : $3,
                                 $4 > 10000000 ? 10000000 : $4,
                                 $5 > 10000000 ? 10000000 : $5,
                                 $6 > 10000000 ? 10000000 : $6,
                                 $7 > 10000000 ? 10000000 : $7,
                                 $8 > 10000000 ? 10000000 : $8,
                                 $9 > 10000000 ? 10000000 : $9,
                                 $10 > 10000000 ? 10000000 : $10,
                                 $11 > 10000000 ? 10000000 : $11,
                                 $12 > 10000000 ? 10000000 : $12,
                                 $13 > 10000000 ? 10000000 : $13)}' \
    > fatanode-results/runtimes-tidied.txt

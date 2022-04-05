#!/bin/bash

cat fatanode-results/runtimes.txt | sed 's/TIMEOUT/1000000/g' \
    | awk 'NR==1 {print} NR>1 {print ($1, $2, $3, $4, $5,
                                 $6 > 1000000 ? 1000000 : $6,
                                 $7 > 1000000 ? 1000000 : $7,
                                 $8 > 1000000 ? 1000000 : $8,
                                 $9 > 1000000 ? 1000000 : $9,
                                 $10 > 1000000 ? 1000000 : $10,
                                 $11 > 1000000 ? 1000000 : $11,
                                 $12 > 1000000 ? 1000000 : $12,
                                 $13 > 1000000 ? 1000000 : $13,
                                 $14 > 1000000 ? 1000000 : $14,
                                 $15 > 1000000 ? 1000000 : $15,
                                 $16 > 1000000 ? 1000000 : $16)}' \
    > fatanode-results/runtimes-tidied.txt
cat fatanode-results/runtimes-tidied.txt | datamash -g2,3,4 -H -W --output-delimiter ' ' mean 6-16 > fatanode-results/runtimes-summary.txt

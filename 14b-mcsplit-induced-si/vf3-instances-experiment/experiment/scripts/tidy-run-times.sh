#!/bin/bash

cat fatanode-results/runtimes.txt | sed 's/TIMEOUT/10000000/g' \
    | awk 'NR==1 {print} NR>1 {print ($1, $2, $3, $4, $5,
                                 $6 > 10000000 ? 10000000 : $6,
                                 $7 > 10000000 ? 10000000 : $7,
                                 $8 > 10000000 ? 10000000 : $8,
                                 $9 > 10000000 ? 10000000 : $9,
                                 $10 > 10000000 ? 10000000 : $10,
                                 $11 > 10000000 ? 10000000 : $11,
                                 $12 > 10000000 ? 10000000 : $12,
                                 $13 > 10000000 ? 10000000 : $13,
                                 $14 > 10000000 ? 10000000 : $14,
                                 $15 > 10000000 ? 10000000 : $15,
                                 $16 > 10000000 ? 10000000 : $16)}' \
    > fatanode-results/runtimes-tidied.txt
cat fatanode-results/runtimes-tidied.txt | datamash -g2,3,4 -H -W --output-delimiter ' ' mean 6-16 > fatanode-results/runtimes-summary.txt

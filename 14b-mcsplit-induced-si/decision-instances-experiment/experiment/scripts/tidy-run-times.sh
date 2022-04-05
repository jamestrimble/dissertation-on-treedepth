#!/bin/bash

cat fatanode-results/runtimes.txt \
    | sed 's/TIMEOUT/1000000/g' \
    | sed 's/DISCONNECTED/1000000/g' \
    | awk 'NR==1 {print} NR>1 {print ($1,
                                 $2 > 1000000 ? 1000000 : $2,
                                 $3 > 1000000 ? 1000000 : $3,
                                 $4 > 1000000 ? 1000000 : $4,
                                 $5 > 1000000 ? 1000000 : $5,
                                 $6 > 1000000 ? 1000000 : $6,
                                 $7 > 1000000 ? 1000000 : $7,
                                 $8 > 1000000 ? 1000000 : $8,
                                 $9 > 1000000 ? 1000000 : $9,
                                 $10 > 1000000 ? 1000000 : $10,
                                 $11 > 1000000 ? 1000000 : $11,
                                 $12 > 1000000 ? 1000000 : $12)}' \
    | awk 'NR==1 {print $0, "glasgow1sec-then-mcsplit", "mcsplit1sec-then-glasgow"} NR>1 {
                                     gm = $8 < 1000 ? $8 : $2 + 1000;
                                     if (gm > 1000000) gm = 1000000;
                                     mg = $2 < 1000 ? $2 : $8 + 1000;
                                     if (mg > 10000000) mg = 1000000;
                                     print ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,gm, mg)
                                    }' \
    > fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt

paste -d' ' fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt intermediate/densities.txt \
    > fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout-and-densities.txt

paste -d' ' fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout.txt <(cut -d' ' -f13 fatanode-results/satisfiability-with-summary.txt) \
    > fatanode-results/runtimes-with-disconnected-patterns-treated-as-timeout-and-satisfiabilities.txt

cat fatanode-results/runtimes.txt \
    | sed 's/TIMEOUT/1000000/g' \
    | grep -v 'DISCONNECTED' \
    | awk 'NR==1 {print} NR>1 {print ($1,
                                 $2 > 1000000 ? 1000000 : $2,
                                 $3 > 1000000 ? 1000000 : $3,
                                 $4 > 1000000 ? 1000000 : $4,
                                 $5 > 1000000 ? 1000000 : $5,
                                 $6 > 1000000 ? 1000000 : $6,
                                 $7 > 1000000 ? 1000000 : $7,
                                 $8 > 1000000 ? 1000000 : $8,
                                 $9 > 1000000 ? 1000000 : $9,
                                 $10 > 1000000 ? 1000000 : $10,
                                 $11 > 1000000 ? 1000000 : $11,
                                 $12 > 1000000 ? 1000000 : $12)}' \
    | awk 'NR==1 {print $0, "glasgow1sec-then-mcsplit", "mcsplit1sec-then-glasgow"} NR>1 {
                                     gm = $8 < 1000 ? $8 : $2 + 1000;
                                     if (gm > 1000000) gm = 1000000;
                                     mg = $2 < 1000 ? $2 : $8 + 1000;
                                     if (mg > 10000000) mg = 1000000;
                                     print ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,gm, mg)
                                    }' \
    > fatanode-results/runtimes-without-disconnected-patterns.txt

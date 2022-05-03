#!/bin/bash

cat fatanode-results/runtimes.txt \
    | sed 's/TIMEOUT/1000000/g' \
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
    | awk 'NR==1 {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12, "static-then-dom", "dom-then-static"} NR>1 {
                                     sd = $6 < 100 ? $6 : $3 + 100;
                                     if (sd > 1000000) sd = 1000000;
                                     ds = $3 < 100 ? $3 : $6 + 100;
                                     if (ds > 1000000) ds = 1000000;
                                     print ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,sd, ds)
                                    }' \
    > fatanode-results/runtimes-tidied.txt

paste -d' ' fatanode-results/runtimes-tidied.txt intermediate/densities.txt \
    > fatanode-results/runtimes-tidied-and-densities.txt

paste -d' ' fatanode-results/runtimes-tidied.txt <(cut -d' ' -f13 fatanode-results/satisfiability-with-summary.txt) \
    > fatanode-results/runtimes-tidied-and-satisfiabilities.txt

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
    | awk 'NR==1 {print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12, "static-then-dom", "dom-then-static"} NR>1 {
                                     sd = $6 < 100 ? $6 : $3 + 100;
                                     if (sd > 1000000) sd = 1000000;
                                     ds = $3 < 100 ? $3 : $6 + 100;
                                     if (ds > 1000000) ds = 1000000;
                                     print ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,sd, ds)
                                    }' \
    > fatanode-results/runtimes-tidied-without-disconnected-instances.txt

python3 scripts/make-winner-counts.py > fatanode-results/winner-counts.txt

awk 'NR<=14' fatanode-results/winner-counts.txt | python3 scripts/make-table.py > fatanode-results/winner-counts.tex
awk 'NR>=16' fatanode-results/winner-counts.txt | python3 scripts/make-table.py > fatanode-results/solved-counts.tex

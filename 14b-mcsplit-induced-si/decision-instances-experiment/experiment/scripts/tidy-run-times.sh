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

paste -d' ' fatanode-results/runtimes-tidied.txt <(echo family; cut -d' ' -f4 ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt) \
    > fatanode-results/runtimes-tidied-with-families.txt

paste -d' ' intermediate/densities.txt <(echo family; cut -d' ' -f4 ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt) \
    > fatanode-results/densities-with-families.txt

datamash -t' ' -H -g 6 --sort --round 3 min 2 max 2 mean 2 min 3 max 3 mean 3 min 4 max 4 mean 4 min 5 max 5 mean 5 \
    < fatanode-results/densities-with-families.txt > fatanode-results/densities-with-families-summary.txt

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

python3 scripts/make-presolve-crosstabulation.py > fatanode-results/presolve-crosstab.tex

# Make files of results by family
mkdir -p fatanode-results/by-family
awk 'NR==1 || $15==1' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-Scalefree.txt
awk 'NR==1 || $15==2 || $15==11' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-LV.txt
awk 'NR==1 || $15==3 || $15==4' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-BVG.txt
awk 'NR==1 || $15==5 || $15==6' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-M4D.txt
awk 'NR==1 || $15==7' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-Rand.txt
awk 'NR==1 || $15==9' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-PR.txt
awk 'NR==1 || $15==12' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-Phase.txt
awk 'NR==1 || $15==13' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-Meshes.txt
awk 'NR==1 || $15==14' fatanode-results/runtimes-tidied-with-families.txt | awk -f scripts/add-virtual-best-other-solver.awk > fatanode-results/by-family/runtimes-tidied-Images.txt

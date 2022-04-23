#!/bin/bash

rm -f results/*_times.txt
rm -rf program-output
rm -rf intermediate

mkdir -p program-output
mkdir -p graphs
mkdir -p intermediate
mkdir -p results

cat mcsplaininstances.txt while read a b c d; do
    echo $a >> intermediate/instance_names.txt
    echo ./run_one.sh ../../$b ../../$c $a >> intermediate/commands.txt
done

parallel -P32 --bar < intermediate/commands.txt

cat intermediate/instance_names.txt | while read a; do
    cat program-output/$a.mcsp0.txt >> results/mcsp0_times.txt
    cat program-output/$a.mcsp1.txt >> results/mcsp1_times.txt
    cat program-output/$a.mcsp2.txt >> results/mcsp2_times.txt
    cat program-output/$a.mcsp3.txt >> results/mcsp3_times.txt
    cat program-output/$a.csia.txt >> results/csia_times.txt
done

echo "instance mcsp0 mcsp1 mcsp2 mcsp3 csia" > results/runtimes.txt
paste -d' ' intermediate/instance_names.txt \
      <(cat results/mcsp0_times.txt | awk '/CPU/ {print $4}') \
      <(cat results/mcsp1_times.txt | awk '/CPU/ {print $4}') \
      <(cat results/mcsp2_times.txt | awk '/CPU/ {print $4}') \
      <(cat results/mcsp3_times.txt | awk '/CPU/ {print $4}') \
      <(cat results/csia_times.txt | awk '/time:/ {print $2}') \
      | tee -a results/runtimes.txt

echo

echo "instance mcsp0 mcsp1 mcsp2 mcsp3 csia" > results/counts.txt
paste -d' ' intermediate/instance_names.txt \
      <(cat results/mcsp0_times.txt | awk '/Count/ {print $2}') \
      <(cat results/mcsp1_times.txt | awk '/Count/ {print $2}') \
      <(cat results/mcsp2_times.txt | awk '/Count/ {print $2}') \
      <(cat results/mcsp3_times.txt | awk '/Count/ {print $2}') \
      <(cat results/csia_times.txt | awk '/nMatches:/ {print $2}') \
      | tee -a results/counts.txt

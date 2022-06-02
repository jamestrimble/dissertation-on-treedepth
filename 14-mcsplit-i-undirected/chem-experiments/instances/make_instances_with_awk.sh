#!/bin/bash

cat Franco_25.csv | awk 'NR > 1 {print $1, $2, $3}' | tr -d '"' | while read name smiles1 smiles2; do
  echo $name;
  obabel -:"$smiles1" -oct | awk -f using_awk/ct_to_dimacs.awk > instances/$name.pattern.grf
  obabel -:"$smiles2" -oct | awk -f using_awk/ct_to_dimacs.awk > instances/$name.target.grf
done

cat MNS-instances.txt | while read name smiles1 smiles2; do
  echo $name;
  obabel -:"$smiles1" -oct | awk -f using_awk/ct_to_dimacs.awk > instances/$name.pattern.grf
  obabel -:"$smiles2" -oct | awk -f using_awk/ct_to_dimacs.awk > instances/$name.target.grf
done

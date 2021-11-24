#!/bin/bash

cat nci_sample.smi | nl | while read num smiles; do
  echo $num
  obabel -:"$smiles" -oct | awk -f ../instances/using_awk/ct_to_dimacs.awk > instances/$num.grf
done

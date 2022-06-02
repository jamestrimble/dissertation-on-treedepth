#!/bin/bash

cat Franco_25.csv | awk 'NR > 1 {print $1, $2, $3}' | tr -d '"' | while read name smiles1 smiles2; do
  echo $name;
  java -cp "using_cdk:using_cdk/cdk-2.1.1.jar" FromSmiles $smiles1 > instances/$name.pattern.grf
  java -cp "using_cdk:using_cdk/cdk-2.1.1.jar" FromSmiles $smiles2 > instances/$name.target.grf
done

cat MNS-instances.txt | while read name smiles1 smiles2; do
  echo $name;
  java -cp "using_cdk:using_cdk/cdk-2.1.1.jar" FromSmiles $smiles1 > instances/$name.pattern.grf
  java -cp "using_cdk:using_cdk/cdk-2.1.1.jar" FromSmiles $smiles2 > instances/$name.target.grf
done

#!/bin/bash

echo S1 $(cat symmetric/Raymond_01.smi | tr '\n' ' ') > MNS-instances.txt
echo S2 $(cat symmetric/Raymond_02.smi | tr '\n' ' ') >> MNS-instances.txt
echo S3 $(cat symmetric/Ersmark_01.smi | tr '\n' ' ') >> MNS-instances.txt
echo S4 $(cat symmetric/Ersmark_02.smi | tr '\n' ' ') >> MNS-instances.txt
echo S5 $(cat symmetric/Bone_Babine.smi | tr '\n' ' ') >> MNS-instances.txt
echo S6 $(cat symmetric/Libby_01.smi | tr '\n' ' ') >> MNS-instances.txt

echo N1 $(cat other_mcs/norings_vs_CHEMBL243.smi | head -n2 | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt
echo N2 $(cat other_mcs/norings_vs_CHEMBL5373.smi | head -n2 | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt
echo N3 $(cat other_mcs/norings_vs_CHEMBL2094108.smi | head -n2 | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt

echo M1 $(tac other_mcs/non_planar_1.smi | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt
echo M2 $(tac other_mcs/non_planar_2.smi | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt
echo M3 $(cat other_mcs/graphene_ring_mapping.smi | cut -d' ' -f1 | tr '\n' ' ') >> MNS-instances.txt

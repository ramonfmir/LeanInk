#!/bin/bash

#TODO: Add "Algebra" 
packages=("AlgebraicTopology" "Analysis" "CategoryTheory" "Combinatorics" "Computability" "Control" "Data" "Dynamics" "FieldTheory" "Geometry" "GroupTheory" "InformationTheory" "LinearAlgebra" "Logic" "MeasureTheory" "ModelTheory" "NumberTheory" "Order" "Probability" "RepresentationTheory" "RingTheory" "SetTheory" "Topology")

for pkg in "${packages[@]}"
do
    mods=`find ./lake-packages/mathlib/Mathlib/$pkg -name "*.lean"`
    ./build/bin/leanInk a $mods  --lake ./lake-packages/mathlib/lakefile.lean --x-enable-type-info 
done

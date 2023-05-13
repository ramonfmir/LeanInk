#!/bin/bash

packages=("Algebra" "AlgebraicTopology" "Analysis" "CategoryTheory" "Combinatorics" "Computability" "Control" "Data" "Dynamics" "FieldTheory" "Geometry" "GroupTheory" "InformationTheory" "LinearAlgebra" "Logic" "MeasureTheory" "ModelTheory" "NumberTheory" "Order" "Probability" "RepresentationTheory" "RingTheory" "SetTheory" "Topology")

for pkg in "${packages[@]}"
do
    mods=`find ./lake-packages/mathlib/Mathlib/$pkg -name "*.lean"`
    for mod in $mods 
    do 
        modInk="${mod}.leanInk"
        if test -f "$modInk"; then
            echo "$modInk exists."
        else
            echo "$modInk does not exist."
            ./build/bin/leanInk a $mod --lake ./lake-packages/mathlib/lakefile.lean --x-enable-type-info 
        fi
    done
done

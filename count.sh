#!/bin/bash

data=`find ./lake-packages/mathlib/Mathlib -name "*.leanInk"`
count=0

for d in $data 
do
    items=`jq length $d`
    count=$((count+items))
done

echo $count

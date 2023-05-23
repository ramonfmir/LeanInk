#!/bin/bash

data=`find ./lake-packages/mathlib/Mathlib -name "*.leanInk"`
count_examples=0
count_premises=0

for d in $data 
do
    examples=`jq length $d`
    premises=`jq '.[] | .contents' $d | jq '.[]' | wc -l`
    count_examples=$((count_examples + examples))
    count_premises=$((count_premises + premises))
done

echo $count_examples
echo $count_premises

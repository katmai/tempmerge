#!/bin/bash -x
PR=$1
for i in $(seq 1 $PR);
do
git branch -d $i
done
rm -rf file*

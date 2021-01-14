#!/bin/bash
#for i in {1..5}
#do
#   echo "Welcome $i times"
#done

#END=5
#for i in $(seq 1 $END); do echo $i; done

REPO=$(gh repo view  |head -1 |cut -d : -f 2)
echo $REPO

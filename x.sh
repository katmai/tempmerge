#!/bin/bash -x
#for i in {1..5}
#do
#   echo "Welcome $i times"
#done

#END=5
#for i in $(seq 1 $END); do echo $i; done

#REPO=$(gh repo view  |head -1 |cut -d : -f 2)
#echo $REPO

echo "##### Merge selected pull requests #####"
git ls-remote origin 'pull/*/merge' | awk '{print $2}' |
while read ref; do
  pr=$(echo $ref | cut -d/ -f3)
  for item in "${array[@]}"; do
    if [[ "$pr" == "$item" ]]; then
      echo "##### Merging pr number $pr #####"
      git fetch origin pull/$pr/merge:pr$pr
      git merge pr"$pr" || (echo "!!!!! Merge failed for $pr !!!!!" && false)
      echo "##### PR number $pr merged #####"
      echo ""
    fi
  done
done

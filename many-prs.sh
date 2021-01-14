#!/bin/bash -x
PR=$1
for i in $(seq 1 $PR);
do
cat >> file$i.txt << EOF
this is pr $i
EOF
git add .
git checkout -b $i
gh pr create --title "The bug $i is fixed" --body "Everything works again"
done

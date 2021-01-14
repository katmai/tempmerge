#!/bin/bash -x
PR=$1
for i in $(seq 1 $PR);
do
NAME=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1)
cat >> file$NAME.txt << EOF
this is pr $i
EOF
git checkout -b $i
git add .
git commit -m "bug $i fix commit"
gh pr create --title "The bug $i is fixed" --body "Everything works again"
git checkout main
done

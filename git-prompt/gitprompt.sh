#!/bin/bash
if git status 2>&1| grep -q "^# On branch" 
then
  BRANCH=`git branch | grep  ^*|awk '{print $2}'`
  DIRTY=`git status | grep -E "^no changes|^nothing added" > /dev/null && echo "*"`
  echo "($BRANCH$DIRTY)"
fi


#add `gitprompt.sh` to $PS1 when gitprompt.sh is in path

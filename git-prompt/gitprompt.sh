#!/bin/bash
if git status 2>&1| grep -q "^# On branch" 
then
  BRANCH=`git branch | grep  ^*|awk '{print $2}'`
  DIRTY=`git status | grep -E "^no changes|^nothing added" > /dev/null && echo "*"`
  [[ $DIRTY ]] && COLOR="\033[0;31m" || COLOR="\033[0;32m"
  COLOR_RESET="\033[0m"

  echo -e "($COLOR$BRANCH$DIRTY$COLOR_RESET)"
fi


#add `gitprompt.sh` to $PS1 when gitprompt.sh is in path

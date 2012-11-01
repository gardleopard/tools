#!/bin/bash
function bash_git_prompt() {
  if git status 2>&1| grep -q "^# On branch"
  then
    BRANCH=`git branch 2>&1 | grep  ^*|awk '{print $2}'`
    DIRTY=`git status 2>&1 | grep -E "^no changes|^nothing added" > /dev/null && echo "*"`
    [[ $DIRTY ]] && COLOR="\[\e[0;31m\]" || COLOR="\[\e[0;32m\]"
    COLOR_RESET="\[\e[m\]"
    export GITPROMPT="($COLOR$BRANCH$DIRTY$COLOR_RESET)"
  else 
    export GITPROMPT=""
  fi
}

#add this to .bashrc
#bash_prompt() {
#  . /where/gitprompt/is/installed/gitprompt.sh
#  bash_git_prompt
#  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${GITPROMPT}\$ "
#}

#PROMPT_COMMAND=bash_prompt

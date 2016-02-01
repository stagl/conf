#!/bin/bash

# go drunk, you're home
alias ~="cd ~ && l"

# link to this file; reloads after edit
alias balias="nano ~/.bash_aliases && source ~/.bash_aliases"

# show some logs
alias taila="tail -f /var/log/apache2/access_combined.log"
alias taile="tail -f /var/log/apache2/error.log"
alias tailc="tail -f /var/log/cron.log"

# list all
alias l="ls -halG"
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# Find a file with a pattern in name:
function ff { find . -type f -iname '*'"$*"'*' -ls ; }

# change directory and list
function cd { builtin cd "${1:-}"; l ;}

# redo last command with sudo
function f { sudo !-2 ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

# go to newly created directory
function mkcd
{
	mkdir -p $1 && eval cd $1
}

# back a directory
alias b="cd .."

# i can never remember this fucking thing
alias untar="tar -zxvf $1"

# edit bashrc
alias bashrc="nano ~/.bashrc && source ~/.bashrc"

# edit hosts
alias hosts="sudo nano /etc/hosts"

# adds some text in the terminal frame
function xtitle
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}

# get IP adress
function my_ip
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

# Open last modified file in vim
alias Vim="vim `ls -t | head -1`"

# open last modified file in nano
alias naan="nano `ls -t | head -1`"

# Find top 5 big files
alias findbig="find . -type f -exec ls -s {} \; | sort -n -r | head -5"

# Grep for a bash process
alias psg="ps -aux | grep bash"

# Make basic commands interactive, and verbose
alias cp="cp -v"
alias rm="rm -v"
alias mv="mv -v"
alias grep="grep -i"  # ignore case

# Easy to use aliases for frequently used commands
alias x="exit"
alias s="sudo -s"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade -y"

# pretty print of path
alias path='echo -e ${PATH//:/\\n}'

# Clear the screen and list files normally
alias cls='clear;ls'

# Filesystem diskspace usage
alias dus='df -h'

# git stuff
alias gs="git status"
alias gd="git diff"
alias ga="git add -A"
alias glo='git log --pretty=format:"%ad :: %s" > /var/www/dev/git.log'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gc="git fetch && git checkout $1"
alias gloc='git log --author="stagl" --all --since="yesterday" --pretty=tformat: --numstat | gawk '\''{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf
"added lines: %s removed lines: %s total lines: %s\n",add,subs,loc }'\'' -'

# git pull and rebase
function gpl {
  if [[ -z "$1" ]]
  then
    git pull --rebase origin master
  else
    git pull --rebase origin $1
  fi
}

# edit mac php.ini (update with your own)
alias php.ini="subl /usr/local/etc/php/5.4/php.ini"

# Git branch in prompt.
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/🐱 \1/'
}

function root_down {
  if [ "$EUID" -ne 0 ]
  then
    echo "😰"
  else
    echo "😈"
  fi
}

# helpful prompt displays: (server) user [path] (git branch) >
# remember to update the server with the proper value
# v 1
# export PS1="\[$(tput bold)\]\[$(tput setaf 8)\](\h)\[$(tput sgr0)\] \e[36m\]\u [\[\e[35m\]\w\[\e[36m\]] \[$(tput setaf 3)\]>\[$(tput setaf 9)\] "
# v 2
# export PS1="🖥 $(tput bold)$(tput setaf 2) slim $(tput setaf 1)📆 $(date +%I:%M) $(tput setaf 6)😶 \u $(tput setaf 5)🏚 \w $(tput setaf 2)\$(parse_git_branch) $(tput setaf 3)
# \$(root_down) >"
# v 3
export PS1="🖥 $(tput bold)$(tput setaf 2) slim $(tput setaf 1)📆  \$(date +%I:%M) $(tput setaf 5)🏚 \w  $(tput setaf 2)\$(parse_git_branch) $(tput setaf 3)
\$(root_down)  $(tput sgr0)"

# pretty ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# clear out known_hosts file
alias known_hosts="mv ~/.ssh/known_hosts ~/.ssh/known_hosts.bak"

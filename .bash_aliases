#!/bin/bash

# go drunk, you're home
alias ~="cd ~ && l"

# easy to swap out if needed
alias edit="subl"

# link to this file; reloads after edit
alias balias="nano ~/.bash_aliases && source ~/.bash_aliases"

# also now with nanorc
alias nanorc="edit ~/.nanorc"

# fuck it, why not
alias php.ini="edit /etc/php.ini"

# show some logs
alias taila="tail -f /var/log/apache2/access_combined.log"
alias taile="tail -f /var/log/apache2/error.log"
alias tailc="tail -f /var/log/cron.log"

# list all
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# colored tree and paginated
alias tree='tree -Csuh | more'

#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Find a file with a pattern in name:
function ff { find . -type f -iname '*'"$*"'*' -ls ; }

# change directory and list
function cd { builtin cd "${1:-}"; ls ;}

# redo last command with sudo
alias f='sudo "$BASH" -c "$(history -p !!)"'

# go to newly created directory
function mkcd
{
  mkdir -p $1 && eval cd $1
}
alias mkdir='mkdir -p'

# back a directory
alias b="cd .."

# i can never remember this fucking thing
alias untar="tar -zxvf"

# edit bashrc
alias bashrc="edit ~/.bashrc && source ~/.bashrc"

# edit hosts
alias hosts="sudo edit /etc/hosts"

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

# Make basic commands verbose
alias cp="cp -v"
alias rm="rm -v"
alias mv="mv -v"
alias grep="grep -i"  # ignore case

# Easy to use aliases for frequently used commands
alias x="exit"
alias s="sudo -s"

# ubuntu items; need a conditional here
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade -y"
alias upgrate="update && upgrade"

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
alias php.ini="edit /usr/local/etc/php/5.4/php.ini"

# Git branch in prompt.
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/🐱 \1/'
}

function root_down {
  if [ "$EUID" -ne 0 ]
  then
    echo "😰"
  else
    echo "😈"
  fi
}

function wtf() {
  echo "$1"
}

# delete recursive
function rmr () {
	find . -name "$1" -type f -delete -exec \
	echo $(tput setaf 1)"deleted >"$(tput setaf 2) {} \; ;
	l;
}

# helpful prompt displays: (server) user [path] (git branch) >
export PS1="🖥 $(tput bold)$(tput setaf 2) \h $(tput setaf 1)📆  \$(date +%I:%M) $(tput setaf 5)🏚 \w $(tput setaf 2)\$(parse_git_branch) $(tput setaf 3)
\$(root_down)  $(tput sgr0)"

# pretty ls colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# clear out known_hosts file
alias known_hosts="mv ~/.ssh/known_hosts ~/.ssh/known_hosts.bak"

#############################################
# very personal aliases that probably 		#
# will be useless for anyone else			#
# ###########################################

alias p="cd ~/projects/"
alias l="\ls -a"
alias ls="\ls -al"

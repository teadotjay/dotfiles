## Check to see if we really wanted zsh instead
if test "$BASH" == "/usr/bin/zsh" || test "$BASH" == "/bin/zsh"; then
  exec $BASH
fi

## Common setup variables
export PAGER=less
export EDITOR=vim
export VISUAL=$EDITOR

## Set default umask and terminal options
if tty -s; then
  stty erase '^?' intr '^c'
  stty -ixon -ixoff
fi
umask 002
set -o emacs

## Source alias file
[ -f ~/.alias ] && source ~/.alias

## Set maximum length of short working directory name
export PWD_MAXLEN=40
## Get a short version of the working directory
function _pwd_short() {
  perl -e '$_=$ARGV[0]; while (length>$ARGV[1] && s/.*?\///) {}; print' \
    ${PWD/#$HOME/\~} $PWD_MAXLEN
}
## Get an even shorter version of the working directory (strip out vowels)
function _pwd_shorter() {
  echo ${PWD/#$HOME/\~} | sed "s/^.*\/\([^/]*\/[^/]*\)$/\1/; s/[aeiouAEIOU._-]//g"
}

## Green for success, red for failure
function _red_green() {
  if [[ $? = "0" ]]; then echo '\[\033[32m\]'; else echo '\[\033[31m\]'; fi
}
## Set screen info to short pwd (if screen is running)
function _screen_pwd() {
  if [[ "$TERMCAP" =~ 'screen' ]]; then
    echo '\[\033k$(_pwd_shorter)\033\134\]'
  fi
}
## Get the average load
function _load() {
  cat /proc/loadavg | awk '{ print $1; }'
}
## Report running and stopped jobs, if any
function _jobs() {
  running=$(jobs -r | wc -l)
  stopped=$(jobs -s | wc -l)
  if test $running -gt 0; then
    echo -n "\[\e[0m\][\[\e[32m\]$running\[\e[0m\]]"
  fi
  if test $stopped -gt 0; then
    echo -n "\[\e[0m\][\[\e[31m\]$stopped\[\e[0m\]]"
  fi
}
## Set bash prompt
# screen tagline: compact working directory name
# line 1: pwd and EGO_ENVS (set by 'ego' package on 1700 compute servers)
# line 2: time (green for success, red for fail) and hostname
#PROMPT_COMMAND='PS1="\n\[\e[1;33;40m\]\w \[\e[30;1m\]$EGO_ENVS
#\[\e[0;1m\]$(_red_green)\A \[\e[34m\]$(_load) \[\e[36m\]\h$(_jobs)\[\e[0m\]$(_screen_pwd)\\$ "'
PROMPT_COMMAND='PS1="\[\e[0;36m\]\w\[\033[0m\]$(_screen_pwd)
\[\e[1m\]$(_red_green)\A \[\e[34m\]$(_load) \[\e[36m\]\h$(_jobs)\
\[\e[0m\]\\$ "'

## Source .local_bashrc
if [[ -f ~/.local_bashrc ]]; then source ~/.local_bashrc; fi


# Adapted from https://github.com/Parth/dotfiles/blob/master/zsh/prompt.sh
# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {

  # [
  PS1="%{$fg[white]%}[%{$reset_color%}"

  # Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
  PS1+="%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"

  # Status Code
  PS1+='%(?..,%{$fg[red]%}%?%{$reset_color%})'

  # Git
  if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
    PS1+=','
    PS1+="%{$fg_bold[blue]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
    # if [ $(git status --short | wc -l) -gt 0 ]; then 
      # PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
    # fi
  fi


  # Timer: http://stackoverflow.com/questions/2704635/is-there-a-way-to-find-the-running-time-of-the-last-executed-command-in-the-shel
  if [[ $_elapsed[-1] -ne 0 ]]; then
    PS1+=','
    PS1+="%{$fg_bold[magenta]%}$_elapsed[-1]s%{$reset_color%}"
  fi

  # PID
  stopped=$(jobs -s | wc -l)
  if test $stopped -gt 0; then
    PS1+=','
    PS1+="%{$fg[yellow]%}$stopped%{$reset_color%}"
  fi

  PS1+="%{$fg[white]%}]: %{$reset_color%}% "
}

precmd_functions+=set_prompt

preexec () {
   (( ${#_elapsed[@]} > 1000 )) && _elapsed=(${_elapsed[@]: -1000})
   _start=$SECONDS
}

precmd () {
   (( _start >= 0 )) && _elapsed+=($(( SECONDS-_start )))
   _start=-1 
}

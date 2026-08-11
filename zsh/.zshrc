[[ -t 0 ]] && stty -ixon

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls="ls -G"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
alias g=grep
alias ll='ls -l'
set -o vi

EDITOR=vim

bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

alias rcedit="$EDITOR $HOME/.zshrc"


autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# Define the qcd function
qcd () {
  # Accept 1 argument that's a string key, and perform a different
  # "cd" operation for each key.
  case "$1" in
    work)
      pushd $HOME/Work/Projects
      ;;
    downloads)
      pushd $HOME/Downloads
      ;;
    linux)
      pushd $HOME/linux_console
      ;;
    *)
      # The supplied argument was not one of the supported keys
      echo "qcd: unknown key '$1'"
      return 1
      ;;
  esac
  # Helpfully print the current directory name to indicate where you are
  pwd
}
# Set up tab completion
complete -W "work downloads linux" qcd

CDPATH=$HOME:$HOME/Work:$HOME/linux_console:$HOME/.dotfiles

alias dirs='dirs -v'
alias gd=pushd 
alias pd=popd
alias slurp='pushd - && pushd'


alias d=dirs
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

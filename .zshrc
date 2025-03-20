HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
autoload -U compinit && compinit
zstyle ':completion:*' menu select
autoload -U colors && colors
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
setopt autocd
export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin
alias ls='ls --color=auto'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color=auto'
alias v='nvim'
alias py='python'
bindkey -e
autoload -U select-word-style
select-word-style bash

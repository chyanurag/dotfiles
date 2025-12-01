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
setopt autocd
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
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools/bin:$HOME/.cargo/bin:$HOME/.local/bin

# pnpm
export PNPM_HOME="/home/ag/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

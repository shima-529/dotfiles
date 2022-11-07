source ~/.zshplugin/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zshplugin/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshplugin/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=($ZSH_AUTOSUGGEST_CLEAR_WIDGETS do_enter)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 30
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
bindkey '^ ' autosuggest-clear

# ^sを使えるようにする
# setopt no_flow_control

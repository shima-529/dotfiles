zsh_plugs="~/.zsh.d/plugins"
source ~/.zsh.d/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh.d/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh.d/plugins/cda/cda.sh
# source ~/.zsh.d/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=($ZSH_AUTOSUGGEST_CLEAR_WIDGETS do_enter)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
source ~/.zsh.d/plugins/zaw/zaw.zsh
bindkey '^@' zaw-cdr
bindkey '^r' zaw-history
bindkey '^_' zaw-applications
bindkey '^ ' autosuggest-clear

# [ -f ~/.enhancd/zsh/enhancd.zsh ] && source ~/.enhancd/enhancd.sh
# if [ $SHLVL -gt 1 ]; then
# 	type fzf-tmux 1>/dev/null 2>/dev/null
# 	if [ $? -eq 0 ]; then
# 		export ENHANCD_FILTER="fzf-tmux":$ENHANCD_FILTER
# 	fi
# fi
# ^sを使えるようにする
setopt no_flow_control

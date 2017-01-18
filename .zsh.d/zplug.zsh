source ~/.zsh.d/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh.d/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey '^e' fzf-file-widget
[ -f ~/.enhancd/zsh/enhancd.zsh ] && source ~/.enhancd/enhancd.sh
if [ $SHLVL -gt 1 ]; then
	type fzf-tmux 1>/dev/null 2>/dev/null
	if [ $? -eq 0 ]; then
		export ENHANCD_FILTER="fzf-tmux":$ENHANCD_FILTER
	fi
fi
# ^sを使えるようにする
setopt no_flow_control

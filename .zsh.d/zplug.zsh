# Zplug
source ~/.zplug/zplug
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "b4b4r07/emoji-cli"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.enhancd/zsh/enhancd.zsh ] && source ~/.enhancd/enhancd.sh
if [ $SHLVL -gt 1 ]; then
	type fzf-tmux 1>/dev/null 2>/dev/null
	if [ $? -eq 0 ]; then
		export ENHANCD_FILTER="fzf-tmux":$ENHANCD_FILTER
	fi
fi
# ^sを使えるようにする
setopt no_flow_control
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi
zplug load

source ~/.zsh.d/plugins/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh.d/plugins/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh.d/plugins/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh


# zsh-histroy-substring-searchが上下キーでヒストリを検索できるように
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-syntax-highlightのシンタックス有効化設定
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# zsh-autosuggestionsの補完提案内容を消すhook
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=($ZSH_AUTOSUGGEST_CLEAR_WIDGETS do_enter)

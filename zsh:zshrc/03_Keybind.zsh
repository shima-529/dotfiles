bindkey -e # Emacsと同じ様に C-a, C-e などを使えるようにする
setopt auto_cd

function do_enter() {
	if [ -n "$BUFFER" ]; then # 文字入力ありでEnterを押した時
		zle accept-line
		return 0
	fi

	echo
	ls
	zle reset-prompt # プロンプト表示
}
zle -N do_enter
bindkey '^m' do_enter

# fzf
# Solarized colors
export FZF_DEFAULT_OPTS='
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
'
function select-history() {
  BUFFER="$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")"
  CURSOR="$#BUFFER"
}
zle -N select-history
bindkey '^r' select-history

# Ctrl-Left/Right で単語移動
bindkey ";5C" forward-word
bindkey ";5D" backward-word

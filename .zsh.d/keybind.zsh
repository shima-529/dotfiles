bindkey -e
# キーバンド
bindkey  undo
bindkey  redo

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
	echo 
    ls
	echo # プロンプトの行数だけ改行を入れる
	echo
    zle reset-prompt
}
zle -N do_enter
bindkey '^m' do_enter
bindkey -M viins ' ' vi-cmd-mode

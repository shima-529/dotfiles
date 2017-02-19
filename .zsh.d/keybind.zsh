bindkey -e

function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
	echo 
    ls
    zle reset-prompt
}
zle -N do_enter
bindkey '^m' do_enter
# bindkey -M viins ' ' vi-cmd-mode

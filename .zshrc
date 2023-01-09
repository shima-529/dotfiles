typeset -U path cdpath fpath manpath
setopt auto_cd
FPATH="/usr/local/share/zsh-completions:$FPATH"
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

set nomatch
disable r

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups
setopt share_history        # share command history data

# コマンドtypo時
function command_not_found_handler() {
	if [ -x /usr/lib/command-not-found ]; then
		/usr/lib/command-not-found --no-failure-msg -- "$1"
	else
		echo "Not found such a fuckin' command '$1' 💢💢💢"
	fi
}

source "$HOME/.zsh.d/gloval.zsh"
source "$HOME/.zsh.d/alias.zsh"
source "$HOME/.zsh.d/suffix.zsh"
source "$HOME/.zsh.d/keybind.zsh"
source "$HOME/.zsh.d/vimode.zsh"
source "$HOME/.zsh.d/abbrev.zsh"
source "$HOME/.zsh.d/completion.zsh"
source "$HOME/.zsh.d/zplug.zsh"

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OPAM configuration
# . /Users/yuki/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# zmodload zsh/zprof && zprof

# Solarized colors
export FZF_DEFAULT_OPTS='
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
--color info:254,prompt:37,spinner:108,pointer:235,marker:235
'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
[[ ! -r /home/yuki/.opam/opam-init/init.zsh ]] || source /home/yuki/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

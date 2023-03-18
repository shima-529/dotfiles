# Colors for man (and woman)
export LESS_TERMCAP_mb="$(printf "\e[1;31m")"
export LESS_TERMCAP_md="$(printf "\e[1;31m")"
export LESS_TERMCAP_me="$(printf "\e[0m")"
export LESS_TERMCAP_se="$(printf "\e[0m")"
export LESS_TERMCAP_so="$(printf "\e[1;44;33m")"
export LESS_TERMCAP_ue="$(printf "\e[0m")"
export LESS_TERMCAP_us="$(printf "\e[1;32m")"

# 色・プロンプトの設定
autoload -Uz colors && colors
local p_cdir="%~"
local p_mark="$"
PROMPT="%n: %F{blue}${p_cdir}%f%} ${p_mark} "

# git用の右プロンプト
function rprompt-git-current-branch {
	local name st color
	if [[ "$PWD" =~ /\.git(/.*)?$ ]]; then
		return
	fi
	name=$(basename "$(git symbolic-ref HEAD 2>&1)")
	if [[ "$name" == "fatal: ref HEAD is not a symbolic ref" ]]; then
		name=$(git rev-parse --short=7 HEAD)
	elif [[ -n "$(echo "$name" | grep "not a git repository")" ]]; then
		return
	fi

		st=`git status 2> /dev/null`
		if [[ -n "$(echo "$st" | grep "^nothing to")" ]]; then
			color="${fg[green]}"
		elif [[ -n "$(echo "$st" | grep "^nothing added")" ]]; then
			color="${fg[yellow]}"
		elif [[ -n "$(echo "$st" | grep "^# Untracked")" ]]; then
			color="${fg_bold[red]}"
		else
			color="${fg[red]}"
		fi
		echo "[%{$color%}$name%{$reset_color%}]"
}
setopt prompt_subst
RPROMPT='$(rprompt-git-current-branch)'

# fzf
function select-history() {
  BUFFER="$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")"
  CURSOR="$#BUFFER"
}
zle -N select-history
bindkey '^r' select-history

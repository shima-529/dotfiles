unsetopt nomatch # globにマッチしなくてもエラーにしない

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups
setopt share_history        # share command history data

# Shell Variables
WORDCHARS=$(echo $WORDCHARS | tr -d "/=*") # 単語境界とみなす文字集合の追加
export EDITOR="vim"
export LESS='-g -i -M -R -W -z-4 -x4'
export LESSOPEN="| $(which src-hilite-lesspipe.sh) %s"

# 色・プロンプトの設定
autoload -Uz colors && colors
ssh_prefix=$([ -n "${SSH_CONNECTION}" ] && echo '(ssh) ')
PROMPT='${ssh_prefix}%n: %F{blue}$(prompt-trunc)%f%} $ '
function prompt-trunc { # プロンプトが長い場合に短縮する
	term_cols="$(tput cols)"
	length_threshold="$(expr ${term_cols} \* 2 / 3)"

	full_pwd_symbol='%~'
	full_pwd="${(%)full_pwd_symbol}"
	if [ "${#full_pwd}" -lt "${length_threshold}" ]; then
		echo "${full_pwd_symbol}"
	else
		dir_first="$(echo ${full_pwd} | grep -o '[~/]*[^/]\+/[^/]\+' | head -n1)"
		dir_last="$(basename ${full_pwd})"
		echo "${dir_first}/.../${dir_last}"
	fi
}
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

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

# コマンドtypo時
function command_not_found_handler() {
	echo "Not found such a fuckin' command '$1' 💢💢💢"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

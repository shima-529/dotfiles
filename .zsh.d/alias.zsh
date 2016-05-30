# Zsh aliases & functions
alias shell='echo $SHELL'
alias path='echo $PATH | tr ":" "\n"'
function path_append(){
	path_remove "$1"
	export PATH="$PATH:$1"
}
function path_prepend(){
	path_remove "$1"
	export PATH="$1:$PATH"
}
function path_remove(){ 
	PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: '$0 != "'"$1"'"' | sed 's/:$//')
	export PATH
}

# cd,ls,openコマンド
function f(){
    if [ "$1" = "" ]; then
		open .
    else
        open "$1"
   fi
}
function cdf () {
	target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
		if [ "$target" != "" ]; then
			cd "$target" || exit
			pwd
		else
			echo 'No Finder window found' >&2
		fi
}
alias cd..='\cd ..'
# For FreeBSD ls
# alias l='ls'
# alias ls='\ls -GF'
# alias ll='\ls -l'
# alias la='ls -GAF'
# For GNU ls
alias l='ls --color=auto'
alias ls='ls --color=auto -F'
alias ll='ls --color=auto -lF'
alias la='ls --color=auto -AF'
alias a='ls --color=auto -AF'
function del() {
	if [ "$1" = "it" ]; then
		dir="$(pwd)"
		builtin cd ..
		shift
	fi
	rmtrash $@ $dir
}

# その他
alias fuck='eval $(thefuck $(fc -ln -1))'
alias dock='killall dock'
# zshrc(), vimrc() {{{
function zshrc(){
	i=0
	echo "Choose an item to edit."
	echo "=============================="
	files=($(ls ~/.zsh.d/*.zsh))
	echo "0) ~/.zshrc"
	for file in "${files[@]}"; do
		let selection=${i}+1
		echo "${selection}) ${file##*/}"
		let i=${i}+1
	done
	echo "=============================="
	printf "> "
	let i=${i}-1
	if [ "$1" = "" ]; then
		read -r input
	else
		echo 
		input="$1"
	fi
	if [ "${input}" -gt "$(expr ${i} + 1)" ]; then
		echo "Err: invaild number" >&2
	else
		if [ "${input}" -eq "0" ]; then
			vim ~/.zshrc
		else
			vim "${files[${input}]}"
		fi
	fi
}
function vimrc(){
	i=0
	echo "Choose an item to edit."
	echo "=============================="
	files=($(ls ~/.vim/vimrc/*.vim))
	for file in "${files[@]}"; do
		let selection=${i}+1
		echo "${selection}) ${file##*/}"
		let i=${i}+1
	done
	echo "=============================="
	printf "> "
	let i=${i}-1
	if [ "$1" = "" ]; then
		read -r input
	else
		echo 
		input="$1"
	fi
	if [ "${input}" -gt "$(expr ${i} + 1)" ]; then
		echo "Err: invaild number" >&2
	else
		vim "${files[${input}]}"
	fi
}
# }}}
function vpn(){
	if [ "$1" = "on" ];then
		scutil --nc start "$2"
	elif [ "$1" = "off" ];then
		scutil --nc stop "$2"
	else
		echo "Please fix on/off parameter." >&2
	fi
}
alias df='df -h'
alias du='du --total -h | grep "total"'
alias whiptail='dialog'
alias q='qlmanage -p 1>/dev/null 2>/dev/null'
alias tree='tree -N'
alias type='type -a'
alias vi="vim"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ldd="otool -L"

# サボり系エイリアス
function b(){
	case "$1" in
		"d" )	brew update "${@:2}";;
		"g" )	brew upgrade "${@:2}";;
		"c" )	brew cleanup "${@:2}";;
		"p" )	brew prune "${@:2}";;
		"i" )	brew install "${@:2}";;
		"ri")	brew reinstall "${@:2}";;
		"r" )	brew remove "${@:2}";;
		"l" )	brew leaves "${@:2}";;
		"s" )	brew search "${@:2}";;
		 *  )	brew "${@:1}";;
	esac
}
# typo対策
alias ks='ls'

# Zsh aliases & functions

# cd,ls,openコマンド
function f () {
	arg=${1-.} # arg == $1 (ifndef ".")
	open "$arg"
}

if ls -N 1>/dev/null 2>&1 ; then
	# For GNU ls
	alias l='ls --color=auto -N'
	alias ls='ls --color=auto -FN'
	alias ll='ls --color=auto -lFN'
	alias la='ls --color=auto -AFN'
else
	# For BSD ls
	alias l='ls -GF'
	alias ls='ls -GF'
	alias ll='ls -GF -l'
	alias la='ls -GAF'
fi
alias grep='grep --color=auto'

# その他
alias fuck='eval $(thefuck $(fc -ln -1))'

if [ "$(uname)" = "Darwin" ]; then
	alias ldd="otool -L"
	function cdf () {
		target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
		if [ "$target" != "" ]; then
			cd "$target" || exit
			pwd
		else
			echo 'No Finder window found' >&2
		fi
	}
fi
if [ "$(uname)" = "Linux" ]; then
	alias pbcopy='xsel --clipboard --input'
	alias pbpaste='xsel --clipboard --output'
fi


# typo対策
alias ks='ls'
alias :q='exit'
alias :wq='exit'
alias :make='make'
alias cd..='\cd ..'

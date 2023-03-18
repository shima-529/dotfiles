# Zsh aliases & functions
alias path='echo $PATH | tr ":" "\n"'

# cd,ls,openコマンド
function f () {
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
alias :q='exit'
alias :wq='exit'
alias :make='make'
alias cd..='\cd ..'
# For GNU ls
alias l='ls --color=auto -N'
alias ls='ls --color=auto -FN'
alias ll='ls --color=auto -lFN'
alias la='ls --color=auto -AFN'
alias a='ls --color=auto -AFN'
alias grep='grep --color=auto'

# その他
alias fuck='eval $(thefuck $(fc -ln -1))'

alias type='type -a'
if [ "$(uname)" = "Darwin" ]; then
    alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
	alias ldd="otool -L"
fi

# typo対策
alias ks='ls'

alias grub-emu='grub-emu; reset'

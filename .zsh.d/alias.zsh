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
alias cdd='~/cdd.sh'
# For FreeBSD ls
# alias l='ls'
# alias ls='\ls -GF'
# alias ll='\ls -l'
# alias la='ls -GAF'
# For GNU ls
alias l='ls --color=auto -N'
alias ls='ls --color=auto -FN'
alias ll='ls --color=auto -lFN'
alias la='ls --color=auto -AFN'
alias a='ls --color=auto -AFN'
alias grep='grep --color=auto'
function del() {
    if [ "$1" = "it" ]; then
        dir="$(pwd)"
        builtin cd ..
        shift
    fi
    rmtrash "$@" "$dir"
}

# その他
alias fuck='eval $(thefuck $(fc -ln -1))'
alias vsel='vim $(find $HOME/.vim/vimrc/ -type f -name "*.vim" | sed "\$a"$HOME"/.vimrc" | sort | fzf)'
alias zsel='vim $(find $HOME/.zsh.d/ -type f -name "*.zsh" -maxdepth 1 | sed "\$a"$HOME"/.zshrc" | fzf)'
function vpn(){
    if [ "$1" = "on" ];then
        scutil --nc start "$2"
    elif [ "$1" = "off" ];then
        scutil --nc stop "$2"
    else
        echo "Please fix on/off parameter." >&2
    fi
}
alias whiptail='dialog'
alias tree='tree -N'
alias type='type -a'
if [ "$(uname)" = "Darwin" ]; then
    alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
fi
alias ldd="otool -L"

# typo対策
alias ks='ls'

function vish(){
    vim -es <(cat) "$@" '+%p|q!'
}

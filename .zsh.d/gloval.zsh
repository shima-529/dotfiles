export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export WORDCHARS=$(echo $WORDCHARS | tr -d "/")
export EDITOR="vim"
export KEYTIMEOUT=1 # for vi mode in zsh
[ -e $(which most) ] && export PAGER=most
export PATH="$PATH:$HOME/usr/bin"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# export PATH="$PATH:/Library/TeX/texbin"
export PATH="$PATH:/usr/local/Cellar/binutils/2.26/x86_64-apple-darwin15.4.0/bin"
export PATH="$PATH:$HOME/usr/m-cli"
export PATH="$PATH:/Library/Egison/bin"
export HOMEBREW_NO_AUTO_UPDATE=1
export LESS='-g -i -M -R -W -z-4 -x4'
# 色・プロンプトの設定
autoload -Uz colors
colors
local p_cdir="%~"
local p_mark="$"
PROMPT="💻  %m: %F{blue}${p_cdir}%f%}
[%n] ${p_mark} "

# git用の右プロンプト
function rprompt-git-current-branch {
        local name st color
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi
        echo "[%{$color%}$name%{$reset_color%}]"
}
setopt prompt_subst
RPROMPT='`rprompt-git-current-branch`'

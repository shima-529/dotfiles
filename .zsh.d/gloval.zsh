export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export WORDCHARS=$(echo $WORDCHARS | tr -d "/")
export EDITOR="vim"
export KEYTIMEOUT=1 # for vi mode in zsh
export PATH="$HOME/usr/bin:$PATH"
export PATH="/usr/local/texlive/2016basic/bin/x86_64-darwin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/redsuite_5.2.6_2137/redsuite/tools/bin:$PATH"
export PATH="$PATH:$HOME/usr/m-cli"
export PATH="$PATH:$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/h8-elf/bin"
export PATH="$PATH:/usr/local/CrossPack-AVR/bin"
export HOMEBREW_NO_AUTO_UPDATE=1
export LESS='-g -i -M -R -W -z-4 -x4'
export GTK_PATH=/usr/local/lib/gtk-2.0
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}
# 色・プロンプトの設定
autoload -Uz colors
colors
local p_cdir="%~"
local p_mark="$"
# PROMPT="💻  %m: %F{blue}${p_cdir}%f%}
# [%n] ${p_mark} "
PROMPT="%n: %F{blue}${p_cdir}%f%} ${p_mark} "

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
RPROMPT='$(rprompt-git-current-branch)'

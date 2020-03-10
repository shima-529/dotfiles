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

# fzf
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# Vars for compilers
arm='arm-none-eabi'
riscv='riscv-unknown-elf'
mips='mips-elf'
h8='h8300-elf'
rl78='rl78-elf'
m32c='m32c-elf'
ft32='ft32-elf'
avr32='avr32-elf'
avr='avr'
msp430='msp430-elf'
rx='rx-elf'
sh='sh-elf'
v850='v850-elf'

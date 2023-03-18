setopt extended_glob
typeset -A abbreviations
abbreviations+=(
    "bi"   "brew install"
    "bif"  "brew info"
    "bd"   "brew update"
    "bug"  "brew upgrade"
    "br"   "brew remove"
    "bcs"   "brew cleanup -s"
)

function magic-abbrev-expand() {
	local MATCH
	LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
	LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
	LBUFFER+=' '
}

zle -N magic-abbrev-expand
bindkey "^k" magic-abbrev-expand

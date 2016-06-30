setopt extended_glob
typeset -A abbreviations
abbreviations=(
    "v"    "vim"
	"e"    "emacs"
	"hid"  "hidden"
	"gf"   "gfortran"
	"gs"   "git status"
	"ga"   "git add"
	"gc"   "git commit -m"
	"gps"  "git push"
	"gp"   "git pull"
	"ori"  "origin"
	"mas"  "master"
	"bi"   "brew install"
	"bif"  "brew info"
	"bd"   "brew update"
	"bug"  "brew upgrade"
	"br"   "brew remove"
	"bl"   "brew leaves"
	"bc"   "brew cleanup -s"
	"zrc"   "zshrc"
	"vrc"   "vimrc"
	"sq"   "seq"
    "G"    "| grep"
	"L"    "| less"
	"R"    "| richpager"
    "E"    "2>&1 > /dev/null"
    "N"    "> /dev/null"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand

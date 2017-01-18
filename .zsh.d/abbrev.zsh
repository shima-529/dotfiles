setopt extended_glob
typeset -A abbreviations
abbreviations=(
    "epigenetic"    "DNA塩基配列の変化を伴わない細胞分裂後も継承される遺伝子発現あるいは細胞表現型の変化を研究する学問領域"
    "epigenome" "DNAメチル化等による生後の染色体機能変化"
    "v"    "vim"
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
	"bcs"   "brew cleanup -s"
    "bs"    "brew search"
    "bt"    "brew tap"
    "but"   "brew untap"
	"zrc"   "zshrc"
	"vrc"   "vimrc"
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

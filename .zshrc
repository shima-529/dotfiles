typeset -U path cdpath fpath manpath
setopt auto_cd
FPATH="/usr/local/share/zsh-completions:$FPATH"
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

set nomatch

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups
setopt share_history        # share command history data

# function subsh(){
# 	eval "__precmd_for_subsh() { print -z '$* ' }"
# 	autoload -Uz add-zsh-hook
# 	add-zsh-hook precmd "__precmd_for_subsh"
# }

# コマンドtypo時
function command_not_found_handler() {
  echo "Not found such a fuckin' command '$1' 💢 💢 💢"
}

source "$HOME/.zsh.d/gloval.zsh"
source "$HOME/.zsh.d/alias.zsh"
source "$HOME/.zsh.d/suffix.zsh"
source "$HOME/.zsh.d/keybind.zsh"
source "$HOME/.zsh.d/vimode.zsh"
source "$HOME/.zsh.d/abbrev.zsh"
source "$HOME/.zsh.d/completion.zsh"
source "$HOME/.zsh.d/zplug.zsh"

# if (which zprof > /dev/null) ;then
#   zprof | less
# fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

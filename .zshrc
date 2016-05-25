setopt auto_cd
plugins+=(zsh-completions)
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

function subsh(){
	eval "__precmd_for_subsh() { print -z '$* ' }"
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd "__precmd_for_subsh"
}

# コマンドtypo時
function command_not_found_handler() {
  echo "Not found such a fuckin' command '$1' 💢 💢 💢"
}

source ~/.zsh.d/gloval.zsh
source ~/.zsh.d/alias.zsh
source ~/.zsh.d/suffix.zsh
source ~/.zsh.d/keybind.zsh
source ~/.zsh.d/abbrev.zsh
source ~/.zsh.d/completion.zsh
source ~/.zsh.d/zplug.zsh

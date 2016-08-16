# 補完
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
setopt always_last_prompt
setopt print_eight_bit
setopt cdable_vars
setopt extended_glob
setopt globdots
bindkey "^I" menu-complete
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
# setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "[Z]" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
setopt nolistbeep
# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:default' menu select=2
autoload -U compinit
compinit

# 補完
# 参考は http://voidy21.hatenablog.jp/entry/20090902/1251918174
setopt auto_param_keys
setopt interactive_comments # ZLE上でも#をコメントとみなす
setopt magic_equal_subst # --prefix=/usr... など、どこでも補完
# setopt complete_in_word
# setopt always_last_prompt # カーソル位置を保持して補完
bindkey "^I" menu-complete
# setopt auto_list               # 補完候補を一覧で表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
# setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "[Z]" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
setopt nolistbeep
# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 今いるディレクトリを補完候補から外す
zstyle ':completion:*' ignore-parents parent pwd ..
# 矢印キーで補完を選択可能に
zstyle ':completion:*:default' menu select=2
# autoload -U compinit
# compinit -u
autoload -Uz compinit
compinit -C

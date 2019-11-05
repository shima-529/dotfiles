export GOPATH=~/.go
export GOBIN="$GOPATH/bin"
export PATH="${PATH}:${GOBIN}"
# zmodload zsh/zprof && zprof
setopt no_global_rcs # avoid loading /etc/profile (not to execute /usr/libexec/path_helper)
# source $HOME/.zsh.d/gloval.zsh
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export WORDCHARS=$(echo $WORDCHARS | tr -d "/")
export EDITOR="vim"
export KEYTIMEOUT=1 # for vi mode in zsh
export PATH=$PATH:$HOME/.cargo/bin
export PATH="$PATH:/Applications/microchip/xc32/v2.05/bin"
export PATH="/usr/local/texlive/2019basic/bin/x86_64-darwin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Library/Frameworks/Mono.framework/Commands/:$PATH"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/bin"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/usr/bin:$PATH"
export PATH="/Users/yuki/.nodebrew/current/bin/:$PATH"
export PATH="$PATH:$HOME/usr/m-cli"
export PATH="$PATH:$HOME/.stack/programs/x86_64-osx/ghc-8.0.2/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/cross/bin"
export SATYSFI_LIB_ROOT=/usr/local/lib-satysfi
export HOMEBREW_NO_AUTO_UPDATE=1
export LESS='-g -i -M -R -W -z-4 -x4'
export GTK_PATH=/usr/local/lib/gtk-2.0
export IDF_PATH="/Users/yuki/Dropbox/esp32/esp-idf"

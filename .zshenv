if [ "$(uname)" = "Darwin" ]; then
	setopt no_global_rcs # avoid loading /etc/profile (not to execute /usr/libexec/path_helper)
fi


# Language Settings
if [ "$TERM" = "linux" ]; then
	export LANG=C
	export LC_ALL=C
else
	export LANG=ja_JP.UTF-8
	export LC_ALL=ja_JP.UTF-8
fi


# Shell Variables
export WORDCHARS=$(echo $WORDCHARS | tr -d "/=")
export EDITOR="vim"
export KEYTIMEOUT=1 # for vi mode in zsh


# Path & Environment
export GOPATH=~/.go
export GOBIN="$GOPATH/bin"
export PATH="${PATH}:${GOBIN}"

export IDF_PATH="$HOME/Dropbox/esp32/esp-idf"
export PATH="$IDF_PATH/tools:$PATH"
. "$HOME/.cargo/env"

export PATH=$HOME/.nimble/bin:$PATH
export PATH="$HOME/usr/bin:$PATH"

if [ "$(uname)" = "Darwin" ]; then
	export PATH="/usr/local/bin:$PATH"
	export PATH="$PATH:/usr/bin"
	export PATH="$PATH:/usr/sbin"
	export PATH="$PATH:/sbin"
	export PATH="$PATH:/bin"
	export PATH="$PATH:$HOME/.local/bin"
	export PATH="$PATH:$HOME/usr/m-cli"
	export PATH="/Users/yuki/.nodebrew/current/bin/:$PATH"
	export PATH="/Users/yuki/zen/:$PATH"
	export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export PATH="$PATH:/usr/local/cross/bin"
	export PATH="/Library/Frameworks/Mono.framework/Commands/:$PATH"
	export SATYSFI_LIB_ROOT=/usr/local/lib-satysfi
	export HOMEBREW_NO_AUTO_UPDATE=1
fi


# Others
export LESS='-g -i -M -R -W -z-4 -x4'
if [ "$(uname)" = "Darwin" ]; then
	export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
fi

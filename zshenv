# Zsh loads this file prior to .zshrc, regardless of interactive or non-interactive.
# .zshenv should mainly contain global variables only.

# Path & Environment
[ -d $HOME/.cargo ] && source "$HOME/.cargo/env"
export PATH="$HOME/usr/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export PATH="${PATH}:/usr/local/cuda/bin"
export LD_LIBRARY="${LD_LIBRARY}:/usr/local/cuda/lib64"


if [ "$(uname)" = "Darwin" ]; then
	setopt no_global_rcs # avoid loading /etc/profile (not to execute /usr/libexec/path_helper)
	export PATH="/usr/local/bin:$PATH"
	export PATH="$PATH:/usr/bin"
	export PATH="$PATH:/usr/sbin"
	export PATH="$PATH:/sbin"
	export PATH="$PATH:/bin"
	export PATH="$PATH:$HOME/usr/m-cli"
	export PATH="$HOME/.nodebrew/current/bin/:$PATH"
	export PATH="$HOME/zen/:$PATH"
	export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export PATH="$PATH:/usr/local/cross/bin"
	export PATH="/Library/Frameworks/Mono.framework/Commands/:$PATH"
	export HOMEBREW_NO_AUTO_UPDATE=1
	export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"
fi



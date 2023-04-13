current_dir="$(dirname "$0")"

export TERM=fbterm
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
${current_dir}/solarized-fbterm.sh

if type uim-fep >/dev/null 2>&1; then
	exec uim-fep
fi

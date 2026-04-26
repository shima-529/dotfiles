# Wordaround to avoid unvisibility on some interactive shell
case $TERM in
	linux || xterm )
		export LANG=C
		unset LS_COLORS;;
	* )
		true;;
esac

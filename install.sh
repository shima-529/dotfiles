#! /bin/bash
cmd_exist() {
	if which "$1" >/dev/null 2>&1 ; then
		return 0
	else
		return 1
	fi
}


# Command Existence Check
cmds_required=()
cmds_required+=("git")
for key in "${cmds_required[@]}"; do
	if ! cmd_exist "$key"; then
		echo "command \"$key\" not found."
		exit 1
	fi
done

# Title Screen & Prompt
echo '     _       _    __ _ _                  _ _   '
echo '  __| | ___ | |_ / _(_) | ___  ___   __ _(_) |_ '
echo ' / _` |/ _ \| __| |_| | |/ _ \/ __| / _` | | __|'
echo '| (_| | (_) | |_|  _| | |  __/\__ \| (_| | | |_ '
echo ' \__,_|\___/ \__|_| |_|_|\___||___(_)__, |_|\__|'
echo '                                    |___/       '
echo
echo   " This script will make symlinks to $HOME"
printf " Are you sure to continue? [Y/n] "
read -r x
case "$x" in
    "" | "Y" | "y" | "yes" | "Yes" | "YES" )
        true
        cd "$(dirname "$0")";;
    * )
        exit 1;;
esac


# Creating Symlinks to Setting Files
srcs=();                 dsts=()
srcs+=(vimrc);           dsts+=("$HOME/.vimrc")
srcs+=(gvimrc);          dsts+=("$HOME/.gvimrc")
srcs+=(nanorc);          dsts+=("$HOME/.nanorc")
srcs+=(zshenv);          dsts+=("$HOME/.zshenv")
srcs+=(zshrc);           dsts+=("$HOME/.zshrc")
srcs+=(fbtermrc);        dsts+=("$HOME/.fbtermrc")
srcs+=(latexmkrc);       dsts+=("$HOME/.latexmkrc")
srcs+=(uim);             dsts+=("$HOME/.uim")
srcs+=(tmux.conf);       dsts+=("$HOME/.tmux.conf")
srcs+=(picom.conf);      dsts+=("$HOME/.config/picom.conf")
srcs+=(vim:vimrc);       dsts+=("$HOME/.vim/vimrc")
srcs+=(vim:dein_toml);   dsts+=("$HOME/.vim/dein_toml")
srcs+=(vim:mysnippets);  dsts+=("$HOME/.vim/mysnippets")
srcs+=(vim:mysnippets);  dsts+=("$HOME/.vim/mysnippets")
srcs+=(fbterm.d);        dsts+=("$HOME/.fbterm.d")

list_num=${#srcs[@]}
echo

echo "- Configuration File Symlinks"
for i in $( seq 0 $((list_num - 1)) ) ; do
	src=${srcs[$i]}
	dst=${dsts[$i]}

	if [ ! -d "$(dirname "$dst")" ] ; then
		mkdir -p "$(dirname $dst)"
	fi

	ln -sT "$PWD/$src" "$dst"
done


# Cloning zsh plugins
repo_list=('zsh-autosuggestions' 'zsh-syntax-highlighting' 'zsh-history-substring-search')
user_list=('zsh-users'           'zsh-users'               'zsh-users')
repo_num=${#repo_list[@]}
dest_base=$HOME/.zshplugin
echo

echo "- Cloning Zsh Plugins"
if [ ! -d "$dest_base" ] ; then
	mkdir "$dest_base"
fi
for i in $( seq 0 $((repo_num - 1)) ) ; do
	repo=${repo_list[$i]}
	user=${user_list[$i]}
	if [ ! -d "$dest_base/$user" ] ; then
		mkdir "$dest_base/$user"
	fi

	git clone "https://github.com/$user/$repo" "$dest_base/$user/$repo" 2>/dev/null
	if [ "$?" = "0" ]; then
		echo " $user/$repo cloned."
	fi
done


# Done!
echo ""
echo "Operation Finished."

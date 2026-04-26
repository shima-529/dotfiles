#!/usr/bin/env bash
cmd_exist() {
	which "$1" >/dev/null 2>&1
}


# Command Existence Check
cmds_required=(which git)
for key in "${cmds_required[@]}"; do
	if ! cmd_exist "$key"; then
		echo "Prerequisite command \"$key\" not found." >&2
		exit 1
	fi
done

# Title Screen & Prompt
echo ' ' '________________________________________________'
echo '\' '                                                ' '\'
echo '\' '     _       _    __ _ _                  _ _   ' '\'
echo '\' '  __| | ___ | |_ / _(_) | ___  ___   __ _(_) |_ ' '\'
echo '\' ' / _` |/ _ \| __| |_| | |/ _ \/ __| / _` | | __|' '\'
echo '\' '| (_| | (_) | |_|  _| | |  __/\__ \| (_| | | |_ ' '\'
echo '\' ' \__,_|\___/ \__|_| |_|_|\___||___(_)__, |_|\__|' '\'
echo '\' '                                    |___/       ' '\'
echo '\' '________________________________________________' '\'
echo
echo -e  "\tThis script will make symlinks to $HOME"
echo -e  "\t  (will not overwrite any existing files)"
echo -ne "\tAre you sure to continue? [Y/n] "
read -n1 x
case "$x" in
	"" | "Y" | "y" )
		true
		cd "$(dirname "$0")";;
	* )
		echo
		echo -e "\tQuitted ..."
		exit 1;;
esac


# Creating Symlinks to Setting Files
srcs=();                 dsts=();
srcs+=(vimrc);           dsts+=("$HOME/.vimrc");
srcs+=(gvimrc);          dsts+=("$HOME/.gvimrc");
srcs+=(vim:vimrc);       dsts+=("$HOME/.vim/vimrc");
srcs+=(vim:dein_toml);   dsts+=("$HOME/.vim/dein_toml");
srcs+=(vim:mysnippets);  dsts+=("$HOME/.vim/mysnippets");
srcs+=(inputrc);         dsts+=("$HOME/.inputrc");
srcs+=(zshenv);          dsts+=("$HOME/.zshenv");
srcs+=(zshrc);           dsts+=("$HOME/.zshrc");
srcs+=(zsh:zshrc);       dsts+=("$HOME/.zsh.d/zshrc");
srcs+=(latexmkrc);       dsts+=("$HOME/.latexmkrc");
srcs+=(tmux.conf);       dsts+=("$HOME/.tmux.conf");
srcs+=(picom.conf);      dsts+=("$HOME/.config/picom.conf");
srcs+=(fbterm);          dsts+=("$HOME/.config/fbterm");
srcs+=(uim);             dsts+=("$HOME/.uim");
srcs+=(gitconfig);       dsts+=("$HOME/.gitconfig");
srcs+=(alacritty.toml);  dsts+=("$HOME/.alacritty.toml");
srcs+=(weston.ini);      dsts+=("$HOME/.config/weston.ini");
srcs+=(rofi.rasi);       dsts+=("$HOME/.config/rofi/config.rasi");
srcs+=(clangd);          dsts+=("$HOME/.config/clangd");

list_num=${#srcs[@]}
echo

echo "- Configuration File Symlinks"
for i in $( seq 0 $((list_num - 1)) ) ; do
	src=${srcs[$i]}
	dst=${dsts[$i]}

	mkdir -p "$(dirname $dst)"
	ln -s "$PWD/$src" "$dst"
done


# Cloning zsh plugins
gh_users=();            gh_repos=();
gh_users=('zsh-users'); gh_repos=('zsh-autosuggestions');
gh_users=('zsh-users'); gh_repos=('zsh-syntax-highlighting');
gh_users=('zsh-users'); gh_repos=('zsh-history-substring-search');

repo_num=${#gh_repos[@]}
dest_base=$HOME/.zsh/plugins
echo

echo "- Cloning Zsh Plugins"
mkdir "$dest_base"
for i in $( seq 0 $((repo_num - 1)) ) ; do
	user=${gh_usrs[$i]}
	repo=${gh_repos[$i]}

	mkdir "$dest_base/$user"
	git clone "https://github.com/$user/$repo" "$dest_base/$user/$repo" 2>/dev/null
	[ "$?" = "0" ] && echo " $user/$repo cloned."
done


# Done!
echo ""
echo "doftiles installation Finished."

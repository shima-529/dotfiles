#! /bin/bash
cmd_exist() {
	if which "$1" 2>&1 >/dev/null ; then
		return 0
	else
		return 1
	fi
}


# Command Existence Check
if ! cmd_exist figlet; then
	echo 'command "figlet" not found.'
	exit 1
fi
if ! cmd_exist git; then
	echo 'command "git" not found.'
	exit 1
fi


# Title Screen & Prompt
figlet "dotfiles.git"
echo
echo   " This script will make symlinks to $HOME"
printf " Are you sure to continue? [Y/n] "
read -r x
case "$x" in
    "" | "Y" | "y" | "yes" | "Yes" )
        true
        cd "$(dirname $0)";;
    * )
        exit 1;;
esac


# Creating Symlinks to Setting Files
src_list=( .vimrc .gvimrc .nanorc .zshenv .zshrc .tmux.conf picom.conf     vimrc       .zsh.d )
dst_list=( $HOME  $HOME   $HOME   $HOME   $HOME  $HOME      $HOME/.config/ $HOME/.vim/ $HOME  )
list_num=${#src_list[@]}
echo

echo "- Configuration File Symlinks"
for i in $( seq 0 $(($list_num - 1)) ) ; do
	src=${src_list[$i]}
	dst=${dst_list[$i]}

	if [ ! -d $dst ] ; then
		mkdir -p $dst
	fi

	ln -s $PWD/$src $dst 2>/dev/null
	if [ "$?" = "0" ]; then
		echo " $src: symlink created."
	else
		echo " $src: symlink NOT created."
	fi
done


# Cloning zsh plugins
repo_list=('zsh-autosuggestions' 'zsh-syntax-highlighting' 'zsh-history-substring-search')
user_list=('zsh-users'           'zsh-users'               'zsh-users')
repo_num=${#repo_list[@]}
dest_base=$HOME/.zshplugin
echo

echo "- Cloning Zsh Plugins"
if [ ! -d $dest_base ] ; then
	mkdir $dest_base
fi
for i in $( seq 0 $(($repo_num - 1)) ) ; do
	repo=${repo_list[$i]}
	user=${user_list[$i]}
	if [ ! -d $dest_base/$user ] ; then
		mkdir $dest_base/$user
	fi

	git clone https://github.com/$user/$repo $dest_base/$user/$repo 2>/dev/null
	if [ "$?" = "0" ]; then
		echo " $user/$repo cloned."
	fi
done


# Done!
echo ""
echo "Operation Finished."

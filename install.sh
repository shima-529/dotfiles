#! /bin/bash
echo "     _       _    __ _ _                  _ _"
echo "  __| | ___ | |_ / _(_) | ___  ___   __ _(_) |_"
echo " / _\` |/ _ \| __| |_| | |/ _ \/ __| / _\` | | __|"
echo "| (_| | (_) | |_|  _| | |  __/\__ \| (_| | | |_"
echo " \__,_|\___/ \__|_| |_|_|\___||___(_)__, |_|\__|"
echo "                                    |___/"
echo ""
echo " dotfiles for Yuki Shimazaki "
echo " This script will do as follows:"
echo "    1. Make symlinks to $HOME."
echo "    2. Clone repositories to $HOME"
printf " Are you sure to continue? [Y/n] "
read -r x
case "$x" in
    "" | "Y" | "y" | "yes" | "Yes" )
        true
        cd "$(dirname $0)";;
    * )
        exit 1;;
esac

file_list=('.vimrc' '.zshrc' '.nanorc' '.gvimrc' '.tmux.conf')
dir_list=('.vim/vimrc' '.zsh.d' '.vim/mysnippets')
echo ""
echo "Checking whether files or directries already exist..."

for item in ${file_list[@]};do
    if [ -e ~/$item ]; then
        echo "$item exists."
    else
        ln -s $PWD/$item $HOME 2>/dev/null
        if [ "$?" = "0" ]; then
            echo "symlink $item created."
        else
            echo "symlink $item not created."
        fi
    fi
done

for item in ${dir_list[@]};do
    if [ -e ~/$item ]; then
        echo "$item exists."
    else
        if [ ! -e ${item%%/*} ]; then
            mkdir $HOME/${item%%/*}
        fi
        ln -s $PWD/${item##*/} $HOME/${item%%/*}/${item##*/} 2>/dev/null
        if [ "$?" = "0" ]; then
            echo "symlink $item created."
        else
            echo "symlink $item not created."
        fi
    fi
done

repo=('zsh-users/zsh-autosuggestions' 'zsh-users/zsh-syntax-highlighting' 'zsh-users/zsh-history-substring-search')
echo ""
for item in ${repo[@]}; do
    if [ ! -e ~/.$item ]; then
        which git 1>/dev/null 2>/dev/null
        if [ ! "$?" = "0" ]; then
            echo "Please install git command."
            exit 1
        fi
        echo "Folder $item not found."
        echo "Cloning into $HOME ..."
        git clone https://github.com/$item $PWD/.zsh.d/plugins/${item##*/} 2>/dev/null
    fi
done

echo ""
echo "Operation Finished."

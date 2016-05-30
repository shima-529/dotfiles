echo "     _       _    __ _ _                  _ _"
echo "  __| | ___ | |_ / _(_) | ___  ___   __ _(_) |_"
echo " / _\` |/ _ \| __| |_| | |/ _ \/ __| / _\` | | __|"
echo "| (_| | (_) | |_|  _| | |  __/\__ \| (_| | | |_"
echo " \__,_|\___/ \__|_| |_|_|\___||___(_)__, |_|\__|"
echo "                                    |___/"
echo ""
echo " dotfiles for Yuki Shimazaki "
echo " This script will make symlinks to $HOME."
echo " Are you sure to continue? [Y/n] "
read x
case "$x" in
    "" | "Y" | "y" | "yes" | "Yes" )
        true
        cd `dirname $0`;;
    * )
        exit 1;;
esac
file_list=('.vimrc' '.zshrc' '.nanorc' '.gvimrc' '.tmux.conf')
dir_list=('.vim/vimrc' '.zsh.d' )
echo "Checking if files or directries already exist..."


for item in ${file_list[@]};do
    if [ -e ~/$item ]; then
        echo "$item exists."
    else
        ln -s $PWD/$item ~ 2>/dev/null
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
        ln -s $PWD/$item ~ 2>/dev/null
        if [ "$?" = "0" ]; then
            echo "symlink $item created."
        else
            echo "symlink $item not created."
        fi
    fi
done

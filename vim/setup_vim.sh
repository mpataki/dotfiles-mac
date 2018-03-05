function setup_vim(){
  homebrew_install vim vim
  check_and_link_file `pwd`/vim/vimrc $HOME/.vimrc
  check_and_link_file `pwd`/vim/colors $HOME/.vim/colors
}

print_with_color $YELLOW 'Setup Vim? (yes/no)'
read yn
case $yn in
  yes ) setup_vim;;
  * ) print_with_color $GREEN 'skipping...';;
esac

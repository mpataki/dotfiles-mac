function setup_vim(){
  if [ -e $HOME/.vimrc ]; then
    print_with_color $YELLOW "$HOME/.vimrc already exists. Do you want to override it? (yes/no)"
    read yn
    case $yn in
      yes ) check_and_link_file `pwd`/vim/vimrc $HOME/.vimrc;;
      * ) print_with_color $GREEN 'skipping...';;
    esac
  else
    check_and_link_file `pwd`/vim/vimrc $HOME/.vimrc
  fi
}

print_with_color $YELLOW 'Setup Vim? (yes/no)'
read yn
case $yn in
  yes ) setup_vim;;
  * ) print_with_color $GREEN 'skipping...';;
esac

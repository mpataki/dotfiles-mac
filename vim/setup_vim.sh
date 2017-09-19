function setup_vim(){
  homebrew_install vim vim
  check_and_link_file `pwd`/vim/vimrc $HOME/.vimrc

  if ! [ -e ~/.vim ]; then
    mkdir ~/.vim
  fi

  git_clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
  git_clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/airline.vim
  git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
}

print_with_color $YELLOW 'Setup Vim? (yes/no)'
read yn
case $yn in
  yes ) setup_vim;;
  * ) print_with_color $GREEN 'skipping...';;
esac

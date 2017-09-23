function setup_vim(){
  homebrew_install vim vim
  check_and_link_file `pwd`/vim/vimrc $HOME/.vimrc

  git_clone https://github.com/ctrlpvim/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim
  git_clone https://github.com/vim-airline/vim-airline.git $HOME/.vim/bundle/airline.vim
  git clone https://github.com/mileszs/ack.vim.git $HOME/.vim/bundle/ack.vim
  git clone https://github.com/chr4/jellygrass.vim.git  $HOME/.vim/bundle/jellygrass.vim
}

print_with_color $YELLOW 'Setup Vim? (yes/no)'
read yn
case $yn in
  yes ) setup_vim;;
  * ) print_with_color $GREEN 'skipping...';;
esac

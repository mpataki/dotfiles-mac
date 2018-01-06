#! /bin/bash

function setup_tmux() {
  homebrew_install tmux tmux

  git_clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

  check_and_link_file `pwd`/tmux/tmux.conf $HOME/.tmux.conf
}

print_with_color $YELLOW 'Setup tmux? (yes/no)'
read yn
case $yn in
  yes|Yes|YES|Y|y ) setup_tmux;;
  * ) print_with_color $GREEN 'skipping...';;
esac

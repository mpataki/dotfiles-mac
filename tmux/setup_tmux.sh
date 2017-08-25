#! /bin/bash

. lib/helpers.sh

function setup_tmux() {
  homebrew_install tmux tmux
  homebrew_install reattach-to-user-namespace reattach-to-user-namespace

  # install the tmux package manager
  git_clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  check_and_link_file `pwd`/tmux/tmux.conf $HOME/.tmux.conf
}

print_with_color $YELLOW 'Setup tmux? (yes/no)'
read yn
case $yn in
  yes|Yes|YES|Y|y ) setup_tmux;;
  * ) print_with_color $GREEN 'skipping...';;
esac

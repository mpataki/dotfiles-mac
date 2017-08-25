#!/usr/bin/env bash

. lib/helpers.sh

if ! [[ -e `which brew` ]]; then
  print_with_color $YELLOW "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

print_with_color $GREEN 'Updating Homebrew'
brew update

. bash/setup_bash.sh
. git/setup_git.sh
. vim/setup_vim.sh
. sublime/setup_sublime.sh
. atom/setup_atom.sh
. iterm/setup_iterm.sh
. gnupg/setup_gnupg.sh
. tmux/setup_tmux.sh
. misc_tools/setup_misc_tools.sh
. macos_apps/setup_macos_apps.sh

. $HOME/.bash_profile

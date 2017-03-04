#!/usr/bin/env bash

. lib/helpers.sh

if ! [[ -e `which brew` ]]; then
  print_with_color $YELLOW "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

print_with_color $GREEN 'Updating Homebrew'
brew update

homebrew_install 'rbenv' 'rbenv'
homebrew_install 'wget' 'wget'
homebrew_install 'ag' 'ag'
homebrew_install 'pass' 'pass'
homebrew_install 'gpg-tools' 'Caskroom/cask/gpgtools'
homebrew_install 'gpg-agent' 'gpg-agent'
homebrew_install 'pinentry-mac' 'pinentry-mac'

. bash/setup_bash.sh
. git/setup_git.sh
. vim/setup_vim.sh
. sublime/setup_sublime.sh
. atom/setup_atom.sh
. iterm/setup_iterm.sh
. gnupg/setup_gnupg.sh

download_app 'Google Chrome' 'google-chrome'
download_app 'Alfred' 'alfred'
download_app 'Spectacle' 'spectacle'

. $HOME/.bash_profile


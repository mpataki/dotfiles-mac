
function setup_git() {
  if ! [[ -e `brew --prefix`/bin/git ]]; then
    print_with_color $GREEN 'installing git'
    brew install --HEAD git
  fi

  check_and_link_file `pwd`/git/gitconfig $HOME/.gitconfig
  check_and_link_file `pwd`/git/gitignore $HOME/.gitignore

  homebrew_install 'bash-completion' 'bash-completion'
  homebrew_install 'hub' 'hub'
  homebrew_install 'diff-so-fancy' 'diff-so-fancy'
}

print_with_color $YELLOW 'Setup Git? (yes/no)'
read yn
case $yn in
  yes ) setup_git;;
  * ) print_with_color $GREEN 'skipping...';;
esac

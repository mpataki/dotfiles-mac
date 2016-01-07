
function setup_git() {
  if ! [[ -e `brew --prefix`/bin/git ]]; then
    print_with_color $GREEN 'installing git'
    brew install git
  fi

  check_and_link_file `pwd`/git/git_config $HOME/.gitconfig
  check_and_link_file `pwd`/git/git_ignore $HOME/.gitignore

  if ! [[ `brew list | grep bash-completion` ]]; then
    print_with_color $GREEN 'installing git bash-completion'
    brew install bash-completion
  fi
}

print_with_color $YELLOW 'Setup Git? (yes/no)'
read yn
case $yn in
  yes ) setup_git;;
  * ) print_with_color $GREEN 'skipping...';;
esac

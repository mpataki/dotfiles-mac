
function setup_git() {
  if ! [[ -e `brew --prefix`/bin/git ]]; then
    print_with_color $GREEN 'installing git'
    brew install git
  fi

  check_and_link_file `pwd`/git/git_config $HOME/.gitconfig
  check_and_link_file `pwd`/git/git_ignore $HOME/.gitignore

  __git_complete 'g co' _git_checkout
}

print_with_color $YELLOW 'Setup Git? (yes/no)'
read yn
case $yn in
  yes ) setup_git;;
  * ) print_with_color $GREEN 'skipping...';;
esac

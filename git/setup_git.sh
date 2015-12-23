
#################### GIT SETUP ####################
if ! [[ -e `brew --prefix`/bin/git ]]; then
  print_with_color $GREEN 'installing git'
  brew install git
fi

check_and_link_file `pwd`/git/git_config $HOME/.gitconfig
check_and_link_file `pwd`/git/git_ignore $HOME/.gitignore

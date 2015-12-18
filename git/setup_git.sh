
#################### GIT SETUP ####################
if ! [[ -e `brew --prefix`/bin/git ]]; then
  print_with_color $GREEN 'installing git'
  brew install git
fi

check_and_link_file git/git_config $HOME/.gitconfig
check_and_link_file git/git_ignore $HOME/.gitignore

if ! [ -e `brew --prefix`/etc/bash_completion ]; then
  print_with_color $GREEN "Git bash_completion not installed. Do you want to install it? (yes/no)"
  read yn
  case $yn in
    yes ) brew install git bash-completion;;
    * ) print_with_color $GREEN 'skipping...';;
  esac
fi

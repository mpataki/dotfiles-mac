
function write_bash_profile() {
  print_with_color $GREEN "writing $HOME/.bash_profile"
  echo ". `pwd`/bash/bash_config" > $HOME/.bash_profile
  . $HOME/.bash_profile
}

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

################## BASH PROFILE ##################
if [ -e $HOME/.bash_profile ]; then
  print_with_color $YELLOW "$HOME/.bash_profile already exists. Do you want to override it? (yes/no)"
  read yn
  case $yn in
    yes ) write_bash_profile;;
    * ) print_with_color $GREEN 'skipping...';;
  esac
else
  write_bash_profile
fi

############ WGET ############
if ! [[ -e `which wget` ]]; then
  print_with_color $YELLOW "Installing wget"
  brew install wget
fi

print_with_color $GREEN done.

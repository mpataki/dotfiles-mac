RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
WHITE="\e[37m"
NONE="\e[39m"

function print_with_color() {
  color=$1
  string=$2
  printf "$color$string$NONE\n"
}

function link_file() {
  source_file=$1
  destination=$2

  print_with_color $GREEN "linking $source_file to $destination"

  ln -s "$source_file" "$destination"
}

function check_and_link_file() {
  source_file=$1
  destination=$2

  if [[ -e $destination ]]; then
    print_with_color $YELLOW "$destination already exists. Do you want to override it? (yes/no)"
    read yn
    case $yn in
      yes )
        rm -r "$destination"
        link_file "$source_file" "$destination"
        ;;
      * ) print_with_color $GREEN 'skipping...';;
    esac
  else
    link_file "$source_file" "$destination"
  fi
}

function download_app() {
  app_file_name=$1
  brew_app_name=$2

  if [[ ! `ls /Applications/ | grep "$app_file_name"` ]] && [[ ! -e `ls $HOME/Applications/ | grep "$app_file_name"` ]]; then
    print_with_color $GREEN "$app_file_name is not installed. Downloading..."
    brew cask install $brew_app_name
  else
    print_with_color $YELLOW "$app_file_name already installed"
  fi
}

function homebrew_install() {
  app_name=$1
  pkg=$2
  
  if ! [[ `brew list | grep $app_name` ]]; then
    print_with_color $YELLOW "Installing $app_name"
    brew install $pkg
  fi
}


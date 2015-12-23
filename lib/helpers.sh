RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

function print_with_color() {
  color=$1
  string=$2
  printf "${color}$string${NC}\n"
}

function link_file() {
  source_file=$1
  destination=$2

  print_with_color $GREEN "linking $source_file to $destination"

  if [[ -d $source_file ]]; then
    ln -s "$source_file" "$destination"
  else
    ln "$source_file" "$destination"
  fi
}

function copy_file() {
  source_file=$1
  destination=$2

  print_with_color $GREEN "copying $source_file to $destination"
  cp -r "$source_file" "$destination"
}

function check_and_link_file() {
  source_file=$1
  destination=$2

  if [[ -e $destination ]] || [[ -L $destination ]]; then
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

function check_and_copy_file() {
  source_file=$1
  destination=$2

  if [[ -e $destination ]] || [[ -L $destination ]]; then
    print_with_color $YELLOW "$destination already exists. Do you want to override it? (yes/no)"
    read yn
    case $yn in
      yes )
        rm -r "$destination"
        copy_file "$source_file" "$destination"
        ;;
      * ) print_with_color $GREEN 'skipping...';;
    esac
  else
    copy_file "$source_file" "$destination"
  fi
}

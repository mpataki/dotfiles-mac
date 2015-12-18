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

  print_with_color $GREEN "linking $destination"
  ln "$source_file" "$destination"
}

function check_and_link_file() {
  source_file=$1
  destination=$2
  if [[ -e $destination ]]; then
    print_with_color $YELLOW "$destination already exists. Do you want to override it? (yes/no)"
    read yn
    case $yn in
      yes )
        rm "$destination"
        link_file "$source_file" "$destination"
        ;;
      * ) print_with_color $GREEN 'skipping...';;
    esac
  else
    link_file "$source_file" "$destination"
  fi
}

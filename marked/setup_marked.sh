
function setup_marked_2_cli() {
  cp marked/mark /usr/local/bin/
}

print_with_color $YELLOW 'Setup Marked 2 CLI tool? (yes/no)'
read yn
case $yn in
  yes ) setup_marked_2_cli;;
  * ) print_with_color $GREEN 'skipping...';;
esac

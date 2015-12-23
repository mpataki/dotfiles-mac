
function setup_iterm(){
  if ! [[ -e /Applications/iTerm.app ]]; then
    print_with_color $GREEN 'iTerm is not installed. Downloading...'
    brew install Caskroom/cask/iterm2
  fi
}

print_with_color $YELLOW 'Do you want to install iTerm? (yes/no)'
read yn
case $yn in
  yes ) setup_iterm;;
  * ) print_with_color $GREEN 'skipping...';;
esac

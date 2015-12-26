
function setup_iterm(){
  if ! [[ -e $HOME/Applications/iTerm.app ]] && ! [[ -e /Applications/iTerm.app ]]; then
    print_with_color $GREEN 'iTerm is not installed. Downloading...'
    brew install Caskroom/cask/iterm2
  fi

  check_and_link_file `pwd`/iterm/com.googlecode.iterm2.plist /Users/mat/Library/Preferences/com.googlecode.iterm2.plist
}

print_with_color $YELLOW 'Setup iTerm? (yes/no)'
read yn
case $yn in
  yes ) setup_iterm;;
  * ) print_with_color $GREEN 'skipping...';;
esac


function setup_atom(){
  if ! [[ -e /Applications/Atom.app ]] && ! [[ -e $HOME/Applications/Atom.app ]]; then
    print_with_color $GREEN 'Atom is not installed. Downloading...'
    brew cask install atom
  fi

  if ! [[ -e $HOME/.atom ]]; then
    mkdir $HOME/.atom
  fi

  check_and_link_file "`pwd`/atom/atom_config/config.cson" "$HOME"/.atom/
  check_and_link_file "`pwd`/atom/atom_config/init.coffee" "$HOME"/.atom/
  check_and_link_file "`pwd`/atom/atom_config/keymap.cson" "$HOME"/.atom/
}

print_with_color $YELLOW 'Setup Atom? (yes/no)'
read yn
case $yn in
  yes ) setup_atom;;
  * ) print_with_color $GREEN 'skipping...';;
esac

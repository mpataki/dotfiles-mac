
function setup_atom(){
  if ! [[ -e /Applications/Atom.app ]]; then
    print_with_color $GREEN 'Atom is not installed. Downloading...'
    wget https://github.com/atom/atom/releases/download/v1.3.2/atom-mac.zip ~/Downloads/

    print_with_color $GREEN "Openning the Atom installer. Please follow it's instructions."
    open ~/Downloads/atom-mac.zip

    print_with_color $GREEN "Press [ENTER] to continue."
    read
    print_with_color $YELLOW "You may want to try to update when you launch Atom."
  fi

  check_and_copy_file 'atom/atom_config' "$HOME/.atom"
}

print_with_color $YELLOW 'Do you want to install Atom? (yes/no)'
read yn
case $yn in
  yes ) setup_atom;;
  * ) print_with_color $GREEN 'skipping...';;
esac


function setup_macos_apps() {
  download_app 'Google Chrome' 'google-chrome'
  download_app 'Alfred' 'alfred'
  download_app 'Spectacle' 'spectacle'
}

print_with_color $YELLOW 'Setup macOS apps? (yes/no)'
read yn
case $yn in
  yes ) setup_macos_apps;;
  * ) print_with_color $GREEN 'skipping...';;
esac

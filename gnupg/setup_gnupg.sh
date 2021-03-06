
function setup_gnupg() {
  homebrew_install 'gnupg2' 'Caskroom/cask/gpgtools'
  homebrew_install 'pinentry-mac' 'pinentry-mac'
  homebrew_install 'pass' 'pass'

  if ! [ -d $HOME/.gnupg ]; then
    mkdir $HOME/.gnupg
  fi

  check_and_link_file `pwd`/gnupg/gpg.conf $HOME/.gnupg/gpg.conf
  check_and_link_file `pwd`/gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
}

print_with_color $YELLOW 'Setup pass/GnuPG? (yes/no)'
read yn
case $yn in
  yes ) setup_gnupg;;
  * ) print_with_color $GREEN 'skipping...';;
esac


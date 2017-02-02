
function setup_gnupg() {
  if ! [ -d $HOME/.gnupg ]; then
    mkdir $HOME/.gnupg
  fi

  check_and_link_file `pwd`/gnupg/gpg_config $HOME/.gnupg/gpg.conf
  check_and_link_file `pwd`/gnupg/gpg-agent_config $HOME/.gnupg/gpg-agent.conf
}

print_with_color $YELLOW 'Setup GnuPG? (yes/no)'
read yn
case $yn in
  yes ) setup_gnupg;;
  * ) print_with_color $GREEN 'skipping...';;
esac


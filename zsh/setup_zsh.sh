function setup_zsh(){
  homebrew_install 'zsh' 'zsh'
  homebrew_install 'zsh-completions' 'zsh-completions'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  check_and_link_file `pwd`/zsh/zshrc $HOME/.zshrc

  # hub completions
  mkdir -p ~/.zsh/completions
  cp /usr/local/share/zsh/site-functions/_hub ~/.zsh/completions/_hub

  print_with_color $YELLOW 'Do you want to set zsh as the default shell? (yes/no)'
  read yn
  case $yn in
    yes ) sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh;;
    * ) print_with_color $GREEN 'skipping...';;
  esac
}

print_with_color $YELLOW 'Setup zsh? (yes/no)'
read yn
case $yn in
  yes ) setup_zsh;;
  * ) print_with_color $GREEN 'skipping...';;
esac

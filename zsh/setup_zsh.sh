function write_zshrc() {
  print_with_color $GREEN "writing $HOME/.zshrc"

  echo ". `pwd`/zsh/zshrc" > $HOME/.zshrc
}

function setup_zsh(){
  homebrew_install 'zsh' 'zsh'
  homebrew_install 'zsh-completions' 'zsh-completions'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # hub completions
  mkdir -p ~/.zsh/completions
  cp /usr/local/share/zsh/site-functions/_hub ~/.zsh/completions/_hub

  git_clone 'https://github.com/geometry-zsh/geometry.git' "$HOME/.oh-my-zsh/custom/themes/geometry"

  if [ -e $HOME/.zshrc ]; then
    print_with_color $YELLOW "$HOME/.zshrc already exists. Do you want to override it? (yes/no)"
    read yn
    case $yn in
      yes ) write_zshrc;;
      * ) print_with_color $GREEN 'skipping...';;
    esac
  else
    write_zshrc
  fi

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

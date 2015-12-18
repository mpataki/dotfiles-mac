
function sublime_path() {
  local sublime=$1
  echo "$HOME/Library/Application Support/$sublime"
}

function sublime_pref_path() {
  local sublime=$1
  echo "$(sublime_path "$sublime")/Packages/User/Preferences.sublime-settings"
}

function sublime_key_binding_path() {
  local sublime=$1
  echo "$(sublime_path "$sublime")/Packages/User/Default (OSX).sublime-keymap"
}

function sublime_package_control_path() {
 local sublime=$1
  echo "$(sublime_path "$sublime")/Installed Packages/Package Control.sublime-package"
}

function sublime_packages_path() {
  local sublime=$1
  echo "$(sublime_path "$sublime")/Packages"
}

function check_and_link_sublime() {
  local st=$1
  if [[ -d $(sublime_path "$st") ]]; then
    check_and_link_file 'sublime/Preferences.sublime-settings' "$(sublime_pref_path "$st")"
    check_and_link_file 'sublime/key_bindings.json' "$(sublime_key_binding_path "$st")"
  fi
}

############## PACKAGE CONTROL ##############
function install_sublime_package_control() {
  local st=$1

  if ! [ -e "$(sublime_package_control_path "$st")" ]; then
    print_with_color $GREEN 'Installing Package Control'
    wget https://packagecontrol.io/Package%20Control.sublime-package -O "$(sublime_package_control_path "$st")".
  fi
}

############## CTAGS ##############
function install_ctags(){
  st=$1
  ctags_path=$(sublime_packages_path "$st")/CTags

  if ! [ -e `brew --prefix`/bin/ctags ]; then
    print_with_color $GREEN 'installing ctags'
    brew install ctags
  fi

  if ! [[ -d $ctags_path ]]; then
    print_with_color $GREEN 'installing sublime ctags'
    git clone https://github.com/SublimeText/CTags "$ctags_path"
  fi

  check_and_link_file sublime/CTags.sublime-settings "$(sublime_packages_path "$st")/CTags.sublime-settings"
}

############## GIT GUTTER ##############
function install_git_gutter(){
  st=$1
  git_gutter_path=$(sublime_packages_path "$st")/GitGutter

  if ! [[ -e $git_gutter_path ]]; then
    print_with_color $GREEN 'installing GitGutter'
    git clone git://github.com/jisaacks/GitGutter.git "$git_gutter_path"
  fi
}

function install_sublime_packages() {
  local st=$1
  if [[ -d $(sublime_path "$st") ]]; then
    install_sublime_package_control "$st"
    install_ctags "$st"
    install_git_gutter "$st"
  fi
}

############ SUBLIME SETUP ############
check_and_link_sublime 'Sublime Text'
check_and_link_sublime 'Sublime Text 2'
check_and_link_sublime 'Sublime Text 3'

print_with_color $YELLOW 'Do you want to install Sublime Packages? (yes/no)'
read yn
case $yn in
  yes )
    install_sublime_packages 'Sublime Text'
    install_sublime_packages 'Sublime Text 2'
    install_sublime_packages 'Sublime Text 3'
    ;;
  * ) print_with_color $GREEN 'skipping...'
esac

#!/bin/sh

asksure() {
echo "(Y/N)? \c"
while read -r -n 1 -s answer; do
  if [[ $answer = [YyNn] ]]; then
    [[ $answer = [Yy] ]] && retval=0
    [[ $answer = [Nn] ]] && retval=1
    break
  fi
done

echo # just a final linefeed, optics...

return $retval
}


echo "Setting up your Mac..."
echo

echo "Have you installed Xcode? \c"
if asksure; then
  echo "Setup Xcode? \c"
  if asksure; then
    sudo xcodebuild -license
    xcode-select --install
  fi
else
  echo "Please install Xcode from the App Store."
  exit
fi


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Install Homebrew? \c"
  if asksure; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

echo "Update Homebrew? \c"
if asksure; then
  brew update
  brew doctor
fi

echo "Install applications? \c"
if asksure; then
  brew bundle
fi


echo "Configure Git? \c"
if asksure; then
  git config --global user.name "Ian Liew"
  git config --global user.email "ian@ianliew.com"
  git config --global core.excludesfile $$HOME/.dotfiles/.gitignore_global
fi


echo "Create Kitchen and Vault directory? \c"
if asksure; then
  mkdir $HOME/Kitchen
  mkdir $HOME/Vault
fi


echo "Update dotfiles? \c"
if asksure; then
  # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
  rm -rf $HOME/.zshrc
  ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
fi


echo "Set macOS preferences? \c"
if asksure; then
  source .macos
fi

echo
echo "DONE..."
echo

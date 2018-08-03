#!/bin/bash

echo "~ Hello, world! ~"
echo "Lets get your dotfiles configured on OSX"
# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Hrm. Looks like we'll be copying my dotfiles to $DOTFILES_DIR!"
echo ""
echo "First, let's get your git configured..."
ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
echo "Awesome! Next up, Visual Studio Code"
# TODO - this needs sudo?
./config/visual-studio-code/vsc-install.sh
echo "And you're good to code!"
echo ""
echo "Okay, that looks like all of it! Have a nice day ~ ! <3"
#!/bin/bash

bot "~ Hello, world! ~"
bot "Lets get your dotfiles configured on OSX"
# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bot "Hrm. Looks like we'll be copying my dotfiles to $DOTFILES_DIR!"
bot ""
bot "First, let's get your git configured..."
ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
bot "Awesome! Next up, Visual Studio Code"
./config/visual-studio-code/vsc-install.sh
bot "And you're good to code!"
bot ""
bot "Okay, that looks like all of it! Have a nice day ~ ! <3"
#!/usr/bin/env bash
# source ../../lib.sh

echo "Installing Visual Studio Code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        echo "Installing extensions please wait..."    
            
        # Extensions
        code --install-extension formulahendry.auto-close-tag
        code --install-extension formulahendry.auto-rename-tag
        code --install-extension coenraads.bracket-pair-colorizer
        code --install-extension anseki.vscode-color
        code --install-extension editorconfig.editorconfig
        code --install-extension waderyan.gitblame
        code --install-extension wix.vscode-import-cost
        #code --install-extension twentychung.jsx
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension christian-kohler.path-intellisense
        code --install-extension sandcastle.whitespace

        # Language & File Syntax Support
        code --install-extension peterjausovec.vscode-docker
        code --install-extension mikestead.dotenv
        code --install-extension radium-v.better-less
        code --install-extension qassimfarid.ejs-language-support
        code --install-extension bungcip.better-toml
        code --install-extension dzannotti.vscode-babel-coloring
        code --install-extension grapecity.gc-excelviewer
        code --install-extension flowtype.flow-for-vscode
        code --install-extension codezombiech.gitignore
        code --install-extension stpn.vscode-graphql
        code --install-extension ecmel.vscode-html-css
        code --install-extension ginfuru.ginfuru-vscode-jekyll-syntax
        code --install-extension eg2.vscode-npm-script
        code --install-extension ibm.output-colorizer
        code --install-extension rebornix.ruby
        code --install-extension robinbentley.sass-indented
        code --install-extension octref.vetur

        # Themes
        code --install-extension daylerees.rainglow
        code --install-extension nopjmp.fairyfloss

        echo "Extensions for VSC have been installed. Please restart your VSC."
    else
        echo "Skipping extension install.";
    fi

    read -r -p "Do you want to overwrite user config? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        read -r -p "Do you want to back up your current user config? [Y|n] " backupresponse
        if [[ $backupresponse =~ ^(n|no|N) ]];then
            echo "Skipping user config save."
        else
            cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.backup.json
            echo "Your previous config has been saved to: $HOME/Library/Application Support/Code/User/settings.backup.json"
        fi
        cp ./settings.json $HOME/Library/Application\ Support/Code/User/settings.json

        echo "New user config has been written. Please restart your VSC."
    else
        echo "Skipping user config overwriting.";
    fi
else
    error "It looks like the command 'code' isn't accessible."
    error "Please make sure you have Visual Studio Code installed"
    error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi
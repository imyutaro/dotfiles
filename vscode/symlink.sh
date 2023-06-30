#!/bin/sh
for dotfile in .?*
do
    ln -Fis "$PWD/keybindings.json" "$HOME/Library/Application Support/Code/User"
    ln -Fis "$PWD/settings.json" "$HOME/Library/Application Support/Code/User"
    ln -Fis "$PWD/language-configuration.json" "$HOME/Library/Application Support/Code/User"
done

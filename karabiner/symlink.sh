#!/bin/sh
for dotfile in .?*
do
    ln -Fis "$PWD/mine.json" "$HOME/.config/karabiner/assets/complex_modifications/"
done

#!/bin/bash

cd files/

configs=(.tmux.conf .zshrc .config/alacritty/alacritty.yml .config/nvim/init.vim .config/fish/config.fish)

for config in ${configs[@]}; do
    cp -r "$HOME/$config" "$HOME/${config}.old"
    cp -r "$PWD/$config" "$HOME/$config"
    echo "Backed up and installed ${config} to $HOME/$config successfully"
done

echo "Done!"

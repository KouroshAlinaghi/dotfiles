#!/bin/bash

configs=(.tmux.conf .zshrc .config/alacritty/alacritty.yml .config/nvim/init.vim .config/fish/config.fish)

for config in ${configs[@]}; do
    mv "$HOME/$config.old" "$HOME/${config}"
    echo "Restored $HOME/${config} successfully"
done

echo "Done!"

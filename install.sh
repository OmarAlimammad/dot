#!/bin/bash

packages=(
  nvim npm unzip
  zsh zoxide eza starship
  tmux fzf
  bazaar firefox thunar
  swaync swaybg
  waybar
  rofi
  hypremoji hyprshot
  stow
  spotify-adblock
  nwg-look rose-pine-gtk-theme
  ttf-jetbrains-mono-nerd lexend-deca-git
)

folders=(
  kitty nvim rofi tmux waybar zsh hypr
)

yay -Syu --noconfirm "${packages[@]}"

for folder in "${folders[@]}"; do
  stow -R "$folder"
done

chsh -s $(which zsh)

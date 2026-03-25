#!/bin/bash

packages=(
  nvim npm unzip
  zsh zoxide eza starship
  tmux fzf yazi 7zip
  swww
  waybar rofi
  hypremoji hyprshot
  hyprlock hypridle
  wlogout
  stow
  spotify-adblock
  nwg-look rose-pine-gtk-theme rose-pine-cursor
  ttf-jetbrains-mono-nerd lexend-deca-git
)

folders=(
  mako wlogout kitty nvim rofi tmux waybar zsh hypr yazi
)

cd paru
makepkg -si

cd ..

paru -Syu --noconfirm "${packages[@]}"

for folder in "${folders[@]}"; do
  stow "$folder"
done

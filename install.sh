#!/bin/bash

packages=(
  nvim npm unzip
  zsh zoxide eza starship
  tmux fzf yazi 7zip
  bazaar firefox
  swaync swww
  waybar rofi
  hypremoji hyprshot
  stow
  spotify-adblock
  nwg-look rose-pine-gtk-theme
  ttf-jetbrains-mono-nerd lexend-deca-git
)

folders=(
  kitty nvim rofi tmux waybar zsh hypr yazi
)

cd paru
makepkg -si

cd ..

paru -Syu --noconfirm "${packages[@]}"

for folder in "${folders[@]}"; do
  stow -R "$folder"
done

chsh -s $(which zsh)

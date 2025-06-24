#!/bin/bash
current_running_path=$(pwd)
pwd
if echo "$current_running_path" | grep -q "nvim-conf"; then
  echo "Start installation"
else
  echo "Not in nvim-conf folder!"
  echo "Make sure you only run this script inside nvim-conf folder"
  echo "Ending installation"
  exit
fi

read -p 'Backup current config? [y/n] ' opt
if [ "$opt" = "y" ]; then
    mv ~/.config/nvim ~/.config/nvim.${whoami}
    mv ~/.local/share/nvim ~/.local/share/nvim.${whoami}
    echo "Backup complete"
else
    echo "Skip backup"
fi

read -p 'Install config? [y/n] ' opt
if [ "$opt" = "y" ]; then
    mkdir -p ~/.config/nvim
    mv init.lua ~/.config/nvim
    mv lua ~/.config/nvim
fi

echo "newor nvim config installation script"

config_exist = false

if [ -n "$(ls -A XDG_CONFIG_HOME/nvim 2>/dev/null)" ]
then
    config_exist = true
fi

if [ config_exist ]
then
    echo "Would you like to backup your current neovim config? (y (default)/n) "
    read option
fi

if [ "$option" = "" || "$option" = "y"]
then
    echo "Backing up config..."
    mv ~/.config/nvim ~/.config/nvim.$(whoami)
    echo "Backup complete"
fi

echo "removing nvim folder"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

echo "Copying new config"
mkdir ~/.config/nvim
cp -r * ~/.config/nvim

echo "New config copied"

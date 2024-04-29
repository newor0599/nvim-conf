clear
echo "newor nvim config installation script \n"

if grep -q "nvim-conf" <<< $(pwd)
then
    echo "Starting script"
else
    echo "Invalid path (Make sure you are in the cloned folder)"
    exit
fi

config_exist=false

if [ -n "$(ls -A XDG_CONFIG_HOME/nvim 2>/dev/null)" ]
then
    config_exist = true
fi

if [ config_exist ]
then
    echo "Would you like to backup your current neovim config? [y (default)/n] "
    read option
fi

if [ "$option" = "" ] || [ "$option" = "y" ]
then
    echo "Backing up config..."
    mv ~/.config/nvim ~/.config/nvim.$(whoami)
    echo "Backup complete"
else
    echo "Skip backup procedure"
fi

echo "Removing neovim config folder"
rm -rf ~/.config/nvim/*

echo "Removing neovim share folder"
rm -rf ~/.local/share/nvim

echo "|Copying new config"
echo "|_init.lua"
cp -r init.lua ~/.config/nvim

echo "|_lua folder"
cp -r lua ~/.config/nvim

echo "New config copied"

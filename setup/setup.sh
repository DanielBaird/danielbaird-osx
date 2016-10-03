
# check for existing ~/.bash-profile
if [ -f ~/.bash_profile ]; then
    echo "You already have a .bash_profile!"
    read -p "Remove existing .bash_profile (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile && echo "Removed"
    fi
fi
ln -s ~/.config/danielbaird-osx/bin/bash-profile.sh ~/.bash_profile && echo "Successfully linked new .bash_profile"

# check for existing ~/.ssh/config
if [ -f ~/.ssh/config ]; then
    echo "You already have a .ssh/config !"
    read -p "Remove existing .ssh/config (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.ssh/config && echo "Removed"
    fi
fi
ln -s ~/.config/danielbaird-osx/ssh/config ~/.ssh/config && echo "Successfully linked new .ssh/config"

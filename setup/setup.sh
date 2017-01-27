source ~/.config/danielbaird-osx/bin/bash-color-vars.sh
CHECK="${GREEN}✓${RESTORE}"

# check for existing ~/.bash-profile
if [ -e ~/.bash_profile ]; then
    read -p "Remove existing .bash_profile (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile
    fi
fi
ln -s ~/.config/danielbaird-osx/bin/bash-profile.sh ~/.bash_profile && echo "$CHECK linked new .bash_profile"

# check for existing ~/.ssh/config
if [ -e ~/.ssh/config ]; then
    read -p "Remove existing .ssh/config (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.ssh/config
    fi
fi
ln -s ~/.config/danielbaird-osx/ssh/config ~/.ssh/config && echo "$CHECK linked new .ssh/config"

pushd ~/.config/danielbaird-osx/config-dir > /dev/null
for CFGDIR in *; do
    if [ -e "$HOME/.config/$CFGDIR" ]; then
        read -p "Remove existing .config/$CFGDIR (y/n)? " -n 1 -r
        echo    # move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            rm "$HOME/.config/$CFGDIR"
        fi
    fi
    ln -s "$HOME/.config/danielbaird-osx/config-dir/$CFGDIR" "$HOME/.config/$CFGDIR" && echo "$CHECK linked new $CFGDIR config"
done
popd > /dev/null

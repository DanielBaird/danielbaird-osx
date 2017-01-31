source ~/.config/danielbaird-osx/bin/bash-color-vars.sh
CHECK="${GREEN}✓${RESTORE}"

# link in ~/.bash-profile -----------------------------------------------------
if [ -e ~/.bash_profile ]; then
    read -p "Remove existing .bash_profile (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile
    fi
fi
ln -s ~/.config/danielbaird-osx/bin/bash-profile.sh ~/.bash_profile && echo "$CHECK link new .bash_profile"

# link in ~/.ssh/config -------------------------------------------------------
if [ -e ~/.ssh/config ]; then
    read -p "Remove existing .ssh/config (y/n)? " -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.ssh/config
    fi
fi
ln -s ~/.config/danielbaird-osx/ssh/config ~/.ssh/config && echo "$CHECK link new .ssh/config"

# link in all the .config directories -----------------------------------------
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
    ln -s "$HOME/.config/danielbaird-osx/config-dir/$CFGDIR" "$HOME/.config/$CFGDIR" && echo "$CHECK link new $CFGDIR config"
done
popd > /dev/null

# run all the scripts in setup/scripts ----------------------------------------
pushd ~/.config/danielbaird-osx/setup/scripts > /dev/null
for SCRIPT in *.sh; do
    if [ -f $SCRIPT -a -x $SCRIPT ]; then
        echo -n ${LBLUE}
        "$HOME/.config/danielbaird-osx/setup/scripts/$SCRIPT"
        echo "${RESET}"
        echo "$CHECK ${SCRIPT//-/ }" | sed 's/\.sh$//'
    fi
done
popd > /dev/null

source ~/.config/danielbaird-osx/bin/bash-color-vars.sh

PREFIX="${BLUE}◈◈◈◈◈ setup ◈◈◈◈◈  "
function declare {
    # tell the user something
    echo "${PREFIX} ${YELLOW}$1${RESTORE}"
}
function demand {
  # ask the user for a y/n to progress
    read -p "${PREFIX} ${YELLOW}►  $1${RESTORE}" -n 1 -r
}
function reassure {
    # tell the user something, with a tick at the start
    echo "${PREFIX} ${YELLOW}${GREEN}✓${YELLOW}  $1${RESTORE}"
    echo
}
function commandexists {
    # check if there is a command already
    command -v "$1" >/dev/null 2>&1
}
# link in ~/.bash-profile -----------------------------------------------------
if [ -e ~/.bash_profile ]; then
    demand "QUESTION 1 OF 5 :: Remove existing .bash_profile (y/n)? "
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile
    fi
fi
ln -s ~/.config/danielbaird-osx/bin/bash-profile.sh ~/.bash_profile && reassure "linked new .bash_profile"

# link in ~/.ssh/config -------------------------------------------------------
if [ -e ~/.ssh/config ]; then
    demand "QUESTION 2 OF 5 :: Remove existing .ssh/config (y/n)? "
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.ssh/config
    fi
fi
ln -s ~/.config/danielbaird-osx/ssh/config ~/.ssh/config && reassure "linked new .ssh/config"

# link in all the .config directories -----------------------------------------
pushd ~/.config/danielbaird-osx/config-dir > /dev/null
for CFGDIR in *; do
    if [ -e "$HOME/.config/$CFGDIR" ]; then
        demand "    QUESTION 2.?? :: Remove existing .config/$CFGDIR (y/n)? "
        echo    # move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            rm "$HOME/.config/$CFGDIR"
        fi
    fi
    ln -s "$HOME/.config/danielbaird-osx/config-dir/$CFGDIR" "$HOME/.config/$CFGDIR" && reassure "linked new $CFGDIR config"
done
popd > /dev/null

# install homebrew ------------------------------------------------------------
if commandexists brew; then
    declare "updating homebrew, this may take several minutes"
    brew update
    reassure "updated homebrew"
else
    if commandexists gcc; then
        reassure "Xcode commandline tools already installed"
    else
        declare "Installing the Xcode command line tools requies some GUI interaction."
        declare "Click 'Install' on the forthcoming alert box."
        declare "If you see '...already installed' then you're fine."
        xcode-select --install
        reassure "install Xcode commandline tools"
    fi
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    reassure "installed homebrew"
fi

# run all the scripts in setup/scripts ----------------------------------------
demand "QUESTION 3 OF 5 :: Run additional setup scripts (y/n)? "
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pushd ~/.config/danielbaird-osx/setup/scripts > /dev/null
    for SCRIPT in *.sh; do
        if [ -f $SCRIPT -a -x $SCRIPT ]; then
            "$HOME/.config/danielbaird-osx/setup/scripts/$SCRIPT"
            echo
            reassure "`echo \"${SCRIPT//-/ }\" | sed 's/\.sh$//'`"
        fi
    done
    popd > /dev/null
fi

# run all the scripts in setup/cmdline-installers -----------------------------
demand "QUESTION 4 OF 5 :: Install command line applications (y/n)? "
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pushd ~/.config/danielbaird-osx/setup/cmdline-installers > /dev/null
    for INSTALLER in *.sh; do
        if [ -f $INSTALLER -a -x $INSTALLER ]; then
            "$HOME/.config/danielbaird-osx/setup/cmdline-installers/$INSTALLER"
            echo
            reassure "`echo \"${INSTALLER//-/ }\" | sed 's/\.sh$//'`"
        fi
    done
    popd > /dev/null
fi

# run all the install scripts in setup/gui-installers --------------------------
demand "QUESTION 5 OF 5 :: Install graphical applications (y/n)? "
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    pushd ~/.config/danielbaird-osx/setup/gui-installers > /dev/null
    for INSTALLER in *.sh; do
        if [ -f $INSTALLER -a -x $INSTALLER ]; then
            "$HOME/.config/danielbaird-osx/setup/gui-installers/$INSTALLER"
            echo
            reassure "`echo \"${INSTALLER//-/ }\" | sed 's/\.sh$//'`"
        fi
    done
    popd > /dev/null
fi




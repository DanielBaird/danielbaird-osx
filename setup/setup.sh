source ~/.config/danielbaird-osx/bin/bash-color-vars.sh

function declare {
  echo "${BLUE}◈◈◈setup◈◈◈  ${YELLOW}$1${RESTORE}"
}
function demand {
  read -p "${BLUE}◈◈◈setup◈◈◈  ${YELLOW}► $1${RESTORE}" -n 1 -r
}
function reassure {
  echo "${BLUE}◈◈◈setup◈◈◈  ${YELLOW}${GREEN}✓${YELLOW} $1${RESTORE}"
  echo
}

# link in ~/.bash-profile -----------------------------------------------------
if [ -e ~/.bash_profile ]; then
    demand "Remove existing .bash_profile (y/n)? "
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile
    fi
fi
ln -s ~/.config/danielbaird-osx/bin/bash-profile.sh ~/.bash_profile && reassure "link new .bash_profile"

# link in ~/.ssh/config -------------------------------------------------------
if [ -e ~/.ssh/config ]; then
    demand "Remove existing .ssh/config (y/n)? "
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.ssh/config
    fi
fi
ln -s ~/.config/danielbaird-osx/ssh/config ~/.ssh/config && reassure "link new .ssh/config"

# link in all the .config directories -----------------------------------------
pushd ~/.config/danielbaird-osx/config-dir > /dev/null
for CFGDIR in *; do
    if [ -e "$HOME/.config/$CFGDIR" ]; then
        demand "Remove existing .config/$CFGDIR (y/n)? "
        echo    # move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            rm "$HOME/.config/$CFGDIR"
        fi
    fi
    ln -s "$HOME/.config/danielbaird-osx/config-dir/$CFGDIR" "$HOME/.config/$CFGDIR" && reassure "link new $CFGDIR config"
done
popd > /dev/null

# install homebrew ------------------------------------------------------------
declare "Installing the Xcode command line tools requies some GUI interaction."
declare "Click 'Install' on the forthcoming alert box."
declare "If you see '...already installed' then you're fine."
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
reassure "install homebrew"

# run all the scripts in setup/scripts ----------------------------------------
pushd ~/.config/danielbaird-osx/setup/scripts > /dev/null
for SCRIPT in *.sh; do
    if [ -f $SCRIPT -a -x $SCRIPT ]; then
        "$HOME/.config/danielbaird-osx/setup/scripts/$SCRIPT"
        echo
        reassure "${SCRIPT//-/ }" | sed 's/\.sh$//'
    fi
done
popd > /dev/null


source ~/.config/danielbaird-osx/bin/homebrew-tools.sh # adds the cask-ensure-installed function
source ~/.config/danielbaird-osx/bin/macos-tools.sh # this adds the add-to-dock function

cask-ensure-installed google-chrome
add-to-dock /Applications/Google\ Chrome.app

cask-ensure-installed firefox
add-to-dock /Applications/Firefox.app


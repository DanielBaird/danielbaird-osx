
source ~/.config/danielbaird-osx/bin/homebrew-tools.sh # adds the cask-ensure-installed function
source ~/.config/danielbaird-osx/bin/macos-tools.sh # this adds the add-to-dock function


cask-ensure-installed keepingyouawake
open /Applications/KeepingYouAwake.app

cask-ensure-installed itsycal
open /Applications/Itsycal.app

# cask-ensure-installed 1password

cask-ensure-installed spotify
add-to-dock /Applications/Spotify.app

cask-ensure-installed vlc

cask-ensure-installed slack
add-to-dock /Applications/Slack.app

cask-ensure-installed skype
add-to-dock /Applications/Skype.app

cask-ensure-installed spectacle
open /Applications/Spectacle
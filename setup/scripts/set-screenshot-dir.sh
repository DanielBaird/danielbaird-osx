#
# Create a directory for macOS to save screenshots into
#

# make the dir
mkdir ~/Screenshots

# add the dir to the Favourites list in Finder
/usr/bin/sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$USER/Screenshots

# tell macOS to use that dir for screenshots
defaults write com.apple.screencapture location ~/Screenshots

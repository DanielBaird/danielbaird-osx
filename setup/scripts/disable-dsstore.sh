#
# Switch off creation of DS_Store files where possible
#
# tell macOS no DSStore on USB drives
# 
# There's disagreement over using '-bool true' (which sets 
# a boolean) vs just 'true', which sets a string:
# https://github.com/mathiasbynens/dotfiles/issues/635
# In my testing on macOS 10.12.4, the string one doesn't 
# work, while the boolean one does work.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# tell macOS no DSStore on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


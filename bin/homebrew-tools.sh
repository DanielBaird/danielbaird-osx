# Given an arg, check if it has been brew cask istall-ed yet.
# If not, brew-cask-install it.

function cask-ensure-installed {
  if [[ `brew cask list` != *"$1"* ]]; then
    brew cask install $1
  fi
}

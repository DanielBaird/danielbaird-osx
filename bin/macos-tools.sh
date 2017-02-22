# Given an app (with path, e.g. "/Applications/Google Chrome.app", add that app to the macOS Dock.

function add-to-dock {
	defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
	killall Dock
}

#!/bin/bash

dock_item() {
  echo "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

dockChange() {
  defaults delete com.apple.dock persistent-apps
  defaults write com.apple.dock persistent-apps -array \
      "$(dock_item /System/Applications/Finder.app)" \
      "$(dock_item /System/Applications/Calendar.app)" \
      "$(dock_item /Applications/Firefox.app)" \
      "$(dock_item /Applications/"Google Chrome".app)" \
      "$(dock_item /Applications/"Microsoft Word".app)" \
      "$(dock_item /Applications/"Microsoft PowerPoint".app)" \
      "$(dock_item /Applications/"Adobe Illustrator".app)" \
      "$(dock_item /Applications/"Adobe InDesign".app)" \
      "$(dock_item /Applications/"Adobe Photoshop".app)" \
      "$(dock_item /System/Applications/Utilities/Terminal.app)" \
      "$(dock_item /Applications/Audacity.app)"
  # Add Downloads folder to the dock
  defaults write com.apple.dock persistent-others -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:///Users/$USER/Downloads/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>'
  # Add Trash to the dock
  defaults write com.apple.dock trash-full -bool false
  killall Dock
}

# Call the dockChange function to apply the changes
dockChange

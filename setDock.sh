#!/bin/bash

# Set the dock items
dockItems=(
    "file:///System/Applications/Calendar.app"
    "file:///Applications/Firefox.app"
    "file:///Applications/Google Chrome.app"
    "file:///Applications/Microsoft Word.app"
    "file:///Applications/Microsoft PowerPoint.app"
    "file:///Applications/Adobe Illustrator 2023.app"
    "file:///Applications/Adobe InDesign 2023.app"
    "file:///Applications/Adobe Photoshop 2023.app"
    "file:///System/Applications/Utilities/Terminal.app"
    "file:///Applications/Audacity.app"
)

# Remove all existing dock items
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

# Add the new dock items
for item in "${dockItems[@]}"; do
    defaults write com.apple.dock persistent-others -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$item</string><key>_CFURLStringType</key><integer>15</integer></dict></dict></dict>"
done

# Restart the dock
killall Dock

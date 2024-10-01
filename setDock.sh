#!/bin/bash

# Get the currently logged-in user
loggedInUser=$(stat -f "%Su" /dev/console)

# Set the dock items
dockItems=(
    "file:///System/Applications/Calendar.app"
    "file:///Applications/Firefox.app"
    "file:///Applications/Google Chrome.app"
    "file:///Applications/Microsoft Word.app"
    "file:///Applications/Microsoft PowerPoint.app"
    "file:///Applications/Adobe Illustrator 2024/Adobe Illustrator.app"
    "file:///Applications/Adobe InDesign 2024/Adobe InDesign 2024.app"
    "file:///Applications/Adobe Photoshop 2024/Adobe Photoshop 2024.app"
    "file:///System/Applications/Utilities/Terminal.app"
    "file:///Applications/Audacity.app"
)

# Remove existing Dock items
sudo -u "$loggedInUser" defaults delete com.apple.dock persistent-apps 2>/dev/null
sudo -u "$loggedInUser" defaults delete com.apple.dock persistent-others 2>/dev/null

# Add the new dock items
for item in "${dockItems[@]}"; do
    sudo -u "$loggedInUser" defaults write com.apple.dock persistent-apps -array-add \
    "<dict>
        <key>tile-data</key>
        <dict>
            <key>file-data</key>
            <dict>
                <key>_CFURLString</key>
                <string>$item</string>
                <key>_CFURLStringType</key>
                <integer>15</integer>
            </dict>
        </dict>
        <key>tile-type</key>
        <string>file-tile</string>
    </dict>"
done

# Restart the Dock
sudo -u "$loggedInUser" killall Dock

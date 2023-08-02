#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dockutil using Homebrew
brew install dockutil

# Remove all existing dock items
defaults write com.apple.dock persistent-apps -array

# Add the specified applications to the dock
dockutil --add /Applications/Finder.app
dockutil --add /Applications/Calendar.app
dockutil --add /Applications/Firefox.app
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/Microsoft Word.app"
dockutil --add "/Applications/Microsoft PowerPoint.app"
dockutil --add "/Applications/Adobe Illustrator.app"
dockutil --add "/Applications/Adobe InDesign.app"
dockutil --add "/Applications/Adobe Photoshop.app"
dockutil --add /Applications/Utilities/Terminal.app
dockutil --add "$HOME/Downloads" --view grid --display stack
dockutil --add /System/Library/CoreServices/Dock.app/Contents/Resources/trashempty.png --view list --display stack

# Restart the dock to apply changes
killall Dock

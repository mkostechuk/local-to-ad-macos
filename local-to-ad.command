#!/bin/bash

#set usernames here
OLD_USERNAME=olduser
NEW_USERNAME=newuser

#few visual checks before we begin
dscl . -list /Users NFSHomeDirectory | grep "Users"
dscl . -read /Users/$OLD_USERNAME/ UserShell

#swapping home folder
sudo mkdir /Users/old
sudo dscl . -change /Users/$OLD_USERNAME NFSHomeDirectory /Users/$OLD_USERNAME /Users/old
sudo dscl . -change /Users/$NEW_USERNAME NFSHomeDirectory /Users/$NEW_USERNAME /Users/$OLD_USERNAME

#change owner of the home folder and reset ACLs
sudo chown -R $NEW_USERNAME:LAZADA\\Domain\ Users /Users/$OLD_USERNAME
#change owner of the /usr/local/ folder contents (used for brew)
sudo chown -R $NEW_USERNAME:LAZADA\\Domain\ Users /usr/local/*

#change owner of the apps
find /Applications -type d -user $OLD_USERNAME -d 1 -exec sudo chown -R $NEW_USERNAME:LAZADA\\Domain\ Users {} \;

#!/bin/bash

OLD_USERNAME=looseruser
NEW_USERNAME=winerlooser

sudo rm -rf /Users/$NEW_USERNAME/*
shopt -s dotglob
sudo mv /Users/$OLD_USERNAME/* /Users/$NEW_USERNAME/

#!/bin/bash

OLD_USERNAME=userlooser
NEW_USERNAME=qwe

declare -a dirs=()
while IFS=‘’ read -r -d ‘’; do
    args+=( “$REPLY” )
done <rsync.excludes

rm -rf /Users/$NEW_USERNAME/*
rsync -r --exclude-from=rsync.excludes -q /Users/$OLD_USERNAME/ /Users/$NEW_USERNAME
cd /Users/$OLD_USERNAME/
mv “${dirs[@]}” /Users/$NEW_USERNAME/
mkdir “${dirs[@]}”

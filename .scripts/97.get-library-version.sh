#! /bin/sh

VERSION_SPM=$(grep "^let libraryVersion" Package.swift | sed -E "s/let libraryVersion.*\"(.*)\"/\1/g")
VERSION_POD=$(grep "^libraryVersion" *.podspec | sed -E "s/libraryVersion.*\"(.*)\"/\1/g")

if [ "$VERSION_SPM" == "$VERSION_POD" ]; then
	exit 0
fi

echo "Library version in SPM and Podspec differs!"
exit 1
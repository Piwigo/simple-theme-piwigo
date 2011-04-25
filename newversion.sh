#!/bin/sh
# -*- coding: utf-8 -*-

if [ $# -eq 0 ]; then
    echo "Usage: $0 version"
    exit 1
fi

version="$1"

sed -i "s/Version: .*/Version: $version/" themeconf.inc.php
git ci -m "new version $version" themeconf.inc.php

echo "New tag for version $version"
git tag $version

echo "Pushing to github"
git push
git push --tags

git archive --format=zip --prefix=simple/ HEAD > ../simple-$version.zip
echo "zip archive available: ../simple-$version.zip"

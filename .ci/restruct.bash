#!/bin/bash

set -ex

rm -f *.zip
rm -f markdown/*-Part*.zip
rm -f html/*-Part*.zip

mv -f markdown/Export-*/* .
rm -rf markdown

mv -f README*.md README.md

mv -f html/Export-*/* html
rm -rf html/Export-*

mv -f html/README*.html html/index.html
cp html/index.html html/404.html
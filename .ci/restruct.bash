#!/bin/bash

set -ex

rm -f *.zip
rm -f markdown/*-Part*.zip
rm -f html/*-Part*.zip

mv markdown/Export-*/* .
rm -rf markdown

mv Index*.md README.md

mv html/Export-*/* html
rm -rf html/Export-*

mv html/Index*.html html/index.html
cp html/index.html html/404.html
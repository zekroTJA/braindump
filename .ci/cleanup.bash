#!/bin/bash

set -ex

find . -maxdepth 1 -not -path './.*' -and -not -name . -exec rm -rf {} \;

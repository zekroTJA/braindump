#!/bin/bash

find . -maxdepth 1 -not -path './.*' -and -not -name . -exec rm -rf {} \;

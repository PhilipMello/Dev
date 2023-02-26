#!/usr/bin/env bash

# Dev Editor
editor="nano"

# Date
current_date=$(date +'%b %d, %Y')

# Header
header="#!/usr/bin/env bash
# --------------------------------------------------------------
# Script     : Script Creator
# Description: Script to create Scripts
# Version    : 0.1
# Date       : $current_date
# Author     : Philip Mello <philipmello@live.com>
# License    : MIT
# --------------------------------------------------------------
# How to use: Type ./create-script.sh NAME-OF-SCRIPT (WITH EXTENSION OR NOT)
# Exemples: ./create-script.sh my-new-file.sh OR ./create-script.sh my-new.file.txt
# --------------------------------------------------------------
"

# Tests whether the user passed an argument.
[[ $# -ne 1 ]] && echo "Type only 1 filename" && exit 1

# Test if the file exists.
[[ -f $1 ]] && echo "The file already exists" && exit 1

echo "$header" > $1
chmod +x $1
$editor $1

exit 0

#!/usr/bin/env bash
# --------------------------------------------------------------
# Script     : Script Creator
# Description: REGEX
# Version    : 0.1
# Date       : Feb 26, 2023
# Author     : Philip Mello <philipmello@live.com>
# License    : MIT
# --------------------------------------------------------------
# How to use: Type ./create-script.sh NAME-OF-SCRIPT (WITH EXTENSION OR NOT)
# Exemples: ./create-script.sh my-new-file.sh OR ./create-script.sh my-new.file.txt
# --------------------------------------------------------------

# =~ Indicates that the expression on the right is a REGEX
# ^ Indicates the begining of line
# [0-9] Indicates list only numbers 0 to 9
# + Indicates numbers with 2 digits or more, ex: 10, 99, 100
# $ Indicates the end of line

# Test if Number is Number
read -p "Type anything: " number

[[ $number =~ ^[0-9]+$ ]] && echo "It´s a number!" || echo "Not a number!!!"


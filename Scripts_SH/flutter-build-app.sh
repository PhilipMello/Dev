#!/usr/bin/env bash
# --------------------------------------------------------------
# Script     : Flutter Build App
# Description: Script to Build Android .APK and Bundle file
# Version    : 0.1
# Date       : Apr 02, 2023
# Author     : Philip Mello <philipmello@live.com>
# License    : MIT
# --------------------------------------------------------------
# How to use: Type ./flutter-build-app.sh
# Exemples:
# --------------------------------------------------------------

echo "Please choose an option:"
echo "1. Create Android APK File"
echo "2. Create Android APK File (obfuscate)"
echo "3. Create Android AppBundle File"
echo "4. Create Android AppBundle File (obfuscate)"
echo "5. Delete build folder, obfuscate-apk, obfuscate-appbundle"
echo "6. Delete flutter cache"
echo "7. Download all dependencies"
echo "8. Force Delete build and obsfucate folders"

echo "Choose an Option"
read choice

case $choice in
  1)
    echo "Creating Android APK File..."
    flutter clean &&
    flutter pub cache clean &&
    flutter pub get &&
    flutter build apk --split-per-abi
    ;;
  2)
    echo "Creating Android APK File (obsfucate)..."
    flutter clean &&
    flutter pub cache clean &&
    flutter pub get &&
    flutter build apk --obfuscate --split-per-abi --split-debug-info=obfuscate-apk
    ;;
  3)
    echo "Creating Android AppBundle File..."
    flutter clean &&
    flutter pub cache clean &&
    flutter pub get &&
    flutter build appbundle
    ;;
  4)
    echo "Creating Android AppBundle File (obsfucate)..."
    flutter clean &&
    flutter pub cache clean &&
    flutter pub get &&
    flutter build appbundle --obfuscate --split-debug-info=obfuscate-appbundle
    ;;
  5)
    echo "Deleting build folder, obfuscate-apk folder and obfuscate-appbundle folder"
    flutter clean &&
    rm -rf obfuscate-apk && rm -rf obfuscate-appbundle
    echo "Build folder and obsfucate folders deleted"
    ;;
  6)
    echo "Deleting flutter cache"
    flutter pub cache clean
  ;;
  7)
    echo "Downloading all dependencies..."
    flutter pub get
  ;;
  8)
    echo "Force deleting folders (build,obfuscate-apk,obfuscate-appbundle)"
    rm -rf build &&
    rm -rf obfuscate-apk && 
    rm -rf obfuscate-appbundle
  ;;
  *)
    echo "Invalid choice"
    ;;
esac

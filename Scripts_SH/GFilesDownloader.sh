#!/usr/bin/env bash
# --------------------------------------------------------------
# Script     : GFilesDownloader
# Description: Google Drive File Downloader
# Version    : 1.0
# Date       : Jun 07, 2023
# Author     : Philip Mello <philipmello@live.com>
# License    : MIT
# --------------------------------------------------------------
# How to use: Execute ./GFilesDownloader.sh and type your URL
# Exemples: ./GFilesDownloader.sh hit ENTER and type your Google Drive URL
# --------------------------------------------------------------

echo "Type your Google Drive URL"
read google_drive_url

get_gdrive_file_id=$(echo $google_drive_url | awk -F 'https://drive.google.com/file/d/|/view' '{print $2}')

gdrive_final_url="https://docs.google.com/uc?export=download&id=$get_gdrive_file_id"

get_file_name=$(curl -L $google_drive_url)

file_name=$(echo $get_file_name | awk -F '<meta property="og:title" content="|"><meta property="og:type" content="article">' '{print $2}')

echo "...Downloading Google Drive File"
wget -c --no-check-certificate $gdrive_final_url -O $file_name
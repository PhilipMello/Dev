#!/usr/bin/env bash
# --------------------------------------------------------------
# Script     : NextCloud Cron Services Creator
# Description: Script to create NextCloud Cron Jobs
# Version    : 0.1
# Date       : Mar 08, 2023
# Author     : Philip Mello <philipmello@live.com>
# License    : MIT
# --------------------------------------------------------------
# How to use: Execute ./nextcloud-cron.sh
# Exemples: 
# --------------------------------------------------------------

# nextcloudcron.service
service="
[Unit]
Description=Nextcloud cron.php job

[Service]
User=www-data
ExecStart=/usr/bin/php -f /var/www/nextcloud/cron.php
KillMode=process
"
# nextcloudcron.timer
timer="
[Unit]
Description=Run Nextcloud cron.php every 5 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=nextcloudcron.service

[Install]
WantedBy=timers.target
"

# Creating files
echo "$service" > /etc/systemd/system/nextcloudcron.service || chmod +x nextcloudcron.service
echo "$timer" > /etc/systemd/system/nextcloudcron.timer || chmod +x nextcloudcron.timer

# Enabling nextcloudcron.timer service
systemctl enable --now nextcloudcron.timer
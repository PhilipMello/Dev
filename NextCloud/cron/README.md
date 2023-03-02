# <p align="center">Cron</p>

## Creating Cron service for NextCloud

Go to /etc/systemd/system/
```
cd /etc/systemd/system/
```

Create #1 file: `nextcloudcron.service`
```
nano nextcloudcron.service
```

Insert this content
```
[Unit]
Description=Nextcloud cron.php job

[Service]
User=www
ExecStart=/usr/bin/php -f /var/www/YOUR-DOMAIN-HERE/cron.php
KillMode=process
```
**Replace the user www-data with the user of your http server and /var/www/YOUR-DOMAIN-HERE/cron.php with the location of cron.php in your nextcloud directory.**

<br>

Create #2 file: `nextcloudcron.timer`
```
[Unit]
Description=Run Nextcloud cron.php every 5 minutes

[Timer]
OnBootSec=5min
OnUnitActiveSec=5min
Unit=nextcloudcron.service

[Install]
WantedBy=timers.target
```
**The important parts in the timer-unit are OnBootSec and OnUnitActiveSec. OnBootSec will start the timer 5 minutes after boot, otherwise you would have to start it manually after every boot. OnUnitActiveSec will set a 5 minute timer after the service-unit was last activated.**

<br>

Now all that is left is to start and enable the timer by running this command:
```
systemctl enable --now nextcloudcron.timer
```
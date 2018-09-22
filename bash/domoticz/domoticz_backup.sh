#!/bin/bash
#CAL/FTP/SCP/MAIL PARAMETERS
SERVER="NAS DNS"  # IP of Synology NAS, used for ftp
USERNAME="User account Synology"         # FTP username of Network disk used for ftp
PASSWORD="Password Synology"         # FTP password of Network disk used for ftp
DESTDIR="/opt/backup"   # used for temorarily storage
DESTDIRNAS="/homes/domoticz/backup/" # Path to your Synology NAS backup folder
DOMO_IP="192.168.1.18"   # Domoticz IP 
### END OF USER CONFIGURABLE PARAMETERS
TIMESTAMP=`/bin/date +%Y%m%d%H%M%S`
BACKUPFILE="domoticz_$TIMESTAMP.db" # backups will be named "domoticz_YYYYMMDDHHMMSS.db.gz"
BACKUPFILEGZ="$BACKUPFILE".gz
### Create backup and ZIP it
/usr/bin/curl -s https://$DOMO_IP/backupdatabase.php > /tmp/$BACKUPFILE
gzip -9 /tmp/$BACKUPFILE
tar -zcvf /tmp/domoticz_scripts_$TIMESTAMP.tar.gz /home/pi/domoticz/scripts/
tar -zcvf /tmp/scripts_$TIMESTAMP.tar.gz /home/pi/scripts/
#### Send to Network disk through FTP
#curl -s --disable-epsv -v -T"/tmp/$BACKUPFILEGZ" -u"$USERNAME:$PASSWORD" "ftp://$SERVER/$DESTDIRNAS"
#curl -s --disable-epsv -v -T"/tmp/domoticz_scripts_$TIMESTAMP.tar.gz" -u"$USERNAME:$PASSWORD" "ftp://$SERVER/$DESTDIRNAS"
#curl -s --disable-epsv -v -T"/tmp/scripts_$TIMESTAMP.tar.gz" -u"$USERNAME:$PASSWORD" "ftp://$SERVER/$DESTDIRNAS"
### Remove temp backup file
/bin/rm /tmp/$BACKUPFILEGZ
/bin/rm /tmp/domoticz_scripts_$TIMESTAMP.tar.gz
/bin/rm /tmp/scripts_$TIMESTAMP.tar.gz
### Done!


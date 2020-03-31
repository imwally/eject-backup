#!/bin/sh

VOLUME_PATH="/Volumes/Backup"
TM_RUNNING=$(tmutil status | grep "Running = 1;")


# Don't eject if Time Machine is running
if [ ! -z "$TM_RUNNING" ];
then
    osascript -e 'display notification "Time Machine is currently running. Ejection canceled." with title "🕓 Eject Backup"'
    exit 1
fi


# Otherwise eject backup
[ -d $VOLUME_PATH ] &&
    diskutil unmount $VOLUME_PATH &&
    osascript -e 'display notification "Backup disk successfully ejected." with title "✅ Eject Backup"' ||
	osascript -e 'display notification "No backup disk found." with title "🚫 Eject Backup"'

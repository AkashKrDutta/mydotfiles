#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/Papirus-Dark/16x16/apps/system-software-update.svg

get_total_updates() {
    UPDATES=$(($(apt list --upgradable 2>/dev/null | wc -l) - 1))
}

#while true; do
#    get_total_updates
#
#    # notify user of updates
#    if hash dunstify &>/dev/null; then
#        if (( UPDATES > 50 )); then
#            dunstify -h string:x-dunst-stack-tag:updates_count -u critical -i $NOTIFY_ICON \
#                "You really need to update!!" "$UPDATES New packages"
#            echo $UPDATES
#        elif (( UPDATES > 0 )); then
#            # Show update notification for 2 mins
#            dunstify -h string:x-dunst-stack-tag:updates_count -u normal -t 120000 -i $NOTIFY_ICON \
#                "$UPDATES New packages"
#            echo $UPDATES
#        fi
#    fi
#
#    # when there are updates available
#    # every 30 seconds another check for updates is done
#    while (( UPDATES > 0 )); do
#        sleep 30
#        get_total_updates
#        if (( UPDATES == 0 )); then
#            echo "None"
#        else
#            echo "$UPDATES"
#        fi
#    done
#
#    #reached here means updates are 0 again
#    #sleep for 4 hours to check again if upgraded or not
#    echo  "None"
#    #sleep $((3600*4))
#    sleep 10
#
#done
get_total_updates
if (( UPDATES > 0 ));then
    echo "$UPDATES"
else
    echo "None"
fi
threshHold = $((3600*2))
lastUpdateFile=$HOME/.config/polybar/shapes/scripts/lastUpdateNotify.sh 
. $lastUpdateFile
currTime=$(date +%s)
if (( currTime-lastTime >= threshHold ));then
    if (( UPDATES > 50 )); then
        dunstify -h string:x-dunst-stack-tag:updates_count -u critical -i $NOTIFY_ICON \
            "You really need to update!!" "$UPDATES New packages"
        echo "lastTime="$currTime > $lastUpdateFile
    elif (( UPDATES > 0 )); then
        # Show update notification for 2 mins
        dunstify -h string:x-dunst-stack-tag:updates_count -u normal -t 120000 -i $NOTIFY_ICON \
            "$UPDATES New packages"
        echo "lastTime="$currTime > $lastUpdateFile
    fi
fi

#!/bin/sh

setterm -cursor off
VIDEOPATH="/home/pi/Documents/mayu/video" 
SERVICE="omxplayer"
omxplayer --refresh -o both --orientation 180 /home/pi/Documents/mayu/opening/opening_mirror.mp4 > /dev/null
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
                sleep 1
        else
                for entry in $VIDEOPATH/*
                # $entry = $VIDEOPATH{0}
                do
                        omxplayer --refresh -o both --orientation 180 $entry > /dev/null
                done
        fi
done
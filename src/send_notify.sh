#!/bin/bash

. "$(dirname $0)/config.sh"

NAMEAPP="Connection SSH"
TITLE="SSH Connection Established with \"$USER\""
MESSAGE="$(echo $SSH_CONNECTION | sed 's/\(.*\) \(.*\) \(.*\) \(.*\)/from \1:\2 to \3:\4/')"

export DISPLAY=:0
notify-send -a "$NAMEAPP" -i $PATH_TO_ICON "$TITLE" "$MESSAGE" > /dev/null 2> /dev/null &
cvlc --ignore-config --play-and-exit $PATH_TO_SOUND > /dev/null 2> /dev/null &

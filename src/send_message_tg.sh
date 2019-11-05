#!/bin/bash

. "$(dirname $0)/config.sh"

TEXT_MESSAGE="New connection SSH

SSH Connection Established with \"$USER\" $(echo $SSH_CONNECTION | sed 's/\(.*\) \(.*\) \(.*\) \(.*\)/from \1:\2 to \3:\4/')"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl \
    --data-urlencode "chat_id=$USER_ID" \
    --data-urlencode "text=$TEXT_MESSAGE" \
    $URL \
    > /dev/null 2> /dev/null &

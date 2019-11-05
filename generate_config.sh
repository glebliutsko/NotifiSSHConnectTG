#!/bin/bash

echo "#!/bin/bash"

if [ -n "$1" ]; then
    echo "TOKEN=\"$1\""
else
    echo "No found token"
    exit
fi

if [ -n "$2" ]; then
    echo "USER_ID=\"$2\""
else
    echo "No found user ID"
    exit
fi

echo "PATH_TO_ICON=\"\$(dirname \$0)/media/icon.png\""
echo "PATH_TO_SOUND=\"\$(dirname \$0)/media/ssh_connect.wav\""

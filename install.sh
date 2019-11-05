#!/bin/bash

DIR_INSTALL="/opt/alert_ssh"

if [ `id --user` != 0 ]; then
    echo "root privileges are required"
    exit
fi

cp "$(dirname $0)/src/" $DIR_INSTALL -r

echo -n "Telegram API token: "
read TOKEN
echo -n "User ID to send: "
read USER_ID

. "$(dirname $0)/generate_config.sh" $TOKEN $USER_ID > "$DIR_INSTALL/config.sh"
chmod 755 "$DIR_INSTALL/config.sh"

if [ ! -f "/etc/ssh/sshrc" ]; then
    echo "#!/bin/bash" > /etc/ssh/sshrc
    chmod 755 /etc/ssh/sshrc
fi

echo "# Notification start" >> /etc/ssh/sshrc
echo "$DIR_INSTALL/send_message_tg.sh" >> /etc/ssh/sshrc
echo "$DIR_INSTALL/send_notify.sh" >> /etc/ssh/sshrc
echo "# Notification end" >> /etc/ssh/sshrc

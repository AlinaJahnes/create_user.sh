#!/bin/bash
for USER in $@
do
    echo "Creating account for user $USER"
    /usr/sbin/useradd -m -d /home/$USER -s /bin/bash $USER

    if [ $? = 0 ]
        then
                echo $USER | /usr/bin/passwd --stdin $USER
                echo "$USER has been created successfully."
                /usr/bin/chage -d 0 $USER
        else
                echo "Failed to create account $USER."
                exit
    fi
done


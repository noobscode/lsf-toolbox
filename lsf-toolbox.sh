#!/bin/bash

function header {
cat << "EOF"
# LSF Toolbox
# Author: Alexander A. Nordbo¸
# https://github.com/noobscode
#
# This Toolbox was made to simplify the use of LSF cluster commands

EOF
}

function mainmen {
header
PS3='Please enter your choice: '
options=("List all jobs" "List jobs for a spesific user" "List job based on #ID" "Kill a job" "List all queues" "List all nodes" "List resources reserved by cluster" "New cluster user" "Remove cluster user" "Persistent Install" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "List all jobs")
            bjobs -a -u all
            ;;
        "List jobs for a spesific user")
            read -p 'Username: ' uservar
            bjobs -u $uservar
            ;;
        "List job based on #ID")
            read -p 'Job-ID: ' jobid
            bjobs -I $jobid
            ;;
	"Kill a job")
            read -p 'Job-ID: ' killjobid
            bkill $killjobid
            ;;
        "List all queues")
            bqueues
            ;;
	"List all nodes")
            bhosts
            ;;
	"List resources reserved by cluster")
            bhosts -s
            ;;
	"New cluster user")
            read -p 'Username: ' newuser
            useradd $newuser
	    passwd $newuser
	    su - $newuser
            ;;
	"Remove cluster user")
            read -p 'Username to remove: ' rmuser
            userdel $rmuser
            ;;
	"Persistent Install")
	    echo "Installing to /usr/share/lsf-toolbox"
	    mkdir -p /usr/share/lsf-toolbox
	    cp "$(readlink -f $0)" "/usr/share/lsf-toolbox"
	    echo -e '#!/bin/bash' > /usr/bin/lsf
	    echo -e 'cd /usr/share/lsf-toolbox && ./lsf-toolbox.sh' >> /usr/bin/lsf
	    chmod +x /usr/bin/lsf
	    ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
}

# Start main

clear
mainmen

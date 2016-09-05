#!/bin/sh

clear >&2

# Get User input
# --------------------

#System Config
printf "================================================================================\n" >&2
printf "Type in the IP for your VM, followed by [ENTER].\n- default:[$2]\n" >&2
printf "================================================================================\n" >&2
read vm_ip
if [ -z "$vm_ip"]
then
	vm_ip=$2
fi
clear >&2

printf "================================================================================\n" >&2
printf "Type in the Hostname for your VM, followed by [ENTER].\n- default:[$1]\n" >&2
printf "================================================================================\n" >&2
read vm_hostname
if [ -z "$vm_hostname"]
then
	vm_hostname=$1
fi
clear >&2

printf "================================================================================\n" >&2
printf "Type in the URL for your VM, followed by [ENTER].\n- default:[$3]\n" >&2
printf "================================================================================\n" >&2
read vm_url
if [ -z "$vm_url"]
then
	vm_url=$3
fi
clear >&2

#Database Config
printf "================================================================================\n" >&2
printf "Type in the Database Name, followed by [ENTER].\n- default:[$4]\n" >&2
printf "================================================================================\n" >&2
read db_name
if [ -z "$db_name"]
then
	db_name=$4
fi
clear >&2

printf "================================================================================\n" >&2
printf "Type in the Database Username, followed by [ENTER].\n- default:[$5]\n" >&2
printf "================================================================================\n" >&2
read db_user
if [ -z "$db_user"]
then
	db_user=$5
fi
clear >&2

printf "================================================================================\n" >&2
printf "Type in the Database User password, followed by [ENTER].\n- default:[$6]\n" >&2
printf "================================================================================\n" >&2
read db_pass
if [ -z "$db_pass"]
then
	db_pass=$6
fi
clear >&2

# Write out Vagrant Config
# --------------------
VCONFIG=$(cat <<EOF
---
vm_ip: '$vm_ip'
vm_hostname: '$vm_hostname'
vm_url: '$vm_url'
vm_name: '$vm_hostname'
db_name: '$db_name'
db_user: '$db_user'
db_pass: '$db_pass'
EOF
)

echo "$VCONFIG" > deploy/config/config.yml
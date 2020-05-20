############## Author - Muhammad Irfan Tahir ###################

############# Every running Droplet in Account will display
############# Take Snaphot of every running Droplet 
############# Giving them name of backup.date 
############# Date will be the time at which this Script is executed

#!/bin/bash

echo "Running droplets - "

doctl compute droplet list

mapfile -t IDLIST < <(doctl compute droplet list --format 'ID' --no-header)

	snapshot_name=Backup
        var=$(date "+%Y.%m.%d-%H.%M.%S")
        var2=$snapshot_name.$var



for each in "${IDLIST[@]}"

do
	echo "Taking Snapshot of Droplet - $each"
	echo "SnapShot Name $var2"
	doctl compute droplet-action snapshot $each --snapshot-name $var2


done

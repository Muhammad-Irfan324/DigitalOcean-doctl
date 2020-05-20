############## Author - Muhammad Irfan Tahir ###################

############# Every running Droplet in Account will display
############# Then Enter the droplet ID and take the snapshot
############# that droplet. And set snapshot Name. 
############# Snapshot Name You've entered  + Date will be the name of
############# snapshot and if you enters wrong id it'll ask again until
############# enters the right ID


#!/bin/bash

echo "Running droplets - "

doctl compute droplet list

mapfile -t IDLIST < <(doctl compute droplet list --format 'ID' --no-header)

finished=false

while ! $finished; do

echo "Enter Droplet ID And Take snapshot of that Droplet:" 

read droplet_id

	if [[ " ${IDLIST[@]} " =~ " ${droplet_id} " ]]; then
	echo "Enter Snapshot_name:"
	read snapshot_name
	var=$(date "+%Y.%m.%d-%H.%M.%S")
	var2=$snapshot_name.$var
	echo "Snapshot Name - $var2"
	echo "Taking Snapshot"
	doctl compute droplet-action snapshot $droplet_id --snapshot-name $var2
	finished=true
	fi

	if [[ ! " ${IDLIST[@]} " =~ " ${droplet_id} " ]]; then
    echo "You've entered Wrong ID"
	fi

		

done


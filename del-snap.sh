############## Author - Muhammad Irfan Tahir ###################

############# Displays Running Droplets and there specific snapshots
############# Then Removes the snapshot of each droplet with Number seven retention


#!/bin/bash

echo "Running droplets - "

doctl compute droplet list

mapfile -t IDLIST < <(doctl compute droplet list --format 'ID' --no-header)

for each in "${IDLIST[@]}"

do

	echo "Droplet ID $each Number of Snap Shots"

	doctl compute droplet snapshots $each

	snapshot=$(doctl compute droplet snapshots $each --format "ID" --no-header | wc -l)

	echo "Total Number Snapshot -"

	echo "$snapshot"

	finished=false

	while ! $finished; do
		
		if [ "$snapshot" -gt 7 ]; then
              		
			mapfile -t IDLIST1 < <(doctl compute droplet snapshots $each --format "ID" --no-header)
			
			OLDEST=${IDLIST1[0]}
			
			echo "Deleting SnapShot ID- $OLDEST"
			
			#doctl compute image delete "$OLDEST" --force
			doctl compute snapshot delete $OLDEST --force
			
			sleep 15
		fi
	
	         snapshot=0
                 
		 doctl compute droplet snapshots $each 	 #--format "ID" --no-header
		
		 snapshot=$(doctl compute droplet snapshots $each --format "ID" --no-header | wc -l)
	      	 
		 echo "Remaining Snapshot Number - $snapshot"

		if [ "$snapshot" -eq 7 ]; then
			
			echo "Snapshot Number $snapshot is equal to retention"
			
			finished=true
		fi

		if [ "$snapshot" -lt 7 ]; then
			
			echo "Snapshot Number $snapshot is already under retention"
			
			finished=true
		
		fi
	
	done

done


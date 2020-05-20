# DigitalOcean-doctl
Snap Shot Of running Droplets and removing it with retention Period

First create API Token/keys in Digital Account From
ACCOUNT --> API --> TOKENs/KEYs

After generating token you can use that token via API or via doctl digital Ocean CLI

In Case if you're interested to use API's follow this link

https://developers.digitalocean.com/documentation/v2/

But in case if you want to use doctl digital ocean CLI command line tool then you can follow this link

https://www.digitalocean.com/docs/apis-clis/doctl/reference/

In order to use doctl CLI tool first you have to install this package and for installing you can follow this link

https://www.digitalocean.com/docs/apis-clis/doctl/how-to/install/

And install doctl a/c to your OS (Linux, macOS or windows)

After installing initialize your API token so that doctl can access digital ocean account

Command - doctl auth init --context <NAME>

context name is just giving name to account in case if you have multiple accounts and you need to switch between them on CLI then this name will come handy
In case if you don't enters context name, it'll be considered as default

After initializing account you can use this doctl CLI tool

Scripts are written in bash

# Script - manual-snap.sh

- Will first get all the running droplets in your account
- ask for entering droplet ID
- take Snapshot of that particular droplet
- Ask for Snapshot Name
- Will create snapshot with name you've entered + the date at which this script is executed
- In case wrong droplet ID is entered will continuously ask for droplet ID until you enters the correct ID


# Script - auto-snap.sh

- will get all the running droplets in your account
- take snapshot of every running droplet
- with name backup+date

# Script - del-snap.sh

- will get all running droplets
- display snapshots of all running droplets
- keep Latest seven number of snapshots retention
- any snapshot older than seven numbers will be removed
- if the total snapshot number is equal to 7 then it'll let you know that total number of snapshot is equal to retention
- or if total snapshot number is less then 7 then it'll let you know that it is under retention period

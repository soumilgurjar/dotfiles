#!/bin/sh

echo "Date: $(date)\n"
echo "Copying BirdNET-PI database and settings\n"

# Start Copying with rsync (Always keep -a flag to maintain permissions and timestamps)
# Copy to Seagate 1TB Drive
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/birdnet.conf "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/birdnet.conf-defaults "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/apprise.txt "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/scripts/birds.db "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/scripts/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/scripts/update_timestamps_linux.sh "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/scripts/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/Charts "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"
rsync -ahP --size-only --exclude-from "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/By_Date/exclude_list.txt" -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/By_Date "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"
# rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/By_Date "/Volumes/Seagate 1TB/Backups/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"

echo "\nDone syncing"

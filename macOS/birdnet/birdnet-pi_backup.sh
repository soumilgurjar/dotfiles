#!/bin/sh

echo "Copying BirdNET-PI database and settings"

# Start Copying with rsync (Always keep -a flag to maintain permissions and timestamps)
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/birdnet.conf "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/birdnet.conf-defaults "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/apprise.txt "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/scripts/birds.db "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/scripts/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/scripts/update_timestamps_linux.sh "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/scripts/"
rsync -ahP -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/Charts "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"
rsync -ahP --size-only --exclude-from "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/By_Date/exclude_list.txt" -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/By_Date "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"
# rsync -ahP --size-only -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/By_Date "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"

echo "Done syncing"

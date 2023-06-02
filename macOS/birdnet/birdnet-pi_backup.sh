#!/bin/sh

echo "Copying BirdNET-PI database and settings"

# Start Copying with rsync
rsync -aPW -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/birdnet.conf "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -aPW -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/apprise.txt "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/"
rsync -aPW -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdNET-Pi/scripts/birds.db "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdNET-Pi/scripts/"
rsync -aPW -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/Charts "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"
rsync -aPW --exclude-from "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/By_Date/exclude_list.txt" -e "ssh -i $HOME/.ssh/id_birdnetpi" soumilgurjar@mediumplacebirder.local:/home/soumilgurjar/BirdSongs/Extracted/By_Date "$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/"

echo "Done syncing"

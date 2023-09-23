#!/bin/bash

# Function to extract date and time from the filename
get_date_time() {
	# Get the filename without the path
	filename=$(basename "$1")

	# Extract date (e.g., 2023-08-04 or 23-08-04) from filename
	# date=$(echo "$filename" | grep -oE '{10}.png' | sed 's/.png//')
	date=$(echo $file | grep -o '[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}')

	# Set time to 11:59:59
	time="23:59:59"
}

# Function to update file timestamps and echo the changed filenames
update_timestamps() {
	# Combine date and time strings for the 'touch' command on macOS
	formatted_datetime_touch="${date} ${time}"

	# Convert formatted_datetime_touch to the required format ([[CC]YY]MMDDhhmm[.SS])
	formatted_datetime_touch=$(date -j -f "%Y-%m-%d %H:%M:%S" "$formatted_datetime_touch" "+%Y%m%d%H%M.%S")

	# Combine date and time strings for the 'SetFile' command on macOS
	formatted_datetime_setfile="${date} ${time}"

	# Convert formatted_datetime_setfile to the required format (MM/DD/YYYY HH:MM:SS)
	formatted_datetime_setfile=$(date -j -f "%Y-%m-%d %H:%M:%S" "$formatted_datetime_setfile" "+%m/%d/%Y %H:%M:%S")

	# Set 'date modified' of the file using the formatted date and time with 'touch'
	touch -c -t "$formatted_datetime_touch" "$1"

	# Set 'date created' attribute using 'SetFile' command with the corrected format
	SetFile -d "$formatted_datetime_setfile" "$1"

	# echo "Timestamps updated for: $1"
	echo "Date: $date"
	echo "Time: $time"
	echo "Formatted datetime (touch): $formatted_datetime_touch"
	echo "Formatted datetime (SetFile): $formatted_datetime_setfile"
}

# Directory containing the files
main_directory="$HOME/pCloud Drive/Miscellaneous/Apps/BirdNet-Pi/Detection_Database_Backups/BirdSongs/Extracted/Charts"

# Find all files in the current directory and its subdirectories containing "birdnet" in the name
# The IFS (Internal Field Separator) is set to a newline to handle spaces in file names.
IFS=$'\n'
# files=$(find "$main_directory" -type f -name "*.png")
files=$(find "$main_directory" -type f -path "*2023-03-*" -o -path "*2023-04-*" -o -path "*2023-05-*" -o -path "*2023-06-*" -o -path "*2023-07-*" -o -path "*2023-08-01*" -o -path "*2023-08-02*" -name "*.png")

# Loop through each file and update its timestamps
for file in $files; do
	# Call the function to extract date and time
	get_date_time "$file"

	# Display the file being processed
	echo "Processing file: $filename"

	# Call the function to update timestamps and echo the extracted date and time
	update_timestamps "$file"
done

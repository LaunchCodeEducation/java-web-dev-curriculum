#!/bin/bash

# Check if a directory is provided
if [ $# -eq 0 ]; then
    echo "Please provide a directory path"
    exit 1
fi

# The directory to process
DIR="$1"

# Check if the provided path is a directory
if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a directory"
    exit 1
fi

# Find all files in the directory and its subdirectories
find "$DIR" -type f | while read file; do
    # Apply the sed command to each file, targeting specific relref links with no whitespace before >
    sed -i 's/({{< relref "\([^"]*\)"[[:space:]]*>}})/({{% relref "\1" %}})/g' "$file"
    echo "Processed: $file"
done

echo "All files have been processed."

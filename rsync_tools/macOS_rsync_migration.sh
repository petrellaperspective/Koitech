#!/bin/bash

# Specific the path of the user's directory
read -e -p "What is the Source?:" Source

if [ -d "$Source" ];
then

  echo "Path exists and the directory is ready to go"
else

  echo "Path does not exist. Please check to make sure the source is accurate"
fi

# The destination for your directory
read -e -p "Where you do you want this to go?:" Target

if [ -d "$Target" ];
then

  echo "Target Locked commencing ignition"
else

  echo "No Lock on Target. Please check the destination"
fi

rsync -avphtr --stats --progress --log-file=/Volumes/Macintosh\ HD/Users/roshakapple/Desktop/rsync_log.txt "$Source" "$Target"; osascript -e 'tell Application "Finder" to display dialog "Rsync Transfer Complete!" ' | exit

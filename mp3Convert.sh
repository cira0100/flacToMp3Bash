#!/bin/bash

# Set the source directory containing FLAC files
source_dir="$HOME/Desktop/music"

# Find FLAC files and convert them to MP3
find "$source_dir" -type f -iname "*.flac" -exec bash -c '
    flac_file="$1"
    mp3_file="${flac_file/%.flac/.mp3}"
    echo "Converting: $flac_file"
    ffmpeg -i "$flac_file" -ab 320k -map_metadata 0 -id3v2_version 3 "$mp3_file" && rm "$flac_file"
' bash {} \;


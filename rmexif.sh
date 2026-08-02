#!/bin/bash

wd="static/img"
# shellcheck disable=SC2012
total=$(ls $wd/*.{jpg,jpeg,JPG,JPEG} | wc -l)
counter=0
for f in "$wd"/*.{jpg,jpeg,JPG,JPEG}; do
  if [[ $(exiftool -gps:all "$f") ]]; then
    exiftool -q -time:all= -gps:all= -overwrite_original_in_place "$f"
    ((counter++))
  fi
done
echo "$counter out of $total files updated"

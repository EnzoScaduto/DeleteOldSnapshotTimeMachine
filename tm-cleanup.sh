#!/bin/bash

IFS=$'\r\n' GLOBIGNORE='*' command eval  'XYZ=($(tmutil listlocalsnapshots /))'

len=${#XYZ[@]}
 
## Use bash for loop 
for (( i=0; i<$len - 1; i++ )); do
    IFS='.' read -ra ADDR <<< "${XYZ[$i]}"
    echo "${ADDR[3]}";
    sudo tmutil deletelocalsnapshots ${ADDR[3]};
done

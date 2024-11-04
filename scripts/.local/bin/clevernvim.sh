#!/bin/bash
absolute_path() {
    # Expand ~ and resolve relative paths
    echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

ToOpen=$(absolute_path "$1")

if [ -d "${ToOpen}" ]; then
   cd "${ToOpen}" && nvim .
elif [ -f "${ToOpen}" ]; then
  cd "$(dirname "$ToOpen")" && nvim "$(basename "$ToOpen")"
else
  # Print error if the argument is not a valid file or directory
  echo "Error: '$ToOpen' is not a valid file or directory."
fi

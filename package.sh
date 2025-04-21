#!/bin/bash

# Unofficial "Safe" mode http://redsymbol.net/articles/unofficial-bash-strict-mode/

# Cleanup
rm -r ./release/
mkdir -p release

set -euo pipefail
IFS=$'\n\t'
set -e
set -u
set -o pipefail



# Create zip's
cd Profiles

for profile in *; do
    echo Creating ./release/$profile.zip
    zip -r "../release/$profile.zip" "$profile"
done

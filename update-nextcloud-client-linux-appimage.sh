#!/usr/bin/env zsh

# Installation path of your Nextcloud client
INSTALL_PATH="$HOME/.local/bin/Nextcloud.AppImage"

# GitHub API URL
API_URL="https://api.github.com/repos/nextcloud-releases/desktop/releases/latest"

echo "Retrieving download URL of the latest version"
download_url=$(curl -sSL "$API_URL" | jq -r '.assets[] | select(.name | endswith(".AppImage")) | .browser_download_url')

echo "Got download url: $download_url"

if [[ -z "$download_url" ]]; then
    echo "Failed to retrieve download URL."
    exit 1
fi

file_name=$(basename "$download_url")

echo "Downloading $file_name"
curl -LO "$download_url"

echo "Quitting nextcloud client"
$INSTALL_PATH -q

echo "Moving file"
mv $file_name $INSTALL_PATH

echo "Making file executable"
chmod +x $INSTALL_PATH

echo "Starting nextcloud client"
"$INSTALL_PATH" &

echo "Finished"
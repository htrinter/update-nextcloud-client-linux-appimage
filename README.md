# Auto-update for Nextcloud Desktop Client on Linux

A small zsh shell script that updates the Nextcloud linux client (AppImage) to its latest version, retrieved from [GitHub Nextcloud Desktop Releases](https://github.com/nextcloud/desktop/releases).

Setup:
- This script requires [jq](https://stedolan.github.io/jq/)
- Update the `INSTALL_PATH` in the script to your location
- Do not forget to make the script executable: `chmod +x update-nextcloud-client-linux-appimage.sh`
- Run the script: `./update-nextcloud-client-linux-appimage.sh`

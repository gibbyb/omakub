# Be fancy
source ~/.local/share/sunhat/bin/ascii.sh

# Needed for all installers
sudo dnf update -y
sudo dnf install -y curl git unzip

# Ensure computer doesn't go to sleep while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run Scripts Required for Application Installs
for script in ~/.local/share/sunhat/sources/*.sh; do source $script; done

# Run installers
for script in ~/.local/share/sunhat/install/*.sh; do source $script; done

# Change GNOME settings
for script in ~/.local/share/sunhat/settings/*.sh; do source $script; done

# Install GPU Drivers
source ~/.local/share/sunhat/GPU/install.sh

# Revert to normal idle settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Upgrade everything that might ask for a reboot last
sudo dnf update -y --refresh

# Logout to pickup changes
gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt

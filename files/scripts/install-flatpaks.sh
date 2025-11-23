#!/usr/bin/env bash

set -e

echo "Installing Flatpak packages..."

# Add Flathub (system scope) if it doesn't already exist
if ! flatpak remote-list --system | grep -q flathub; then
    flatpak remote-add --if-not-exists --system flathub \
        https://dl.flathub.org/repo/flathub.flatpakrepo
fi

flatpak install -y \
    io.github.kolunmi.Bazaar \
    app.devsuite.Ptyxis \
    org.mozilla.firefox \
    org.gtk.Gtk3theme.adw-gtk3 \
    org.gtk.Gtk3theme.adw-gtk3-dark

echo "All packages installed successfully!"

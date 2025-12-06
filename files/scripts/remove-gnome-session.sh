#!/usr/bin/env bash
set -euo pipefail

WAYLAND_SESSIONS="/usr/share/wayland-sessions"
X11_SESSIONS="/usr/share/xsessions"
APP_DIR="/usr/share/applications"

GNOME_SESSIONS=(
  gnome.desktop
  gnome-wayland.desktop
  gnome-xorg.desktop
  gnome-classic.desktop
  gnome-classic-wayland.desktop
)

if [[ -d "$WAYLAND_SESSIONS" ]]; then
  for f in "${GNOME_SESSIONS[@]}"; do
    rm -f "$WAYLAND_SESSIONS/$f" || true
    ln -sf /dev/null "$WAYLAND_SESSIONS/$f"
  done
fi

if [[ -d "$X11_SESSIONS" ]]; then
  for f in "${GNOME_SESSIONS[@]}"; do
    rm -f "$X11_SESSIONS/$f" || true
    ln -sf /dev/null "$X11_SESSIONS/$f"
  done
fi

DESKTOP_FILES=(
  org.gnome.Settings.desktop
  gnome-control-center.desktop
  org.gnome.Ptyxis.desktop
  org.freedesktop.MalcontentControl.desktop
  org.gnome.ColorProfileViewer.desktop
  org.gnome.Yelp.desktop
)

if [[ -d "$APP_DIR" ]]; then
  for f in "${DESKTOP_FILES[@]}"; do
    rm -f "$APP_DIR/$f" || true
    cat > "$APP_DIR/$f" <<EOF
[Desktop Entry]
Type=Application
Name=Dummy Placeholder
NoDisplay=true
Hidden=true
EOF
  done
fi

#! /bin/bash

set +e

# obs
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

# Permission authentication
/usr/libexec/xfce-polkit &

# waybar
waybar &

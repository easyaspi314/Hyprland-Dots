#!/bin/sh

# Ensure that the session D-Bus is running. This is usually started by
# systemd, but on platforms without systemd this is not guaranteed.

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    export DBUS_SESSION_BUS_ADDRESS="$(dbus-daemon --fork --session --print-address)"
    hyprctl keyword env DBUS_SESSION_BUS_ADDRESS,"$DBUS_SESSION_BUS_ADDRESS"
fi

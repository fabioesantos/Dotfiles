#!/bin/sh

rx_current="$(( $(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+') ))"
tx_current="$(( $(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+') ))"

prevdata="$(cat "${HOME}/.cache/netlog")"

printf " %sKiB  %sKiB\\n" \
        "$(((${rx_current}-${prevdata%% *})/1024))" \
        "$(((${tx_current}-${prevdata##* })/1024))"

echo "$rx_current $tx_current" > "${HOME}/.cache/netlog"

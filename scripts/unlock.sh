#!/usr/bin/env bash
SOCKET_PATH=$(tmux display-message -p "#{socket_path}")
DATA="/tmp/tmux-keylocker-${SOCKET_PATH#/tmp/tmux-}"
if [ -d "$DATA" ]; then
	tmux source "$DATA/un-mapped-keys"
	rm -rf "$DATA"
fi

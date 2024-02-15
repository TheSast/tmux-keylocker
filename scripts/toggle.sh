#!/usr/bin/env bash
SOCKET_PATH=$(tmux display-message -p "#{socket_path}")
DATA="/tmp/tmux-keylocker-${SOCKET_PATH#/tmp/tmux-}"
if [ -d "$DATA" ]; then
	tmux unlock-mappings
else
	tmux lock-mappings
fi

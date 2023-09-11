#!/usr/bin/env bash
TMUX_UID="$(tmux display-message -p "#{uid}")"
SERVER="$(basename "$(tmux display-message -p "#{socket_path}")")"
DATA="/tmp/tmux-keylocker-$TMUX_UID/$SERVER"
if [ -d "$DATA" ]; then
	tmux unlock-mappings
else
	tmux lock-mappings
fi

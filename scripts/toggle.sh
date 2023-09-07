#!/usr/bin/env bash
if [ -f "/tmp/tmux-keylocker/mapcache" ]; then
	tmux unlock-mappings
else
	tmux lock-mappings
fi

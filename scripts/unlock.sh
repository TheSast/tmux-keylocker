#!/usr/bin/env bash
if [ -f "/tmp/tmux-keylocker/mapcache" ]; then
	tmux source /tmp/tmux-keylocker/mapcache
	rm /tmp/tmux-keylocker/mapcache -f
fi

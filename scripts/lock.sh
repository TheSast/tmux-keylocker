#!/usr/bin/env bash
if [ -f "/tmp/tmux-keylocker/mapcache" ]; then
	tmux source /tmp/tmux-keylocker/mapcache
	rm /tmp/tmux-keylocker/mapcache -f
else
	tmux list-keys | grep -- "-T root" >/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix)" >>/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix2)" >>/tmp/tmux-keylocker/mapcache
	tmux unbind -aqT root
	tmux set-option -g prefix "None"
	tmux set-option -g prefix2 "None"
	TL_BIND="$(grep "tmux-keylocker/scripts/lock.sh" /tmp/tmux-keylocker/mapcache | sed "s/.*-T root *//" | sed "s/ .*//")"
	[ "$TL_BIND" ] && tmux bind "$TL_BIND" -qn lock-mappings
	exit 0
fi

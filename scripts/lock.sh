#!/usr/bin/env bash
if ! [ -f "/tmp/tmux-keylocker/mapcache" ]; then
	tmux list-keys | grep -- "-T root" >/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix)" >>/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix2)" >>/tmp/tmux-keylocker/mapcache
	tmux unbind -aqT root
	tmux set-option -g prefix "None"
	tmux set-option -g prefix2 "None"
	grep -E "tmux-(key)?locker/scripts/(unlock)|(toggle)\.sh" "/tmp/tmux-keylocker/mapcache" >"/tmp/tmux-keylocker/unmapcache"
	tmux source "/tmp/tmux-keylocker/unmapcache"
fi

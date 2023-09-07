#!/usr/bin/env bash
if ! [ -f "/tmp/tmux-keylocker/mapcache" ]; then
	tmux list-keys | grep -- "-T root" >/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix)" >>/tmp/tmux-keylocker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix2)" >>/tmp/tmux-keylocker/mapcache
	tmux unbind -aqT root
	tmux set-option -g prefix "None"
	tmux set-option -g prefix2 "None"
	TK_UNLOCK_BIND="$(grep "tmux-keylocker/scripts/unlock.sh" /tmp/tmux-keylocker/mapcache | sed "s/.*-T root *//" | sed "s/ .*//")"
	TK_TOGGLE_BIND="$(grep "tmux-keylocker/scripts/toggle.sh" /tmp/tmux-keylocker/mapcache | sed "s/.*-T root *//" | sed "s/ .*//")"
	[ "$TK_UNLOCK_BIND" ] && tmux bind "$TK_UNLOCK_BIND" -qn unlock-mappings
	[ "$TK_TOGGLE_BIND" ] && tmux bind "$TK_TOGGLE_BIND" -qn toggle-mappings
	exit 0
fi

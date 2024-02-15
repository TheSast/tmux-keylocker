#!/usr/bin/env bash
SOCKET_PATH=$(tmux display-message -p "#{socket_path}")
DATA="/tmp/tmux-keylocker-${SOCKET_PATH#/tmp/tmux-}"
if ! [ -d "$DATA" ]; then
	mkdir -p "$DATA"
	tmux list-keys | grep -- "-T root" >"$DATA/un-mapped-keys"
	echo "set-option -g $(tmux show-option -gq prefix)" >>"$DATA/un-mapped-keys"
	echo "set-option -g $(tmux show-option -gq prefix2)" >>"$DATA/un-mapped-keys"
	tmux unbind -aqT root
	tmux set-option -g prefix "None"
	tmux set-option -g prefix2 "None"
	grep -E "tmux-(key)?locker/scripts/(unlock)|(toggle)\.sh" "$DATA/un-mapped-keys" >"$DATA/re-mapped-keys"
	tmux source "$DATA/re-mapped-keys"
fi

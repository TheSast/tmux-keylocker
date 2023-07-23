if [ -f "/tmp/tmux-locker/mapcache" ]; then
	tmux source /tmp/tmux-locker/mapcache
	rm /tmp/tmux-locker/mapcache -f
else
	tmux list-keys | grep -- "-T root" >/tmp/tmux-locker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix)" >>/tmp/tmux-locker/mapcache
	echo "set-option -g $(tmux show-option -gq prefix2)" >>/tmp/tmux-locker/mapcache
	tmux unbind -aqT root
	tmux set-option -g prefix "None"
	tmux set-option -g prefix2 "None"
	TL_BIND="$(grep "tmux-locker/scripts/lock.sh" /tmp/tmux-locker/mapcache | sed "s/.*-T root *//" | sed "s/ .*//")"
	[ "$TL_BIND" ] && tmux bind "$TL_BIND" -qn lock-mappings
	exit 0
fi

#!/usr/bin/env bash

TL_HOME="$(command cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$TL_HOME/scripts/helpers.sh"

TL_BIND="$(tmux_option_or_fallback "@keylocker-bind" "C-g")"

mkdir /tmp/tmux-keylocker/ 2>/dev/null

if ! tmux show-option -g command-alias | grep -q "lock-mappings="; then
	tmux set -ga command-alias lock-mappings="run -b '$TL_HOME/scripts/lock.sh'"
fi

tmux bind -n "$TL_BIND" lock-mappings

#!/usr/bin/env bash

TK_HOME="$(command cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$TK_HOME/scripts/helpers.sh"

TK_TOGGLE_BIND="$(tmux_option_or_fallback "@keylocker-toggle-bind" "C-g")"
TK_LOCK_BIND="$(tmux_option "@keylocker-lock-bind")"
TK_UNLOCK_BIND="$(tmux_option "@keylocker-unlock-bind")"

mkdir -p /tmp/tmux-keylocker/ 2>/dev/null

if ! tmux show-option -g command-alias | grep -q "(?<!un)lock-mappings="; then
	tmux set -ga command-alias lock-mappings="run -b '$TK_HOME/scripts/lock.sh'"
fi

if ! tmux show-option -g command-alias | grep -q "unlock-mappings="; then
	tmux set -ga command-alias unlock-mappings="run -b '$TK_HOME/scripts/unlock.sh'"
fi

if ! tmux show-option -g command-alias | grep -q "toggle-mappings="; then
	tmux set -ga command-alias toggle-mappings="run -b '$TK_HOME/scripts/toggle.sh'"
fi

[ "$TK_LOCK_BIND" ] && tmux bind -n "$TK_LOCK_BIND" lock-mappings
[ "$TK_UNLOCK_BIND" ] && tmux bind -n "$TK_UNLOCK_BIND" unlock-mappings
tmux bind -n "$TK_TOGGLE_BIND" toggle-mappings

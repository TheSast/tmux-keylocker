Tmux Keylocker
=======

This tmux [tpm](https://github.com/tmux-plugins/tpm) plugin allows you to lock your keybinds away for a while, until you need to use them again
<!--
Preview
-------

![img/preview.gif](img/preview.gif)   -->

Usage
-----

Either use the [configured bindings](#configuration) or run `tmux toggle-mappings` in you terminal to lock away all (other) bindings until you run it again.
You can use `tmux lock-mappings` and `tmux unlock-mappings` if you want to separate those behaviours.

Installation
------------

You can install this plugin through [tpm](https://github.com/tmux-plugins/tpm):
1. Install [tpm](https://github.com/tmux-plugins/tpm) (duh)  
2. Add this line to your `tmux.conf`:  
```tmux
set -g @plugin 'thesast/tmux-keylocker'
```
3. Install the plugin with `<prefix>I`, unless you changed `@tpm-install`, in which case you should use the keybind you set.

Configuration
-------------

This plugins offers three options to be set in your `tmux.conf` with these defaults:
```tmux
set -g @keylocker-toggle-bind 'C-g'
set -g @keylocker-lock-bind 'None'
set -g @keylocker-unlock-bind 'None'
```
to remove the pre-set binding set the related option option to `None`.

Note that these are a simple wrapper binds over the command aliases provided by the plugin.

You may also want to set your status bar to show whether or not your mappings are currently locked using the tmux option set by this plugin.
`@keylocker-status` will contain either the path to the file where the currently locked mappings are stored or `0`.

Here are some examples with and without using a script:
```tmux
set -g status-right "#{?@keylocker-status,#[fg=color255]#[bg=color208] LOCKED ,#[fg=color0]#[bg=color101] UNLOCKED }"
```
![img/status-simple-locked.png](img/status-simple-locked.png)
![img/status-unlocked.png](img/status-unlocked.png)
```tmux
set -g status-right "#(~/.config/tmux/scripts/status/keylocker.bash)"
```
```bash
#!/usr/bin/env bash
# script located in ~/.config/tmux/scripts/status/keylocker.bash
MAPPINGS="$(tmux show-option -gqv "@keylocker-status")"
[ "$MAPPINGS" = "0" ] &&
  echo "#[fg=color0]#[bg=color101] UNLOCKED " ||
  echo "#[fg=color255]#[bg=color208] LOCKED $(cat $MAPPINGS | wc -l) MAPPINGS "

```
![img/status-script-locked.png](img/status-script-locked.png)

Other plugins
-------------

You might also like these plugins:

  - [tmux-nav-master](https://github.com/TheSast/tmux-nav-master) - Easy cross-navigation between tmux and other terminal applications. 

  - [tmux-transient-status](https://github.com/TheSast/tmux-transient-status) - Automatically make your tmux status bar vanish when unneded. 

Licence
-------

[MIT and Apache 2.0](COPYRIGHT.md)

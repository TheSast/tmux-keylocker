Tmux Locker
=======

This tmux [tpm](https://github.com/tmux-plugins/tpm) plugin allow you to lock your keybinds away for a while, until you need to use them again
<!--
Preview
-------

![img/preview.gif](img/preview.gif)   -->

Usage
-----

Either use the [configured binding](#configuration) or run `tmux locker-binding` in you terminal to lock away all (other) bindings.

Installation
------------

You can install this plugin through [tpm](https://github.com/tmux-plugins/tpm):
1. Install [tpm](https://github.com/tmux-plugins/tpm) (duh)  
2. Add this line to your `tmux.conf`:  
```tmux
set -g @plugin 'thesast/tmux-locker'
```
3. Install the plugin with `<prefix>I`, unless you changed `@tpm-install`, in which case you should use the keybind you set.

Configuration
-------------

This plugins offers one option to be set in your `tmux.conf` with this default:
```tmux
set -g @locker-bind 'C-g'
```
to remove this binding set this option to `None`.

Other plugins
-------------

You might also like these plugins:

  - [tmux-nav-master](https://github.com/TheSast/tmux-nav-master) - Easy cross-navigation with tmux and other programs. 

  - [tmux-transient-status](https://github.com/TheSast/tmux-transient-status) - Automatically make your tmux status bar vanish when unneded. 

Licence
-------

[MIT and Apache 2.0](COPYRIGHT.md)

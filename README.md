Dotfiles
========

This is the repository of my dotfiles (config files).
I use it on GNU/Linux (mainly Ubuntu).

It uses [Dotbot][dotbot] to handle the installation and management of the dotfiles symlinks.

Instalation
-----------

To install the dotfiles on a GNU/Linux system use:
```
$ git clone https://github.com/eemece2/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install
```
This will create a symlink in the correct place in your home directory to each dotfile.
The install script is idempotent - running it multiple times won't cause any issues, it will just update the git submodules.


License
-------

This software is hereby released into the public domain. That means you can do
whatever you want with it without restriction. See `LICENSE.md` for details.

That being said, I would appreciate it if you could maintain a link back to
Dotbot (or this repository) to help other people discover Dotbot.

[dotbot]: https://github.com/anishathalye/dotbot

# Dotfiles

This repository contains my personal dotfiles and is based on [michaeljsmalley's dotfiles repository](https://github.com/michaeljsmalley/dotfiles).

## Installation

``` bash
$ git clone git://github.com/ericgio/dotfiles ~/dotfiles
$ cd ~/dotfiles
$ chmod +x install.sh
$ ./install.sh
```

The install script will:

1. Back up any existing dotfiles in your home directory to `~/dotfiles/old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in your home directory


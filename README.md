# Dotfiles

My personal dotfiles, based on [mathiasbynens's excellent dotfiles repository](https://github.com/mathiasbynens/dotfiles).

## Installation
``` bash
$ git clone https://github.com/ericgio/dotfiles.git && cd dotfiles && source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:
```bash
$ set -- -f; source bootstrap.sh
```

## Installing Homebrew formulae
```bash
# Set proper permissions on the script the first time around.
$ chmod +x brew.sh
$ ./brew.sh
```

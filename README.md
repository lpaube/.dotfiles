## Installation
Execute the following to install dotfiles to the $HOME directory:
```
curl -Lks https://raw.githubusercontent.com/lpaube/.dotfiles/main/.install-config.sh \
| /bin/bash
```

## How to Use
The alias ``config`` is used as a replacement to ``git``.

Example:
```
config add .vimrc
config commit -m "Added vimrc"
config push -u origin main
```

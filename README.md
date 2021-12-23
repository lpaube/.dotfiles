## Installation
Execute the following to install my dotfiles to your $HOME directory:
```
curl -Lks https://tinyurl.com/lpaubedotfiles | /bin/bash
```

## How to Use
The alias ``config`` is used as a replacement to ``git``.

Example:
```
config add .vimrc
config commit -m "Added vimrc"
config push -u origin main
```

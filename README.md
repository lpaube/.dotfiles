## Installation
Execute one of the following one-liner to install my dotfiles to your $HOME directory:

**Linux:**
```
curl -Lks https://tinyurl.com/dotlinux | /bin/bash
```

**Generic:**
```
curl -Lks https://tinyurl.com/2p88vfk4 | /bin/bash
```

## How to Use
The alias ``config`` is used as a replacement to ``git``.

Example:
```
config add .vimrc
config commit -m "Added vimrc"
config push -u origin main
```

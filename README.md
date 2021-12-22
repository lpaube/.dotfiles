##Installation
Copy and execute this in the terminal to install:
```
curl -Lks https://raw.githubusercontent.com/lpaube/.dotfiles/main/.install-config.sh \
| /bin/bash
```

##How to Use
The keywork ``config`` is used as a replacement to ``git``. Examples:
```
config add .vimrc
config commit -m "Added vimrc"
config push -u origin main
```

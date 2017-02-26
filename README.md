# Reconfigured on 2017-02-21 to use dotfiler from (git@github.com:svetlyak40wt/dotfiler.git)

To start with, install dotfiler in ~/.dotfiles with

```bash
cd $HOME
git clone git@github.com:petonic/dotfiler.git .dotfiles
```

### Install zsh on RPI if necessary
```
sudo apt-get zsh

# Set login shell to zsh
chsh -s $(which zsh)

# Install Oh-My-Zsh
cd $HOME
rm -rf .oh-my-zsh
git clone git@github.com:petonic/oh-my-zsh.git .oh-my-zsh

# Install thefuck
sudo pip install thefuck

```


# Steps to convert existing PI using old RPICONFIG mechanism

```
#! /bin/bash

cd $HOME
cat > conf-install <<ENDOFFILE
#!/bin/sh
set -x 
set -e
cd $HOME
mkdir ~/.dotfiles
cd ~/.dotfiles

git clone git@github.com:petonic/dotfiler.git .
PATH=$PATH:~/.dotfiles/bin

git clone git@github.com:petonic/config.git

git clone git@github.com:petonic/config-rpi.git

# Check to see what will happen with a dry run
bin/dot update -v --dry

ENDOFFILE
```

# Used for a production install -- force overwrite

Only use this after you've installed all of the preceding items.

```
cd $HOME/.dotfiles
bin/dot update -v -f 

```

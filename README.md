# Reconfigured on 2017-02-21 to use dotfiler from (git@github.com:svetlyak40wt/dotfiler.git)

To start with, install dotfiler in ~/.dotfiles with

```bash
cd $HOME
git clone git@github.com:petonic/dotfiler.git .dotfiles
```

### Install zsh on RPI if necessary

Only copy/paste this line because it may prompt you...

```
sudo apt-get -y install zsh
```

Now, install the supporting items for ZSH.

```bash
# Set login shell to zsh
sudo chsh -s $(which zsh)

# Install Oh-My-Zsh
cd $HOME
rm -rf .oh-my-zsh
git clone git@github.com:petonic/oh-my-zsh.git .oh-my-zsh

# Install thefuck
sudo pip2 install thefuck

```


# Steps to convert existing PI using old RPICONFIG mechanism

```
cd $HOME/.dotfiles

cat > conf-install <<ENDOFFILE
#!/bin/sh
set -x 
set -e

git clone git@github.com:petonic/config.git

git clone git@github.com:petonic/config-rpi.git


ENDOFFILE

sh ./conf-install

# Check to see what will happen with a dry run
bin/dot update -v -f --dry

```

# Used for a production install -- force overwrite

Only use this after you've installed all of the preceding items.

```
cd $HOME/.dotfiles
bin/dot update -v -f 

```

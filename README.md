# Reconfigured on 2017-02-21 to use dotfiler from (git@github.com:svetlyak40wt/dotfiler.git)

### Reinstallation over old dotfiles setup.

If you're reinstalling the dotfiles from github, then you'll want to do the following:

```bash

# Copy the contents of the .ssh/id_rsa* files to be their contents
# instead of symbolic links.
cd $HOME/.ssh; for i in id_rsa*; do cat $i > out; mv out $i; done; chmod 0600 id_rsa

# Blow away the old .dotfiles directory
cd $HOME
rm -rf .dotfiles

```
To start with, install dotfiler in ~/.dotfiles with

```bash

cd $HOME
git clone git@github.com:petonic/dotfiler.git .dotfiles

```

### Install zsh on RPI if necessary

Instal, ZSH and supporting packages if necessary

```

# Install python-dev as a pre-req, if necessary
# Might take a long time on an RPI...
sudo apt-get -y install python-dev

# Now install zsh
sudo apt-get -y install zsh

# Set login shell to zsh
sudo chsh -s $(which zsh)

# Install Oh-My-Zsh
cd $HOME
rm -rf .oh-my-zsh
git clone git@github.com:petonic/oh-my-zsh.git .oh-my-zsh

# Install thefuck
sudo pip2 install psutil scandir thefuck

```


# Steps to convert existing PI using old RPICONFIG mechanism

```
cd $HOME/.dotfiles
||||||| merged common ancestors

cat > conf-install <<ENDOFFILE
#!/bin/sh
set -x
set -e

=======

cat > conf-install <<ENDOFFILE
#!/bin/sh
set -x
set -e

git clone git@github.com:petonic/config.git
git clone git@github.com:petonic/config-rpi.git

# Check to see what will happen with a dry run
bin/dot update -v -f --dry
chmod 0600 ~/.ssh/id_rsa
####################### End -- press up twice and erase --dry to execute

```

# Used for a production install -- force overwrite

Only use this after you've installed all of the preceding items.

```
cd $HOME/.dotfiles
bin/dot update -v -f
chmod 0600 ~/.ssh/id_rsa
||||||| merged common ancestors
bin/dot update -v -f
=======
bin/dot update -v -f

```

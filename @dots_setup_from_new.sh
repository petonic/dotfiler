#! /bin/sh
#
# This script sets up a new RPI with DOTFILER.
#
#

die() {
    echo "$0: error: $*" >&2
    exit 9
}

mkdir ~/.dotfiles || die "cannot make ~/.dotfiles"

cd ~/.dotfiles

git clone git@github.com:svetlyak40wt/dotfiler.git . || \
    die "error cloning public dotfiler repo"

PATH=$PATH:~/.dotfiles/bin

mkdir rpiconfig
cd rpiconfig
git clone git@github.com:petonic/rpiconfig.git . ||
    die "error cloning rpiconfig.git -- maybe a perms problem\n" \
        "git clone git@github.com:petonic/rpiconfig.git"

# One time, make a symlink from the dot executable that we just
# loaded to our $BIN

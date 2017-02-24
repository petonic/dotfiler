#! /bin/sh
#
# This script blows away the old configurations that were either
# in place old-school, or from a previous run of "dot" and is only
# to be run when you want to totally initialize something new.
#
#

die() {
    echo "$0: error: $*" >&2
    exit 9
}


cd $HOME/.dotfiles/rpiconfig || \
    die "doesn't appear as if you've run the @setup_initial.sh script"

cat > ONETIMESCRIPT <<EndOfScript
#! /bin/sh
#
# Script to be run one-time on an RPI to switch from using my hacked
# github rpiconfig to using dotfiler.  Thse files must not be there
# so that symlinks can be inserted

set -x

rm -f $HOME/.bash_logout
rm -f $HOME/.bash_profile
rm -f $HOME/.bashlpr
rm -f $HOME/.bashlrc
rm -f $HOME/.bashrc
rm -f $HOME/.iterm2/imgcat
rm -f $HOME/.iterm2/it2dl
rm -f $HOME/.iterm2_shell_integration.bash
rm -f $HOME/.lessrc
rm -f $HOME/.oh-my-zsh/custom/01-PETONIC-GLOB.zsh
rm -f $HOME/.oh-my-zsh/custom/90-RPI-SPECIFIC.zsh
rm -f $HOME/.oh-my-zsh/custom/example.zsh
rm -f $HOME/.oh-my-zsh/custom/plugins/example/example.plugin.zsh
rm -f $HOME/.pdbrc.py
rm -f $HOME/.profile
rm -f $HOME/.ssh/authorized_keys
rm -f $HOME/.ssh/id_rsa
rm -f $HOME/.ssh/id_rsa.pub
rm -f $HOME/.ssh/known_hosts
rm -f $HOME/.ssh/wpa_supplicant.conf
rm -f $HOME/.zshrc
rm -f $HOME/bin/BackupCopy
rm -f $HOME/bin/BackupCreate
rm -f $HOME/bin/bell
rm -f $HOME/bin/ag
rm -f $HOME/bin/git-remdiff
rm -f $HOME/bin/git-remfetch
rm -f $HOME/bin/halt
rm -f $HOME/bin/m
rm -f $HOME/bin/nfs0start
rm -f $HOME/bin/reboot
rm -f $HOME/bin/rmate
rm -f $HOME/bin/rmate.old
rm -f $HOME/bin/rmatea
rm -f $HOME/bin/rpi-clone
rm -f $HOME/bin/shutdown
rm -f $HOME/bin/w1ReadDevs
rm -f $HOME/bin/wakeup-display
EndOfScript

chmod +x ONETIMESCRIPT

./ONETIMESCRIPT
chmod 0600 rpiconfig/.ssh/id_rsa ~/.ssh/id_rsa

rm ONETIMESCRIPT
cd ..
bin/dot update

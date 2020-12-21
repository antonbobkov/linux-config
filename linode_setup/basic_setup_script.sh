#!/bin/bash

# Run this script via:
# scp ~/.ssh/github_key_12_21_20* linode:~/.ssh/
# ssh linode 'bash -s' < ~/linux-config/linode_setup/basic_setup_script.sh

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install emacs git -y

cat <<EOF >> .bashrc

HISTTIMEFORMAT="%F %T "
HISTFILESIZE=-1
HISTSIZE=-1
HISTCONTROL=ignoredups:erasedups
HISTIGNORE=?:??
shopt -s histappend                 # append to history, don't overwrite it
# attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# alias for ll
alias ll="ls -la"

function lazygit() {
  git add . &&
  git commit -a -m "boop: $1" &&
  git push
}

EOF


cat <<EOF >> ~/.ssh/config

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_key_12_21_20
    StrictHostKeyChecking no

EOF

git config --global user.email "texfan@gmail.com"
git config --global user.name "anton_linode"

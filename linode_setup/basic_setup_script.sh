#!/bin/bash

# Run this script via:
# ssh linode 'bash -s' < linode_setup/basic_setup_script.sh

# sudo apt-get update -y
# sudo apt-get upgrade -y
# sudo apt-get install emacs git -y

#cat <<EOF >> .bashrc
cat <<EOF >> /dev/null

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

EOF




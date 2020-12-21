#!/bin/bash

# Run this script via:
# ssh root@linode 'bash -s' < linode_setup/root_script.sh

# Setup user anton 
adduser --disabled-password --gecos "" anton
usermod -aG sudo anton

# Setup ssh access
mkdir /home/anton/.ssh

# .ssh/apt-desktop-cygwin.pub
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC9wihvfO4YCAVAPYg4s9UpYJ1Xfh2iGccQwTn7GvF41p4Zy6XHihPaZAR9YtyJjk1FwkZWhfgPMKO+hTi4OgjQjpwdTq1Dbe+U6MA25g8Nm3f6W1obMtHIf3Vu+hlBtj1cuzz/GQbwVmDxYQNFQASdqa0iF9OsKzHKftGasU0j4gsy6RIrY7mjeNukgnHMxRrU840Ybpb7TRzNPJlYEcrkv4AZKUE/WOYlxcIGLJZu2VpJiMaThGhrGv190EjW9um70rVu+75cL8HLBJrbZWVA6WK+dY73gh63mVjs0/uBmXyttx982raaplXF0r3f9YJMAfmPx9Js6cjZgp/l2Ag4MwS7KZFVO46HkV10RtEgPTF12Y7/x+Oldd7BlEz3qNGy1DWmSqOSMx/Sd/lN1TlzN432HXilB9S5wDqoebgYzg2KIA8ZdVvvd0czxbWOct+qWro6bmqvvlKoeUAPe7tkNcRQ8Vqe2OCnyBT+RjWRL+wpTbFVheZPKVbc5o5IYSk=" > /home/anton/.ssh/authorized_keys

# Make ssh more secure
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
systemctl restart ssh

# Add anton to no password sudoer
echo 'anton ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Temp password:


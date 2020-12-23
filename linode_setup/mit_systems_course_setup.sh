#!/bin/bash

git clone git@github.com:antonbobkov/mit-systems-course.git ~/mit-systems-course
sudo apt-get install golang -y

# Main course page https://pdos.csail.mit.edu/6.824/schedule.html

# mapreduce lab
# https://pdos.csail.mit.edu/6.824/labs/lab-mr.html
git clone git://g.csail.mit.edu/6.824-golabs-2020 ~/6.824


# ~/.emacs

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "https://melpa.org/packages/")
   t))
   
# in emacs
# M-x package-refresh-contents and then M-x package-install RET go-mode RET

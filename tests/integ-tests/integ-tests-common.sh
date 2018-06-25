#!/usr/bin/env bash
#
# This is executed on bash, zsh and fish.


pearl install default/dot-vim
pearl update test

[ ! -e $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]
pearl install default/sesaila
pearl update test

kyrat -v -o "StrictHostKeyChecking no" localhost -- q
[ -e $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]

[ ! -e $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]
pearl install default/dot-bash
pearl update test
kyrat -v -o "StrictHostKeyChecking no" localhost -- "[[ \\\$EDITOR == \"vim\" ]]"
[ -e $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]

pearl remove sesaila dot-bash dot-vim

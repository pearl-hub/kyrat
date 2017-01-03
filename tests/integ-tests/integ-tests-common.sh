#!/usr/bin/env bash
#
# This is executed on bash, zsh and fish.

pearl install dot-vim

[ ! -e $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]
pearl install sesaila
kyrat -v -o "StrictHostKeyChecking no" localhost -- q
[ -e $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]

[ ! -e $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]
pearl install dot-bash
kyrat -v -o "StrictHostKeyChecking no" localhost -- "[[ \\\$EDITOR == \"vim\" ]]"
[ -e $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]

[ ! -e $HOME/.config/kyrat/bashrc.d/pearl_ops.sh ]
pearl install ops
kyrat -v -o "StrictHostKeyChecking no" localhost -- memmost
[ -e $HOME/.config/kyrat/bashrc.d/pearl_ops.sh ]

pearl update test
pearl remove test

pearl remove sesaila dot-bash ops dot-vim

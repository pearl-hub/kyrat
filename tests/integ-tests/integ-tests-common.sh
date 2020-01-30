#!/usr/bin/env bash
#
# This is executed on bash, zsh and fish.


[ -e $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]
[ -e $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]
[ -e $HOME/.config/kyrat/inputrc.d/pearl_inputrc ]
[ -e $HOME/.config/kyrat/vimrc.d/pearl_vimrc ]

kyrat -v -o "StrictHostKeyChecking no" localhost -- q

kyrat -v -o "StrictHostKeyChecking no" localhost -- "[[ \\\$EDITOR == \"vim\" ]]"

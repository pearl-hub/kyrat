#!/bin/bash

set -e

source $HOME/.bashrc

pearl install test

[ -d $PEARL_HOME/packages/default/test ] || { echo "Error: The package test does not exist after installing it."; exit 1; }

source ./tests/integ-tests/integ-tests-common.sh

KYRAT_HOME="$HOME/.config/kyrat"
for path in "$KYRAT_HOME/bashrc.d/pearl_*" \
            "$KYRAT_HOME/inputrc.d/pearl_*" \
            "$KYRAT_HOME/vimrc.d/pearl_*"
do
    [ ! -e $path ]
done


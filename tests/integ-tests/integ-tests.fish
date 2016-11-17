#!/usr/bin/fish
#
source $HOME/.config/fish/config.fish

pearl install test

# Fish trap may not work from time to time.
# Forcing the sourcing here:
source $HOME/.config/fish/config.fish

if [ ! -d $PEARL_HOME/packages/default/test ]
    echo "Error: The package test does not exist after installing it."
    exit 1
end

source ./tests/integ-tests/integ-tests-common.sh

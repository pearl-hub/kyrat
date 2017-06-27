#!/usr/bin/env bash
PKG_LOCATION="$(dirname $0)/../.."
source "$PKG_LOCATION/tests/bunit/utils/utils.sh"
source "$PKG_LOCATION/tests/test-utils/utils.sh"

# Disable the exiterr
set +e

function oneTimeSetUp(){
    setUpUnitTests
}

function oneTimeTearDown(){
    :
}

function setUp(){
    pearlSetUp
    mkdir -p $PEARL_HOME/packages/pearl/sesaila
    touch $PEARL_HOME/packages/pearl/sesaila/aliases
    mkdir -p $PEARL_HOME/packages/pearl/ops
    touch $PEARL_HOME/packages/pearl/ops/ops.sh
    mkdir -p $PEARL_HOME/packages/pearl/dot-bash
    touch $PEARL_HOME/packages/pearl/dot-bash/bash.bash
    mkdir -p $PEARL_HOME/packages/pearl/dot-bash
    touch $PEARL_HOME/packages/pearl/dot-bash/inputrc
    mkdir -p $PEARL_HOME/packages/pearl/dot-vim
    touch $PEARL_HOME/packages/pearl/dot-vim/vimrc
}

function tearDown(){
    pearlTearDown
}

function test_kyrat(){
    assertCommandFailOnStatus 255 $PKG_LOCATION/bin/kyrat --help
    [[ -L $HOME/.config/kyrat/bashrc.d/pearl_aliases.sh ]]
    assertEquals 0 $?
    [[ -L $HOME/.config/kyrat/bashrc.d/pearl_ops.sh ]]
    assertEquals 0 $?
    [[ -L $HOME/.config/kyrat/bashrc.d/pearl_bash.sh ]]
    assertEquals 0 $?
    [[ -L $HOME/.config/kyrat/vimrc.d/pearl_vimrc ]]
    assertEquals 0 $?
    [[ -L $HOME/.config/kyrat/inputrc.d/pearl_inputrc ]]
    assertEquals 0 $?
}

source $PKG_LOCATION/tests/bunit/utils/shunit2

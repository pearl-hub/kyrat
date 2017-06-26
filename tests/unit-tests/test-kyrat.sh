#!/usr/bin/env bash

source "$(dirname $0)/../utils/utils.sh"

KYRAT_LOCATION="$(dirname $0)/../.."

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
    kyratSetUp
}

function tearDown(){
    kyratTearDown
    pearlTearDown
}

function test_kyrat(){
    assertCommandFailOnStatus 255 $KYRAT_LOCATION/bin/kyrat --help
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

source $(dirname $0)/../utils/shunit2

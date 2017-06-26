
unset PEARL_ROOT HOME
OLD_PWD=$PWD

function pearlSetUp() {
    export PEARL_ROOT=$(TMPDIR=/tmp mktemp -d -t pearl-test-root.XXXXXXX)
    export PEARL_HOME=$(TMPDIR=/tmp mktemp -d -t pearl-test-home.XXXXXXX)
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

function pearlTearDown(){
    rm -rf $PEARL_ROOT
    rm -rf $PEARL_HOME
    unset PEARL_ROOT PEARL_HOME
}

function kyratSetUp(){
    unset HOME
    export HOME=$(TMPDIR=/tmp mktemp -d -t pearl-user-home.XXXXXXX)
}

function kyratTearDown(){
    cd $OLD_PWD
    rm -rf $HOME
}

function setUpUnitTests(){
    OUTPUT_DIR="${SHUNIT_TMPDIR}/output"
    mkdir "${OUTPUT_DIR}"
    STDOUTF="${OUTPUT_DIR}/stdout"
    STDERRF="${OUTPUT_DIR}/stderr"
}

function assertCommandSuccess(){
    $(set -e
      "$@" > $STDOUTF 2> $STDERRF
    )
    assertTrue "The command $1 did not return 0 exit status" $?
}

function assertCommandFail(){
    $(set -e
      "$@" > $STDOUTF 2> $STDERRF
    )
    assertFalse "The command $1 returned 0 exit status" $?
}

# $1: expected exit status
# $2-: The command under test
function assertCommandFailOnStatus(){
    local status=$1
    shift
    $(set -e
      "$@" > $STDOUTF 2> $STDERRF
    )
    assertEquals $status $?
}

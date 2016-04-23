function pre_remove(){
    rm -f ${HOME}/.config/kyrat/bashrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/inputrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/vimrc.d/pearl_* 2> /dev/null
    return 0
}

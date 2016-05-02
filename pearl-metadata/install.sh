function post_install(){
    ln -s "${PEARL_PKGDIR}/bin/kyrat" ${PEARL_HOME}/bin
}

function pre_remove(){
    rm -f ${PEARL_HOME}/bin/kyrat

    rm -f ${HOME}/.config/kyrat/bashrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/inputrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/vimrc.d/pearl_* 2> /dev/null
    return 0
}

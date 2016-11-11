function post_install(){
    link_to_path "${PEARL_PKGDIR}/bin/kyrat"
}

function post_update(){
    post_install
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGDIR}/bin/kyrat"

    rm -f ${HOME}/.config/kyrat/bashrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/inputrc.d/pearl_* 2> /dev/null
    rm -f ${HOME}/.config/kyrat/vimrc.d/pearl_* 2> /dev/null
    return 0
}

function post_install(){
    link_to_path "${PEARL_PKGDIR}/bin/kyrat"

    info "Install the following Pearl packages"
    info "to get the related dotfiles/configurations in the ssh session"
    info "when accessing with kyrat:"
    info "> pearl install sesaila dot-bash dot-vim"

    return 0
}

function post_update(){
    post_install

    return 0
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGDIR}/bin/kyrat"

    local kyrat_home="${HOME}/.config/kyrat"

    for path in $kyrat_home/bashrc.d/pearl_* \
                $kyrat_home/inputrc.d/pearl_* \
                $kyrat_home/vimrc.d/pearl_*
    do
        [[ -e $path ]] && rm -f "$path"
    done

    return 0
}

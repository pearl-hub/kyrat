function post_install(){
    local giturl=https://github.com/fsquillace/kyrat.git

    info "Installing or updating the ${PEARL_PKGNAME} git repository..."
    install_or_update_git_repo $giturl "${PEARL_PKGVARDIR}/kyrat" master

    link_to_path "${PEARL_PKGVARDIR}/kyrat/bin/kyrat"


    local kyrat_home=${HOME}/.config/kyrat
    # Creates kyrat home directories if they do not exist
    mkdir -p "${kyrat_home}/bashrc.d/"
    mkdir -p "${kyrat_home}/inputrc.d/"
    mkdir -p "${kyrat_home}/vimrc.d/"

    local kyrat_aliases=${kyrat_home}/bashrc.d/pearl_aliases.sh
    local pearl_aliases=$PEARL_HOME/packages/${PEARL_PKGREPONAME}/sesaila/aliases

    local kyrat_bash=${kyrat_home}/bashrc.d/pearl_bash.sh
    local pearl_bash=$PEARL_HOME/packages/${PEARL_PKGREPONAME}/dot-bash/bash.bash

    local kyrat_inputrc=${kyrat_home}/inputrc.d/pearl_inputrc
    local pearl_inputrc=$PEARL_HOME/packages/${PEARL_PKGREPONAME}/dot-bash/inputrc

    local kyrat_vim=${kyrat_home}/vimrc.d/pearl_vimrc
    local pearl_vim=$PEARL_HOME/packages/${PEARL_PKGREPONAME}/dot-vim/vimrc

    [ -f "${pearl_aliases}" ] && { \
        info "Detected configuration from sesaila package. Installing it into kyrat...";
        link_to "${pearl_aliases}" "${kyrat_aliases}";
    }
    [ -f "${pearl_bash}" ] && { \
        info "Detected configuration from dot-bash package. Installing it into kyrat...";
        link_to "${pearl_bash}" "${kyrat_bash}"
    }
    [ -f "${pearl_inputrc}" ] && { \
        info "Detected inputrc configuration from dot-bash package. Installing it into kyrat...";
        link_to "${pearl_inputrc}" "${kyrat_inputrc}"
    }
    [ -f "${pearl_vim}" ] && { \
        info "Detected configuration from dot-vim package. Installing it into kyrat...";
        link_to "${pearl_vim}" "${kyrat_vim}"
    }

    echo
    info "Install the following Pearl packages"
    info "to get the related dotfiles/configurations in the ssh session"
    info "when accessing with kyrat:"
    info "> pearl install sesaila dot-bash dot-vim"
    info "And update this package afterwards:"
    info "> pearl update ${PEARL_PKGNAME}"

    return 0
}

function post_update(){
    post_install

    return 0
}

function pre_remove(){
    unlink_from_path "${PEARL_PKGVARDIR}/kyrat/bin/kyrat"

    local kyrat_home="${HOME}/.config/kyrat"

    for path in $kyrat_home/bashrc.d/pearl_* \
                $kyrat_home/inputrc.d/pearl_* \
                $kyrat_home/vimrc.d/pearl_*
    do
        [[ -e $path ]] && rm -f "$path"
    done

    rm -rf $PEARL_PKGVARDIR/kyrat
    return 0
}

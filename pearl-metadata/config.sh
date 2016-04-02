
MANPATH=$MANPATH:$PEARL_PKGDIR/module/man
source ${PEARL_PKGDIR}/module/lib/ssh_pearl.sh
PATH=$PATH:$PEARL_PKGDIR/module/bin


mkdir -p "${PEARL_HOME}/sshrc.d/"
[ ! -f "${PEARL_HOME}/sshrc.d/pearl_aliases.sh" ] && \
    [ -f "$PEARL_HOME/packages/pearl/sesalia/aliases.sh" ] && \
    ln -s "$PEARL_HOME/packages/pearl/sesalia/aliases.sh" "${PEARL_HOME}/sshrc.d/pearl_aliases.sh"

[ ! -f "${PEARL_HOME}/sshrc.d/pearl_ops.sh" ] && \
    [ -f "$PEARL_HOME/packages/pearl/ops/ops.sh" ] && \
    ln -s "$PEARL_HOME/packages/pearl/ops/ops.sh" "${PEARL_HOME}/sshrc.d/pearl_ops.sh"

[ ! -f "${PEARL_HOME}/sshrc.d/pearl_core.sh" ] && \
    [ -f "$PEARL_HOME/packages/pearl/bash/bash.bash" ] && \
    ln -s "$PEARL_HOME/packages/pearl/bash/bash.bash" "${PEARL_HOME}/sshrc.d/pearl_core.sh"

mkdir -p "${PEARL_HOME}/sshinputrc.d/"
[ ! -f "${PEARL_HOME}/sshinputrc.d/pearl_inputrc" ] && \
    [ -f "$PEARL_HOME/packages/pearl/bash/inputrc" ] && \
    ln -s "$PEARL_HOME/packages/pearl/bash/inputrc" "${PEARL_HOME}/sshinputrc.d/pearl_inputrc"

mkdir -p "${PEARL_HOME}/sshvimrc.d/"
[ ! -f "${PEARL_HOME}/sshvimrc.d/pearl_vimrc" ] && \
    [ -f "$PEARL_HOME/packages/pearl/vim/vimrc" ] && \
    ln -s "$PEARL_HOME/packages/pearl/vim/vimrc" "${PEARL_HOME}/sshvimrc.d/pearl_vimrc"

return 0
# vim: ft=sh

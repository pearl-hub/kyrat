if [[ $MANPATH != *"${PEARL_PKGDIR}/module/man"* ]]
then
    MANPATH=$MANPATH:$PEARL_PKGDIR/module/man
fi

return 0
# vim: ft=sh

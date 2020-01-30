#!/usr/bin/env bash


echo 'PEARL_PACKAGES["sesaila"]={"url": "https://github.com/pearl-hub/sesaila.git"}' >> $HOME/.config/pearl/pearl.conf
echo 'PEARL_PACKAGES["dot-vim"]={"url": "https://github.com/pearl-hub/dot-vim.git"}' >> $HOME/.config/pearl/pearl.conf
echo 'PEARL_PACKAGES["dot-bash"]={"url": "https://github.com/pearl-hub/dot-bash.git"}' >> $HOME/.config/pearl/pearl.conf
echo "PEARL_PACKAGES['test']={'url': '${PWD}', 'depends': ('sesaila', 'dot-vim', 'dot-bash',)}" >> ~/.config/pearl/pearl.conf

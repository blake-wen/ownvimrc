#!/bin/bash

#========== note  ===========#
#This file will install dependent file which vim plugin need.
#============================#

# clone vim plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# neoclide/coc.nvimi Note: you have to switch to sudo -i
#sudo curl -sL install-node.now.sh/lts | bash

# combine Ack.vim and it can be a powerful search
sudo apt-get install silversearcher-ag

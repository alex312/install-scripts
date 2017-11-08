#!/bin/bash
# Install and Config VIM

command -v vim >/dev/null 2>&1 || {
    echo "Install VIM";
    sudo apt-get install vim;
}
vim --version | awk 'NR==1{print}'

# Create Dir $HOME/.vim/bundle if not exist
VIM_BUNDLE_DIR=~/.vim/bundle
if [ ! -d "$VIM_BUNDLE_DIR" ]; then
    echo "Create $VIM_BUNDLE_DIR"
    mkdir -p $VIM_BUNDLE_DIR
fi

VIM_CONFIG_DIR=~/.vim/config
if [ ! -d "$VIM_CONFIG_DIR" ]; then
    echo "Create $VIM_CONFIG_DIR"
    mkdir -p $VIM_CONFIG_DIR
fi

#install Vundle to Manage vim plug-in
VUNDLE_DIR=$VIM_BUNDLE_DIR/Vundle.vim
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Install Vundle.vim to " $VUNDLE_DIR
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

USER_VIMRC_FILE=~/.vimrc
if [ ! -f "$USER_VIMRC_FILE" ]; then
    echo "Create vimrc at " $USER_VIMRC_FILE
    echo "" > $USER_VIMRC_FILE
fi

#======================= start init vim common config ========================
VIM_COMMON_FILE=$VIM_CONFIG_DIR/vimcommon.vimrc
if [ ! -f "$VIM_COMMON_FILE" ]; then
	echo "Create VIM common config file" $VIM_COMMON_FILE
	cp ~/install-scripts/vimconfigs/vimcommon.vimrc $VIM_COMMON_FILE
fi
grep $VIM_COMMON_FILE $USER_VIMRC_FILE
if [ $? -eq 1  ]; then
	echo "Add code to load vim common config file" $VIM_COMMON_FILE
	sed -i '$a \"vim common config' $USER_VIMRC_FILE
	sed -i '1i source '''$VIM_COMMON_FILE''' ' $USER_VIMRC_FILE
fi
#======================= start init vim common config ========================


#======================= start init vundle config ===========================
VUNDLE_CONFIG_FILE=$VIM_CONFIG_DIR/vundle.vimrc
if [ ! -f "$VUNDLE_CONFIG_FILE" ]; then
    echo "Create Vundle config file" $VUNDLE_CONFIG_FILE
    cp ~/install-scripts/vimconfigs/vundle.vimrc $VUNDLE_CONFIG_FILE
fi

grep $VUNDLE_CONFIG_FILE $USER_VIMRC_FILE
if [ $? -eq 1 ]; then
    echo "Add code to load vundle config file"
    sed -i '$a \"vundle config' $USER_VIMRC_FILE
    sed -i '$a source '''$VUNDLE_CONFIG_FILE''' ' $USER_VIMRC_FILE
fi
#======================= end init vundle config ===========================

#======================= start init nerdtree config ===========================
NERDTREE_CONFIG_FILE=$VIM_CONFIG_DIR/nerdtree.vimrc
if [ ! -f "$NERDTREE_CONFIG_FILE" ]; then
	echo "Create NERDTree config file" $NRDTREE_CONFIG_FILE
	cp ~/install-scripts/vimconfigs/nerdtree.vimrc $NERDTREE_CONFIG_FILE
fi
grep $NERDTREE_CONFIG_FILE $USER_VIMRC_FILE
if [ $? -eq 1 ]; then
	echo "Add code to load nerdtree config file"
	sed -i '$a \"nerdtree config'  $USER_VIMRC_FILE
	sed -i '$a source '''$NERDTREE_CONFIG_FILE''' ' $USER_VIMRC_FILE
fi
#======================= end init nerdtree config ===========================


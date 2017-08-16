#!/bin/sh
cd  ../ && export TOOL_BOX_ROOT=`pwd`;
$TOOL_BOX_ROOT/toolbox/install-sublime.sh &&
echo "installing sphinx-doc"; 
sudo apt-get install sphinx-doc &&
echo "sphinx-doc successfully installed"; 
echo "installing python-scikits-learn";
sudo apt-get install python-scikits-learn&&
echo "python-scikits-learn successfully installed";
echo "installing python-pudb";
sudo apt-get install python-pudb &&
echo "python-pudb succefully installed";
cd $TOOL_BOX_ROOT && rm -rf .git && cd projectid && git init &&
echo "git initied successfully" &&
echo "you can link your git repo with \'git remote add origin [git url]\'";
echo "install fbdtools";
$TOOL_BOX_ROOT/toolbox/install-fbd_tools.sh && echo "fbdtools successfully installed"
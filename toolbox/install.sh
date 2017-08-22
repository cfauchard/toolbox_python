#!/bin/sh
cd  ../ && export TOOL_BOX_ROOT=`pwd`;
##
# SUBLIME
##
read -p "Do you want to install sublime ([Y(default),n]) " answer;
if test "$answer" = "n"
then
echo 'Sublime is not being installed'
else
$TOOL_BOX_ROOT/toolbox/install-sublime.sh;
fi
###
# SHPINX
###
echo "installing sphinx-doc"; 
sudo apt-get install sphinx-doc &&
echo "sphinx-doc successfully installed"; 
###
# SCIKIT LEARN
###
echo "installing python-scikits-learn";
sudo apt-get install python-scikits-learn &&
echo "python-scikits-learn successfully installed";
###
# PUDB - python debugger
###
echo "installing python-pudb";
sudo apt-get install python-pudb &&
echo "python-pudb succefully installed";
###
# REMOVE .git  and git init
###
cd $TOOL_BOX_ROOT && rm -rf .git && cd projectid && git init &&
echo "git initied successfully";
###
# INSTALL githooks
###
echo "Ready to install githooks...";
cd $TOOL_BOX_ROOT/projectid/.git/hooks; 
ln -s $TOOL_BOX_ROOT/projectid/config/hooks/pre-commit;
ln -s $TOOL_BOX_ROOT/projectid/config/hooks/commit-msg;
echo "githooks installed (symlinks created)";
echo "HINT: you can link your git repo with \'git remote add origin [git url]\'";
###
# FBD TOOLS
###
echo "Ready to install fbdtools...";
$TOOL_BOX_ROOT/toolbox/install-fbd_tools.sh && echo "fbdtools successfully installed"
#!/bin/sh
#
# Use "dev" as first arg if you want to work on the toolbox
# (you're not initialising a brand new project)
#
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
##
# pip install requirements: sphinx, pudb, nose
##
#pip install -r $TOOL_BOX_ROOT/toolbox/requirements.txt
echo 'Creating virtual env and installing packages'
read -p "Choose a name for your project (it will be used to create your virtual env) " PROJECT_NAME;
#echo 'using ' $TOOL_BOX_ROOT/toolbox/environment.yml
conda env create -f $TOOL_BOX_ROOT/toolbox/environment.yml -n $PROJECT_NAME
###
# REMOVE .git  and git init if really using the toolbox to init a brand new project.
# dev in args means you want to work on the toolbox dev
###
if [ "$1" != "dev" ]; then
	cd $TOOL_BOX_ROOT && rm -rf .git;
	cd projectid && git init &&
	echo "git initied successfully";
fi

###
# INSTALL githooks
###
echo "Ready to install githooks...";
cd $TOOL_BOX_ROOT/projectid/.git/hooks; 
#ln -s $TOOL_BOX_ROOT/projectid/config/hooks/pre-commit;
ln -s $TOOL_BOX_ROOT/projectid/config/hooks/commit-msg;
echo "githooks installed (symlinks created)";
echo "HINT: you can link your git repo with \'git remote add origin [git url]\'";
###
# FBD TOOLS
###
echo "Ready to install fbdtools...";
$TOOL_BOX_ROOT/toolbox/install-fbd_tools.sh && echo "fbdtools successfully installed"

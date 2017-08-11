#!/bin/sh
echo "installing sphinx-doc"; 
sudo apt-get install sphinx-doc &&
echo "sphinx-doc successfully installed"; 
echo "installing python-scikits-learn";
sudo apt-get install python-scikits-learn&&
echo "python-scikits-learn successfully installed";
echo "installing python-pudb";
sudo apt-get install python-pudb &&
echo "python-pudb succefully installed";
cd ../ && rm -rf .git && cd projectid && git init &&
echo "git initied successfully" &&
echo "you can link your git repo with \'git remote add origin [git url]\'";
echo "install fbdtools";
cd /tmp && git clone -b dev git@gitlab.com:sncf_fbd/fbd_tools_project.git && 
cd /tmp/fbd_tools_project && python setup.py install &&
rm -rf /tmp/fbd_tools_project
echo "fbdtools successfully installed"
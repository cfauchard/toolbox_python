#!/bin/sh

./install-sublime.sh &&
echo "installing sphinx-doc"; 
sudo apt-get install sphinx-doc &&
echo "sphinx-doc succefully installed"; 
echo "installing python-scikits-learn";
sudo apt-get install python-scikits-learn&&
echo "python-scikits-learn succefully installed";
echo "installing python-pudb";
sudo apt-get install python-pudb &&
echo "python-pudb succefully installed";
cd ../ && rm -rf .git && cd projectid && git init &&
echo "git initied successfully" &&
echo "you can link your git repo with \'git remote add origin [git url]\'"


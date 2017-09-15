read -p "Choose the fbd_tools' branch to install [develop (default), release, master]: " branch;
if test "$branch" = "" 
then branch="develop"
fi
## If branch is develop, we assume that user wants also a developement env for fbd-tools
if test branch="develop"
then 
mkdir $TOOL_BOX_ROOT/fbd_tools;
cd $TOOL_BOX_ROOT/fbd_tools && git clone -b $branch git@gitlab.com:sncf_fbd/fbd_tools_project.git ;
export PYTHONPATH=$PYTHONPATH:/$TOOL_BOX_ROOT/fbd_tools/fbd_tools_project
else
echo 'Creating temporary directory:'; echo $TOOL_BOX_ROOT/tmp;
mkdir $TOOL_BOX_ROOT/tmp;
cd $TOOL_BOX_ROOT/tmp && git clone -b $branch git@gitlab.com:sncf_fbd/fbd_tools_project.git ;
cd $TOOL_BOX_ROOT/tmp/fbd_tools_project/ && python3 setup.py install
fi
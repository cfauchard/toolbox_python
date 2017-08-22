echo 'Creating temporary directory:'; echo $TOOL_BOX_ROOT/tmp;
mkdir $TOOL_BOX_ROOT/tmp;
read -p "Choose the fbd_tools' branch to install [develop (default), release, master]: " branch;
cd $TOOL_BOX_ROOT/tmp && git clone -b $branch git@gitlab.com:sncf_fbd/fbd_tools_project.git ;
cd $TOOL_BOX_ROOT/tmp/fbd_tools_project/ && python3 setup.py install
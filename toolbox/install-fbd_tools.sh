echo 'Creating temporary directory:'; echo $TOOL_BOX_ROOT/tmp;
mkdir $TOOL_BOX_ROOT/tmp;
cd $TOOL_BOX_ROOT/tmp && git clone -b dev git@gitlab.com:sncf_fbd/fbd_tools_project.git ;
cd $TOOL_BOX_ROOT/tmp/fbd_tools_project/ && python3 setup.py install
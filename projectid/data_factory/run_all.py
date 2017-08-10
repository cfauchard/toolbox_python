#!/usr/bin/python3

import configparser
import os
import logging
import sys
import getopt


sys.path.append('/home/gintronatp/work/project_internes/project_tree_template/project_id')
import importation
import clean
import transform

PATH_CONF   = '../config/cfg.py'

def main(ENV):

    # read config file and set the application root path: project_id
    config = configparser.ConfigParser({'APPLICATION_ROOT' : os.path.abspath("../")})
    config.read(PATH_CONF)

    # setup the logging system
    log_numeric_level = getattr(logging, config[ENV]['log_level'], None)
    logging.basicConfig(filename=config[ENV]['log_file'], 
                    format='%(levelname)s:%(asctime)s:%(message)s',
                    level=log_numeric_level)

    # run data factory 
    logging.info('Running all')
    importation.run(config[ENV])
    clean.run(config[ENV])
    transform.run(config[ENV])

    print('Log file in : {} ; Log level is {}'.format(config[ENV]['log_file'],config[ENV]['log_level']))


if __name__ == "__main__":

    try:
        
        # Get passed arguments
        opts, args = getopt.getopt(sys.argv[1:], 'e:', 'env=')        
        opt, arg = opts[0]
        envs = ['DEV','REC','PRD']
        ENV =  arg
                        
        # Check arg value
        assert ENV in envs

    except AssertionError as err:
        print('Too bad: possible ENV arguments are DEV, REC or PRD')
        sys.exit(2)

    except getopt.GetoptError as err:
        print('Too bad: ENV argument must be specified as -e <ENV> or --env=<ENV>')
        sys.exit(2)

    main(ENV)
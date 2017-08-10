import configparser
import os
import logging

global PATH_CONF
global ENV

def run(config):

    
    logging.info('Clean starts')
    
    input_file_name = os.path.join(config['refinery_path'],config['refinery_input_name'])

    with open(input_file_name) as fi:
        input_stream = fi.read()

    #clean file -> delete a substring
    new_stream = input_stream.split()
    new_stream.remove('Lorem')

    # write clean data to file
    output_file_name = os.path.join(config['refinery_path'], config['refinery_clean_name']) 
    with open(output_file_name, "w+") as fo:
        fo.write(' '.join(new_stream))

    #log here end of this phase
    logging.info('Clean finished. Output in {}'.format(output_file_name))

if __name__ == "__main__":

    # get config file
    PATH_CONF   = '../config/cfg.py'
    ENV         = 'DEV'
    config = configparser.ConfigParser()
    config.read(PATH_CONF)

        # init logging in debug mode
    logging.basicConfig(format='%(levelname)s:%(asctime)s:%(message)s',
                    level='DEBUG')


    run(config[ENV])

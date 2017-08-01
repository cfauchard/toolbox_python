import configparser
import os
import logging


def run(config):

    logging.info('Import started')
    # import the input file and copy to the refinery folder 
    
    folder_path = config['landing_path']
    file_name   = config['landing_input_file_name']

    logging.info('Import starts')
    
    input_file_name = os.path.join(folder_path,file_name)
    with open(input_file_name) as fi:
        input_stream = fi.read()


    output_file_name = os.path.join(config['refinery_path'],config['refinery_input_name'])
    with open(output_file_name, "w+") as fo:
        fo.write(input_stream)

    #log here end of this phase
    logging.info('Import finished. Output in {}'.format(output_file_name) )


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
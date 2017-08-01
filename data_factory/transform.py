#standard libraries
import configparser
import os
import sys
import logging

#custom libraries
#import utils

sys.path.append('/home/gintronatp/work/project_internes/project_tree_template/project_id/') # will dissapear
import modules.utils.aux

def run(config):

    
    logging.info('Transform starts')
    
    input_file_name = os.path.join(config['refinery_path'],config['refinery_clean_name'])

    with open(input_file_name) as fi:
        input_stream = fi.read()

    # file -> reverse the sequence of words and count the number of words
    sequ_words = input_stream.split()

    reversed_sequ_words = sequ_words[::-1]

    
    #dico_words_freq = utils.count_words(reversed_seq_words)

    dico_words_freq = modules.utils.aux.count_words(reversed_sequ_words)


    # write clean data to file
    output_file_name = os.path.join(config['gold_path'], config['gold_output_name'])
    with open(output_file_name, "w+") as fo:
        fo.write(str(dico_words_freq))

    #log here end of this phase
    logging.info('Transform finished. Output in {}'.format(output_file_name))

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

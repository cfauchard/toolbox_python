[DEFAULT]
 dir = %(APPLICATION_ROOT)s
 #/home/gintronatp/work/project_internes/project_tree_template/project_id/

[DEV]

# data location
landing_path             = ../tmp/data/landing
landing_input_file_name  = input_raw.txt
refinery_path            = ../tmp/data/refinery
refinery_input_name      = data_input_tmp.txt
refinery_clean_name      = data_clean_tmp.txt
gold_path                = ../tmp/data/gold
gold_output_name         = output.txt

# logging
log_file                 = %(dir)s/log/example.log
log_level                = DEBUG

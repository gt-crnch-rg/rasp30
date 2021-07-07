#!/bin/bash
#Last updated: 07/07/2021
#This script searches through the RASP tools and replaces the default directory, /home/ubuntu or ~/, with an environment variable, $RASPTOPDIR, that 
#can be set by the user at runtime.

#It is recommended to run this script in each directory and then inspect the output by comparing the diff of the old and new files:
#Ex: rasp30/sci2blif]$ ../misc_scripts/change_default_rasp_dir.sh


# Not totally clear why but it seems to help to export variables rather than setting them
export R1="'/home/ubuntu"
export R2="RASPTOPDIR+'"

export R3="'python /home/ubuntu"
export R4="'python '+RASPTOPDIR+'"

export R5="'~/rasp30"
export R6="RASPTOPDIR+'/rasp30"

#Remember to use " around sed fields to expand the variables within
find . -type f -name "*.sce" -exec sed -i.old -e "s|$R1|$R2|g" -e "s|$R3|$R4|g" -e "s|$R5|$R6|g" {} +

#Unset the environment variables
unset R1 R2 R3 R4 R5 R6
# Alternate method
#for file in $(find . -type f -name "*.sce" | grep -lR home/ubuntu ); do sed -i.old "s&$R1+&$R2+&g" $file; done

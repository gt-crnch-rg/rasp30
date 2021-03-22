#!/bin/bash
#Last updated: 07/16/2019
#This script searches through the RASP tools and replaces $FPAAHOME with an environment variable, FPAAHOME, that 
#can be set by the user at runtime.

find . -type f -exec sed -i 's/\/home\/ubuntu/$FPAAHOME/g' {} +

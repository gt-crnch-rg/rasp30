#!/bin/bash
#Last updated: 07/16/2019
#This script will set the path to your RASP installation and Scilab installation.
#Run using ". set_fpaa_paths.sh" to source this script.

#Specify which version of Scilab is being used
export SCILAB_VERSION=scilab-5.4.1
#export SCILAB_VERSION=scilab-5.5.2
echo "Using Scilab version: $SCILAB_VERSION"

#Specify where the rasp30 and Scilab tools are linked to - usually your home directory
export FPAAHOME=~/
echo "FPAAHOME is located at $FPAAHOME"

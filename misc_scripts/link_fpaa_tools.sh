#!/bin/bash
#Last updated: 07/16/2019
#This script will link the RASP tools and appropriate scilab installation to your home directory.
#NOTE: Run this from your home directory or wherever you have set as FPAAHOME!

# exit on error
set -e

link_tools() {
	ln -s /tools/neuro/fpaa/x86_64/scilab-5.4.1 $FPAAHOME/scilab-5.4.1
	ln -s /tools/neuro/fpaa/x86_64/scilab-5.5.2 $FPAAHOME/scilab-5.5.2
	ln -s /opt/fpaa/rasp30 $FPAAHOME/rasp30
}

#If you want to unlink this software you can use the following function
unlink_tools() {
	unlink ${FPAAHOME}/rasp30
	unlink ${FPAAHOME}/scilab-5.4.1
	unlink ${FPAAHOME}/scilab-5.5.2
}

echo "Linking tools at FPAAHOME: $FPAAHOME"
link_tools

#Uncomment to uninstall links to tools
#unlink_tools

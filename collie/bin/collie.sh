#!/bin/sh
#****************************************************************#
# ScriptName: collie.sh
# Author: liucheng.lc@alibaba-inc.com
# Create Date: 2014-11-07 14:52
# Modify Date: 2014-11-07 14:52
# Function: 
#***************************************************************#

[ `id -u` -ne 0 ] && { echo "The script need root privilege !"; exit 0; }

# MODE 1 SAFE MODE; 
# MODE 2 UP CODE MODE;
# MODE 0 STREAKING MODE;
[ $# -eq 1 ] || { echo "Usage: $0 MODE"; exit 0; }

. ./logger.sh

safe_mode()
{

}

udpate_mode()
{

}



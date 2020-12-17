#!/bin/bash

# This is a startup script for lsdtailtools
# It clones the lsdtailtools repository into the lsdtailtools directory
# it then builds the code from there.
# Author: SMM
# Date: 17/12/2020

# clone or pull the repo, depending on what is in there
# check if the files have been cloned
if [ -d /LSDTopoTools/lsdfailtools ]
  then
    echo "The lsdfailtools repository exists, updating to the latest version."
    git --work-tree=/LSDTopoTools/lsdfailtools --git-dir=/LSDTopoTools/lsdfailtools/.git  pull origin master
  else
    echo "Cloning the LSDTopoTools2 repository"
    git clone https://github.com/LSDtopotools/lsdfailtools.git /LSDTopoTools/lsdfailtools
fi

# Change the working directory to that of /LSDTopoTools/lsdfailtools
echo "I am going to try to build LSDTopoTools2."
cd /LSDTopoTools/lsdfailtools
echo "I am going to install failtools:"
pip install .

echo "You are ready to run some landlide prediction. "
echo "Please see the documentation in the readme at"
echo "https://github.com/LSDtopotools/lsdfailtools"


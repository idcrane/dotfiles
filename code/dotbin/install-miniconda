#!/bin/bash
#
# Install Miniconda 3 for current user
#
# OS............Linux, macOS
# Run as admin.........False
# Run with sudo .......False
#



if [[ -n ${CONDA_EXE+x} ]]; then
    echo 'It appears conda is already installed. Skipping installation.'
    exit
fi

if [[ $(uname -s) == "Darwin" ]]; then
    URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh'
else
    URL='https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh'
fi

/bin/bash -c "$(curl -fSL $URL)"

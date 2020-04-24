#/bin/bash

if [ "$1" == "2" ]; then
    PIP="pip"
else
    PIP="pip3"
fi

${PIP} install PyBOMBS

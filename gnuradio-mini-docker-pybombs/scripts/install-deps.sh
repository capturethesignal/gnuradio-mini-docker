#!/bin/bash

if [ "$1" == "2" ]; then
    PYTHON_DEPS="python-dev python-numpy python-yaml python-mako python-lxml python-gi python-gi-cairo python-requests python-zmq python-click python-click-plugins python-setuptools python-pip"
else
    PYTHON_DEPS="python3-dev python3-numpy python3-yaml python3-mako python3-lxml python3-gi python3-gi-cairo python3-requests python3-zmq python3-click python3-click-plugins python3-setuptools python3-pip"
fi

apt-get update && apt-get install -y \
    git wget zip unzip \
    automake cmake build-essential git-core cmake g++ pkg-config \
    libboost-all-dev \
    libgmp3-dev \
    libfftw3-3 \
    libfftw3-dev \
    libcppunit-dev \
    swig3.0 \
    libgsl-dev \
    libasound2-dev \
    gir1.2-gtk-3.0 \
    python-cairo-dev \
    libzmq3-dev \
    ${PYTHON_DEPS}
    && rm -rf /var/lib/apt/lists/*

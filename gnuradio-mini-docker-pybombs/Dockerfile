FROM ubuntu:18.04
LABEL maintainer=federico@maggi.cc

RUN apt-get update && apt-get install -y \
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
    python-dev \
    python-numpy \
    python-yaml \
    python-mako \
    python-lxml \
    python-gi \
    python-gi-cairo \
    python-requests \
    gir1.2-gtk-3.0 \
    python-cairo-dev \
    libzmq3-dev \
    python-zmq \
    python-click \
    python-click-plugins \
    python-setuptools \
    python-pip \
    && rm -rf /var/lib/apt/lists/*

ARG GR_COMMIT=maint-3.7
ARG MAKETHREADS=2

# Install PyBOMBS
RUN pip install PyBOMBS

# Configure PyBOMBS
RUN pybombs auto-config \
    && pybombs config makewidth $MAKETHREADS \
    && pybombs recipes add gr-recipes git+https://github.com/gnuradio/gr-recipes.git \
    && pybombs recipes add gr-etcetera git+https://github.com/gnuradio/gr-etcetera.git \
    && pybombs prefix init /pybombs

# Custom GR recipe
COPY gnuradio.lwr /root/.pybombs/recipes/gr-recipes/gnuradio.lwr

# Add source
RUN echo "source /pybombs/setup_env.sh" > /root/.bashrc \
  && . /pybombs/setup_env.sh

# Install deps only
RUN apt-get -qq update \
  && pybombs -v install --deps-only gnuradio \
  && apt-get clean && rm -rf /var/lib/apt/lists/* \
  && rm -rf /pybombs/src/*

# Install GR
RUN pybombs -p /pybombs -v install gnuradio

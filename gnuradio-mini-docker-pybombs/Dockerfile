FROM ubuntu:18.04
LABEL maintainer=federico@maggi.cc

ARG GR_COMMIT=maint-3.7
ARG MAKETHREADS=2
ARG PY_VER=2

COPY ./scripts /root/

WORKDIR /root/

RUN ./install-deps.sh $PY_VER

# Install PyBOMBS
RUN ./install-pybombs.sh $PY_VER

# Configure PyBOMBS
RUN ./configure-pybombs.sh $MAKETHREADS $GR_COMMIT

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

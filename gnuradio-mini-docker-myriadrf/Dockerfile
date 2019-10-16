FROM ubuntu:18.04
LABEL maintainer=federico@maggi.cc

RUN apt-get update \
    && apt-get install -y \
        software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:bladerf/bladerf \
    && add-apt-repository -y ppa:myriadrf/drivers \
    && add-apt-repository -y ppa:myriadrf/gnuradio

RUN apt-get update \
    && apt-get install -y \
        gr-osmosdr \
        gnuradio \
    && rm -rf /var/lib/apt/lists/*

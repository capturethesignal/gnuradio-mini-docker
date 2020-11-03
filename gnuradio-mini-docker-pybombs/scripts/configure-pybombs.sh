#!/bin/bash

pybombs auto-config \
    && pybombs config makewidth $1 \
    && pybombs recipes add gr-recipes git+https://github.com/gnuradio/gr-recipes.git \
    && pybombs recipes add gr-etcetera git+https://github.com/gnuradio/gr-etcetera.git \
    && pybombs prefix init /pybombs \
    && mv ./gnuradio/$2/gnuradio.lwr /root/.pybombs/recipes/gr-recipes/gnuradio.lwr

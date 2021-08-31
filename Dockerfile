FROM ubuntu:latest

MAINTAINER Sertalp B. Cay <sertalpbilal@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt -qq update && apt install -y --no-install-recommends apt-utils \
    && apt install -qq -y python3 \
                          python3-pip \
                          ssh \
                          git \
                          numactl \
                          dos2unix \
                          rsync \
                          tzdata \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt install -qq -y texlive-latex-extra latexmk \
    && apt -y clean \
    && python3 -m pip install sphinx \
                              matplotlib \
                              ipython \
                              sphinxcontrib-fulltoc \
                              numpydoc \
    && apt autoremove \
    && apt -y clean

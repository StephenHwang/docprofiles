# Dockerfile for build and run containers for Docprofiles
#  docker build -t docprofiles .

FROM ubuntu:20.04
MAINTAINER sjhwang

# Prevent dpkg from trying to ask any questions, ever
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# System packages
RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade

# Install Docprofile dependencies
###DEPS_BEGIN###
RUN apt-get -qq -y install \
    build-essential \
    make \
    cmake \
    zlib1g-dev \
    git \
    python3 \
    gcc-9 \
    g++-9 \
    gdb \
    vim \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
###DEPS_END###

# Install Docprofile
WORKDIR /
RUN git clone https://github.com/StephenHwang/docprofiles.git
WORKDIR /docprofiles
RUN mkdir build
WORKDIR build
RUN pwd
RUN cmake ..
RUN make install
RUN cp pfp_doc /bin

# Test that getting help on Docprofile works
RUN pfp_doc -h

WORKDIR /


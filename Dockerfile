# Base image
FROM debian:latest
FROM python:3.7.9

# Updating repository sources

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
        gcc \
        build-essential \
        zlib1g-dev \
        wget \
        unzip \
        cmake \
        python3-dev \
        gfortran \
        libblas-dev \
        liblapack-dev \
        libatlas-base-dev \
        pkg-config \
        libhdf5-dev \
    && apt-get clean

RUN pip install --upgrade pip && \
    pip install --no-cache-dir pandas numpy matplotlib deeppavlov notebook
# jupyter
EXPOSE 2525


CMD jupyter notebook --no-browser --port=2525 --ip=0.0.0.0 --allow-root --NotebookApp.token='nlp_deeppavlov'
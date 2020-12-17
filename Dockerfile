# This is the full lsdfailtools container
# It includes all the python packages needed to run lsdtfailtools
# As well as visualising the data
# Pull base image. We start from the miniconda image
FROM conda/miniconda3
MAINTAINER Simon Mudd (simon.m.mudd@ed.ac.uk)

# Need this to shortcut the stupid tzdata noninteractive thing
ARG DEBIAN_FRONTEND=noninteractive

# Update conda
RUN conda install -y -c conda-forge conda

# Add the conda forge
RUN conda config --add channels conda-forge

# Set the channel
RUN conda config --set channel_priority strict

# Some tools for fetching data
RUN conda install -y wget unzip

# Some of the plotting tools use ffmpeg
RUN conda install -y ffmpeg

# Install topotools command line interface
RUN conda install -y lsdtopotools

# More c++ tools
RUN conda install -y boost-cpp

# Add git so you can clone the lsdmappingtools repo
RUN conda install -y git python=3

# Now an environment for building conda
RUN conda install -y conda-build

# Now add some conda packages
RUN conda install -y gdal rasterio geopandas matplotlib numpy scipy pytables numba feather-format pandas pip pybind11 xtensor xtensor-python fiona utm pyproj cartopy folium h5py seaborn

# Here you can put some missing packages
RUN conda install -y descartes pyshp scikit-learn scikit-image pytables pyqt

# Here you can put some missing packages
RUN apt-get update && apt-get install -y \
    build-essential \
&& rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /LSDTopoTools

# Copy the startup script to install python stack
COPY start_failtools.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start_failtools.sh


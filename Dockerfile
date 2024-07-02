FROM ghcr.io/pyvista/pyvista:v0.42.1
LABEL maintainer="Julius Busecked"
LABEL repo="https://github.com/jbusecke/pangeo_pyvista_docker_image"

USER root

RUN apt-get update --fix-missing
RUN apt-get install -y git groff tree vim
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mamba install pyproj cartopy xarray netcdf4 zarr fsspec gcsfs distributed -y
RUN pip install geovista pyvista-xarray pykdtree --no-deps

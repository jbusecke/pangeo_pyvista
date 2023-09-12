FROM ghcr.io/pyvista/pyvista:v0.42.1
LABEL maintainer="Julius Busecked"
LABEL repo="https://github.com/jbusecke/pangeo_pyvista_docker_image"

RUN mamba install pyproj cartopy xarray netcdf4 zarr fsspec gcsfs distributed -y
RUN pip install geovista pyvista-xarray pykdtree --no-deps

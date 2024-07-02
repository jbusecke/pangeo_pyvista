FROM ghcr.io/pyvista/pyvista:v0.42.1
LABEL maintainer="Julius Busecked"
LABEL repo="https://github.com/jbusecke/pangeo_pyvista_docker_image"

USER root

RUN apt-get update -qq --yes > /dev/null && \
    apt-get install --yes -qq \
        git \
        vim \
        tree \
        groff > /dev/null

USER ${NB_USER}

COPY environment.yml /tmp/

RUN mamba env update -p ${CONDA_DIR} -f /tmp/environment.yml && mamba clean -afy

RUN pip install geovista pyvista-xarray pykdtree --no-deps

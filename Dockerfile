FROM pangeo/pangeo-notebook:latest
LABEL maintainer="Julius Busecked"
LABEL repo="https://github.com/jbusecke/pangeo_pyvista_docker_image"

# COPY dist/*.tar.gz /build-context/
# COPY README.rst /build-context/
# COPY LICENSE /build-context/
COPY requirements.txt /build-context/requirements.txt
COPY environment.yaml /build-context/environment.yaml
WORKDIR /build-context/

RUN pip install pyvista trame geovista
RUN pip install -r requirements.txt
# Install vtk-osmesa wheel
RUN pip uninstall vtk -y
RUN pip install --no-cache-dir --extra-index-url https://wheels.vtk.org vtk-osmesa

WORKDIR $HOME

# allow jupyterlab for ipyvtk
ENV JUPYTER_ENABLE_LAB=yes
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'

# ONBUILD instructions in base-image/Dockerfile are used to
# perform certain actions based on the presence of specific
# files (such as conda-linux-64.lock, start) in this repo.
# Refer to the base-image/Dockerfile for documentation.
ARG PANGEO_IMAGE_TAG=master
FROM pangeo/pangeo-notebook:${PANGEO_BASE_IMAGE_TAG}

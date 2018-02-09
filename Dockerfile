# Copyright (c) 2017, Cassiny.io OÜ
# Distributed under the terms of the Modified BSD License.

# https://hub.docker.com/r/cassinyio/notebook/
FROM cassinyio/notebook:6ab15613

LABEL maintainer "wow@cassiny.io"

# Install R packages
COPY environment.yml $HOME/environment.yml
RUN conda config --add channels r && \
    conda install -yq --file $HOME/environment.yml && \
    conda clean -tipsy
RUN rm $HOME/environment.yml

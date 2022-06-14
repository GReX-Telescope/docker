# Latest upstream CUDA + Ubuntu
FROM nvidia/cuda:11.7.0-devel-ubuntu22.04
# Update
RUN apt-get update && apt-get install -y \
    cmake                                \
    git                                  \
    libthrust-dev                        \
    libboost-all-dev                     \
    librdmacm-dev                        \
    libibverbs-dev
# Clone and build PSRDADA
ADD https://api.github.com/repos/GReX-Telescope/psrdada/git/refs/heads/master psrdada-version.json
RUN git clone https://github.com/GReX-Telescope/psrdada /tmp/psrdada; \
    cd /tmp/psrdada;                                                  \
    cmake -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE .;                 \
    make -j${nproc};                                                  \
    make install;
# Clone and build dedisp
ADD https://api.github.com/repos/GReX-Telescope/dedisp/git/refs/heads/master dedisp-version.json
RUN git clone https://github.com/GReX-Telescope/dedisp /tmp/dedisp; \
    cd /tmp/dedisp;                                                 \
    cmake -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE .;               \
    make -j${nproc};                                                \
    make install;
# Clone and build heimdall
ADD https://api.github.com/repos/GReX-Telescope/heimdall-astro/git/refs/heads/master heimdall-version.json
RUN git clone https://github.com/GReX-Telescope/heimdall-astro /tmp/heimdall; \
    cd /tmp/heimdall;                                                         \
    cmake -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE .;                         \
    make -j${nproc};                                                          \
    make install;
# Cleanup build directories
RUN rm -rd /tmp

# Metadata
LABEL "org.opencontainers.image.source"="https://github.com/GReX-Telescope/docker"
LABEL "maintainer"="Kiran Shila <me@kiranshila.com>"

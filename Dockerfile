FROM fedora:30
RUN dnf -y install cmake gcc gcc-c++ gfortran git make perl wget
RUN mkdir -p /sources
RUN cd /sources &&\
    wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.6.tar.gz &&\
    tar -xf openmpi-3.1.6.tar.gz &&\
    cd openmpi-3.1.6 &&\
    mkdir build &&\
    cd build &&\
    ../configure --prefix=/usr/local/ &&\
    make -j 4 all &&\
    make install &&\
    cd / &&\
    rm -fr /sources/openmpi*
RUN export PATH="/usr/local/bin:${PATH}"
RUN git config --global http.postBuffer 524288000

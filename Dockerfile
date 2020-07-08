FROM fedora:31
RUN dnf -y install cmake gcc-9.3.1-2.fc31.x86_64 gcc-c++-9.3.1-2.fc31.x86_64 git make perl wget
RUN mkdir -p /sources
RUN cd /sources &&\
    wget https://download.open-mpi.org/release/open-mpi/v3.1/openmpi-3.1.6.tar.gz &&\
    tar -xf openmpi-3.1.6.tar.gz &&\
    cd openmpi-3.1.6 &&\
    mkdir build &&\
    cd build &&\
    ../configure &&\
    make -j 4 all &&\
    make install &&\
    cd / &&\
    rm -fr /sources/openmpi*

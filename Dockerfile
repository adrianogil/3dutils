FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        assimp-utils \
        build-essential \
        ca-certificates \
        libassimp-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/3dutils
COPY . /opt/3dutils

RUN g++ -O2 -std=c++17 -o /usr/local/bin/meshdetails /opt/3dutils/src/meshdetails/main.cpp -lassimp \
    && install -m 0755 /opt/3dutils/src/docker-entrypoint.sh /usr/local/bin/3dutils-entrypoint

ENV UTILS3D_DIR=/opt/3dutils

ENTRYPOINT ["/usr/local/bin/3dutils-entrypoint"]
CMD ["bash"]

FROM ubuntu:22.04

WORKDIR /opt/darknet

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        curl ca-certificates git build-essential ninja-build nasm ccache cmake patchelf \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]

FROM nvidia/opengl:1.0-glvnd-devel-ubuntu16.04 as gl
FROM nvidia/cuda:8.0-devel-ubuntu16.04
LABEL maintainer "moelocus"

RUN apt-get update && apt-get install -y --no-install-recommends \
        pkg-config \
        libxau-dev libxau-dev:i386 \
        libxdmcp-dev libxdmcp-dev:i386 \
        libxcb1-dev libxcb1-dev:i386 \
        libxext-dev libxext-dev:i386 \
        libx11-dev libx11-dev:i386 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=gl /usr/local/include /usr/local/include
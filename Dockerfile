FROM rocm/dev-ubuntu-24.04
LABEL authors="ericmoderbacher"

# Install prerequisites
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    gcc \
    g++ \
    ninja-build \
    libssl-dev

# Install the latest supported version of CMake compatible with CLion (currently 3.29.3)
ENV CMAKE_VERSION=3.29.3
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.sh \
    && chmod +x cmake-${CMAKE_VERSION}-linux-x86_64.sh \
    && ./cmake-${CMAKE_VERSION}-linux-x86_64.sh --skip-license --prefix=/usr/local \
    && rm cmake-${CMAKE_VERSION}-linux-x86_64.sh

ENTRYPOINT ["top", "-b"]
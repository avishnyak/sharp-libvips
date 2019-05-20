FROM debian:wheezy

# Create Debian 7 (glibc 2.13) container suitable for building Linux x64 binaries

# Build dependencies
RUN \
# https://unix.stackexchange.com/a/508728
echo "deb [check-valid-until=no] http://archive.debian.org/debian wheezy-backports main" | tee /etc/apt/sources.list.d/wheezy-backports.list && \
echo "deb http://archive.debian.org/debian wheezy main" > /etc/apt/sources.list && \
echo "deb http://archive.debian.org/debian-archive/debian-security/ wheezy/updates main" >> /etc/apt/sources.list && \
  apt-get -o Acquire::Check-Valid-Until=false update && \
  apt-get install -y build-essential gcc-4.9-backport prelink autoconf libtool nasm gtk-doc-tools texinfo gperf advancecomp libglib2.0-dev gobject-introspection && \
  apt-get -t wheezy-backports install -y jq cmake && \
  curl https://sh.rustup.rs -sSf | sh -s -- -y

# Compiler settings
ENV \
  PATH="/root/.cargo/bin:$PATH" \
  PLATFORM="linux-x64" \
  FLAGS="-O3"

COPY Toolchain.cmake /root/

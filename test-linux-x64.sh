#!/bin/sh

# Verify docker is available
if ! type docker >/dev/null; then
  echo "Please install docker"
  exit 1
fi

test="npm run clean; npm install --unsafe-perm; npm test"

# Debian 7, 8
# Ubuntu 14.04, 16.04
for dist in debian:jessie debian:stretch ubuntu:trusty ubuntu:xenial; do
  echo "Testing $dist..."
  docker pull $dist
  echo "" >$dist.log
  if docker run -i -t --rm -v $PWD:/v $dist >$dist.log 2>&1 sh -c "SHARP_DIST_BASE_URL=https://github.com/avishnyak/sharp-libvips/releases/download/v8.8.0/; cd /v; ./test/debian.sh; $test";
  then echo "$dist OK"
  else echo "$dist fail" && cat /$dist.log
  fi
done

# Centos 7
echo "Testing centos7..."
docker pull centos:7
echo "" >centos7.log
if docker run -i -t --rm -v $PWD:/v centos:7 >centos7.log 2>&1 sh -c "SHARP_DIST_BASE_URL=https://github.com/avishnyak/sharp-libvips/releases/download/v8.8.0/; cd /v; ./test/centos.sh; $test";
then echo "centos7 OK"
else echo "centos7 fail" && cat /centos7.log
fi

# Archlinux latest
echo "Testing archlinux..."
docker pull pritunl/archlinux:latest
echo "" >archlinux.log
if docker run -i -t --rm -v $PWD:/v pritunl/archlinux:latest >archlinux.log 2>&1 sh -c "SHARP_DIST_BASE_URL=https://github.com/avishnyak/sharp-libvips/releases/download/v8.8.0/; cd /v; ./test/archlinux.sh; $test";
then echo "archlinux OK"
else echo "archlinux fail" && cat /archlinux.log
fi

#!/bin/sh

# Verify docker is available
if ! type docker >/dev/null; then
  echo "Please install docker"
  exit 1
fi

read -r -d '' test << EOM
mkdir sharp &&
curl -s https://api.github.com/repos/lovell/sharp/releases/latest | jq -r ".tarball_url" | xargs curl -Ls | tar xzC sharp --strip-components=1 &&
cd ./sharp &&
npm config set sharp_dist_base_url "https://github.com/avishnyak/sharp-libvips/releases/download/v8.8.1/" &&
npm run -s clean &&
npm install --loglevel error --unsafe-perm &&
npm run test-unit
EOM

if [[ $* == *--quick* ]];
then distros="debian:stretch"
else distros="debian:jessie debian:stretch ubuntu:trusty ubuntu:xenial centos:7" # No support for archlinux:latest right now
fi

for dist in $distros
do
  dist_from_tag="${dist%:*}"
  echo "Testing $dist..."
  docker pull $dist
  echo "" >$dist.log
  rm -rf ./test-fs/
  mkdir test-fs && cp -r ./test/ ./test-fs/test/
  if docker run -i -t --rm -v $PWD/test-fs:/v $dist >$dist.log 2>&1 sh -c "cd /v; ./test/$dist_from_tag.sh; $test";
  then echo "$dist OK"
  else echo "$dist fail" && cat ./$dist.log
  fi
done

rm -rf ./test-fs/
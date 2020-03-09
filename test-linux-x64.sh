#!/bin/sh

# Verify docker is available
if ! type docker >/dev/null; then
  echo "Please install docker"
  exit 1
fi

libvipsversion=$(head -n 1 LIBVIPS_VERSION)

echo "Detected LIBVIPS_VERSION: ${libvipsversion}"

read -r -d '' test << EOM
mkdir sharp &&
curl -s https://api.github.com/repos/lovell/sharp/releases/latest | jq -r ".tarball_url" | xargs curl -Ls | tar xzC sharp --strip-components=1 &&
cd ./sharp &&
jq '.config.libvips = "${libvipsversion}"' package.json > package.new &&
mv package.new package.json &&
npm config set sharp_dist_base_url "https://github.com/avishnyak/sharp-libvips/releases/download/v${libvipsversion}/" &&
npm run -s clean &&
npm install --loglevel error --unsafe-perm &&
npm run test-unit
EOM

if [[ $* == *--all* ]];
then distros="debian:buster debian:bullseye centos:7 alpine:3.11"
else distros="debian:buster"
fi

for dist in $distros
do
  dist_from_tag="${dist%:*}"
  echo "Testing $dist..."
  docker pull -q $dist
  echo "" >$dist.log
  rm -rf ./test-fs/
  mkdir test-fs && cp -r ./test/ ./test-fs/test/
  if docker run -i -t --rm -v $PWD/test-fs:/v $dist >$dist.log 2>&1 sh -c "cd /v; ./test/$dist_from_tag.sh; $test";
  then echo "$dist OK"
  else echo "$dist fail" && cat ./$dist.log
  fi
done

rm -rf ./test-fs/
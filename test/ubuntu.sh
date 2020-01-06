#!/bin/sh

DEBIAN_FRONTEND=noninteractive apt-get update  -qq
DEBIAN_FRONTEND=noninteractive apt-get install -y -qq build-essential python pkg-config curl jq
curl -sL https://deb.nodesource.com/setup_10.x | bash -
DEBIAN_FRONTEND=noninteractive apt-get install -y -qq nodejs
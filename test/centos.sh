#!/bin/sh

yum install -y -q which
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum install -y -q gcc-c++ make nodejs jq

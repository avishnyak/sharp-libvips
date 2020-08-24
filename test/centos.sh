#!/bin/sh

yum install -y -q which
yum install -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum install -y -q gcc-c++ make nodejs jq

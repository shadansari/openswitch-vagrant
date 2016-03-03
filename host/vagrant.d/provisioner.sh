#!/bin/bash

set -ex

if [ -n $http_proxy ]
then
  export proxyhost=`echo $http_proxy | awk -F: '{ print substr($2,3); }'`
  export proxyport=`echo $http_proxy | awk -F: '{ print $3 }'`
  sudo -E bash -c 'cat > /home/vagrant/.ssh/config <<EOF
Host *.openswitch.net
  ProxyCommand socat - PROXY:$proxyhost:%h:%p,proxyport=$proxyport
EOF'
fi

sudo apt-get update
sudo apt-get -y install gawk wget git diffstat libfontconfig1 build-essential chrpath screen device-tree-compiler socat python-setuptools texinfo

git clone http://github.com/mininet/mininet ~/mininet
cd ~/mininet; sudo python setup.py install

cd
git clone http://git.openswitch.net/openswitch/ops-build ops-build
cd ops-build
make configure genericx86-64
make
make export_docker_image 
docker images

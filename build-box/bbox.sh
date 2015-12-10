#!/bin/bash -x
rm -f bbox.log
docker build -t shippedrepos-docker-build-images.bintray.io/vagrant-vbox-packer:1.0 . 2>&1 | tee bbox.log
docker push shippedrepos-docker-build-images.bintray.io/vagrant-vbox-packer:1.0 2>&1 | tee -a bbox.log


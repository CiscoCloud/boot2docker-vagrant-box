#!/bin/bash
# Build and optionally upload boot2docker
# To upload, specify user in the form userid:apikey 
user=$1
vagrant up
packer build -only virtualbox-iso template.json
vagrant box add boot2docker_virtualbox.box --force --name CiscoCloud/boot2docker
if [ -n "$user" ] ; then
  curl \
    -T boot2docker_virtualbox.box \
    -u$user \
    -H "X-Bintray-Publish: 1" \
    -H "X-Bintray-Override: 1" \
    https://api.bintray.com/content/shippedrepos/Virtualbox-boxes/boot2docker/1.7.0/boot2docker?box_provider=virtualbox
fi

# Build Box for boot2docker-vagrantbox

This directory contains a Dockerfile to build an image containing
Vagrant, VirtualBox, and Packer supporting script bbox.sh that builds the
image and uploads it to Bintray.  The output image is intended to serve as
a Drone build box for a CI build for boot2docker-vagrantbox.  However, there
are two outstanding issues that must be resolved before this is possible:

1. The Docker image requires that /dev/vboxdrv be defined in the host,
   meaning that Docker must be invoked with the argument `-v /dev/vboxdrv:/dev/vboxdrv`.
   It is not clear that Drone supports arguments on the Docker command
   deploying a build box.

2. There is a communication problem between the image and Hashicorp Atlas that
   causes vagrant up in the container to fail with a message similar to 
   `The box 'hashicorp/precise32' could not be found`.  
   This is a showstopper for using the box.

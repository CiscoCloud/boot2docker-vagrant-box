# boot2docker Vagrant Box

This repository contains the scripts necessary to create a Vagrant-compatible
[boot2docker](https://github.com/CiscoCloud/boot2docker) box. If you work solely
with Docker, this box lets you keep your Vagrant workflow and work in the
most minimal Docker environment possible.

This is a Cisco-supported version using Docker 1.7.0

## Using the box

To use the box in a Vagrantfile, include the line

    docker.vm.box = "https://bintray.com/artifact/download/shippedrepos/Virtualbox-boxes/1.7.0/boot2docker"

and delete or comment out any line forwarding port 2375

## Building the Box

To build the box, first install the following prerequisites:

  * [Packer](http://www.packer.io) (at least version 0.5.1)
  * [VirtualBox](http://www.virtualbox.org) (at least version 4.3), VMware, or Parallels
  * [Vagrant](http://www.vagrantup.com)

Then run build.sh userid:apikey, which contains the steps:

    $ vagrant up
    $ packer build -only virtualbox-iso template.json
    $ vagrant box add boot2docker_virtualbox.box --force --name CiscoCloud/boot2docker
    $ curl -T boot2docker_virtualbox.box \
    $  -uuserid:apikey \
    $  -H "X-Bintray-Publish: 1" \
    $  -H "X-Bintray-Override: 1" \
    $  https://api.bintray.com/content/shippedrepos/Virtualbox-boxes/boot2docker/1.7.0/boot2docker?box_provider=virtualbox

You can build Parallels or VMWare versions by specifying parallels-iso or vmware-iso in place of virtualbox-iso in the packer command above.  To build all three, omit the "-only" argument altogether.

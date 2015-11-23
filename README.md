# boot2docker Vagrant Box

This repository contains the scripts necessary to create a Vagrant-compatible
[boot2docker](https://github.com/CiscoCloud/boot2docker) box. If you work solely
with Docker, this box lets you keep your Vagrant workflow and work in the
most minimal Docker environment possible.

## Building the Box

To build the box, first install the following prerequisites:

  * [Packer](http://www.packer.io) (at least version 0.5.1)
  * [VirtualBox](http://www.virtualbox.org) (at least version 4.3), VMware, or Parallels
  * [Vagrant](http://www.vagrantup.com)

Then follow the steps:

    $ vagrant up
    $ packer build -only virtualbox-iso template.json
    $ vagrant box add boot2docker_virtualbox.box --name CiscoCloud/boot2docker

You can build Parallels or VMWare versions by specifying parallels-iso or vmware-iso in place of virtualbox-iso in the packer command above.  To build all three, omit the "-only" argument altogether.

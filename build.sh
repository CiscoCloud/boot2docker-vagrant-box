#!/bin/bash
vagrant up
packer build -only virtualbox-iso template.json
vagrant box add boot2docker_virtualbox.box --force --name CiscoCloud/boot2docker

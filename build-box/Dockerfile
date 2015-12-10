# Docker image for boot2docker-vagrantbox build box
# docker run -v /dev/vboxdrv:/dev/vboxdrv shippedrepos-docker-build-images.bintray.io/vagrant-vbox-packer
FROM ubuntu:14.04.3

ENV DEBIAN_FRONTEND noninteractive

# Install VirtualBox and Vagrant
RUN sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list.d/virtualbox.list' \
 && apt-get update -y && apt-get install -y wget curl \
 && wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add - \
 && apt-get install -y \
  dkms \
  virtualbox-4.3 \
  vagrant \
  zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* oracle_vbox.asc

# Install Virtualbox Extension Pack
RUN VBOX_VERSION=`dpkg -s virtualbox-4.3 | grep '^Version: ' | sed -e 's/Version: \([0-9\.]*\)\-.*/\1/'` ; \
    wget http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack ; \
    VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack ; \
    rm Oracle_VM_VirtualBox_Extension_Pack-${VBOX_VERSION}.vbox-extpack

# The virtualbox driver device must be mounted from host
VOLUME /dev/vboxdrv

# Install Packer
RUN curl -kL https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip -o packer_0.8.6_linux_amd64.zip \
 && mkdir -p /usr/local/packer \
 && unzip packer_0.8.6_linux_amd64.zip -d /usr/local/packer \
 && echo "export PATH=\$PATH:/usr/local/packer" \
 && echo "export PATH=\$PATH:/usr/local/packer" >> ~/.bashrc \
 && rm -f packer_0.8.6_linux_amd64.zip
    

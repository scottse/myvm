#!/usr/bin/env bash

# Username and hashed password for VMs
USERNAME='test'
PASSWORD='$6$.IwGrSRYcDlf1WK6$nf/jh8z2OJT30gzL.ey1.uPjnn1YFlebFP7aVrUxWjlc0mHQSwm0pieDPPHHmXQaW8LR.L58xFK5TRIAwNyZS1'
# Libvirt VM images storage
LV_IMG_DIR='/var/lib/libvirt/images'
# Ubuntu 22.04 download link
# UBUNTU_CLD_IMG='https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img'
UBUNTU_CLD_IMG='http://192.168.1.8/jammy-server-cloudimg-amd64.img'
# Debian 12 download link
# DEBIAN_CLD_IMG='https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2'
DEBIAN_CLD_IMG='http://192.168.1.8/debian-12-generic-amd64.qcow2'
# Fedora 38 download link
# FEDORA_CLD_IMG='https://download.fedoraproject.org/pub/fedora/linux/releases/38/Cloud/x86_64/images/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
FEDORA_CLD_IMG='http://192.168.1.8/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
# Ubuntu File Name
UBUNTU_FNAME='ubuntu2204-cldimg.qcow2'
# Debian File Name
DEBIAN_FNAME='debian-12-cldimg.qcow2'
# Fedora File Name
FEDORA_FNAME='fedora38-cldimg.qcow2'

d_ubuntu_img() {
    if [ -e $LV_IMG_DIR/$UBUNTU_FNAME ]; then
      echo "Found $(echo $UBUNTU_FNAME) in the libvirt images directory."
      exit 1
    else
      wget -O $LV_IMG_DIR/$UBUNTU_FNAME $UBUNTU_CLD_IMG
      # qemu-img convert -f qcow2 -O qcow2 $LV_IMG_DIR/$UBUNTU_FNAME_IMG $LV_IMG_DIR/$UBUNTU_FNAME
      echo "Downloading $(echo $UBUNTU_FNAME) into the libvirt images directory."
    fi
}
d_debian_img() {
    if [ -e $LV_IMG_DIR/$DEBIAN_FNAME ]; then
      echo "Found $(echo $DEBIAN_FNAME) in the libvirt images directory."
      exit 1
    else
      wget -O $LV_IMG_DIR/$DEBIAN_FNAME $DEBIAN_CLD_IMG
      echo "Downloading $(echo $DEBIAN_FNAME) into the libvirt images directory."
    fi
}
d_fedora_img() {
    if [ -e $LV_IMG_DIR/$FEDORA_FNAME ]; then
      echo "Found $(echo $FEDORA_FNAME) in the libvirt images directory."
      exit 1
    else
      wget -O $LV_IMG_DIR/$FEDORA_FNAME $FEDORA_CLD_IMG
      echo "Downloading $(echo $FEDORA_FNAME) into the libvirt images directory."
    fi
}
ubuntu_quick() {
  echo "pass"
}

quick_install_vm() {

virt-install \
  --connect qemu:///system \
  --name $vm_name \
  --memory 2048 \
  --vcpus=1 \
  --disk /var/lib/libvirt/images/$vm_name,device=disk,bus=virtio \
  --disk /var/lib/libvirt/images/cloud-init.iso,device=cdrom \
  --os-variant=ubuntu-lts-latest \
  --virt-type kvm \
  --graphics vnc \
  --network network=default,model=virtio \
  --import \
  --noautoconsole
}
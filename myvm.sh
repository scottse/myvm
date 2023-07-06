#!/usr/bin/env bash
# Username and hashed password for VMs
USERNAME = 'test'
PASSWORD = '$6$.IwGrSRYcDlf1WK6$nf/jh8z2OJT30gzL.ey1.uPjnn1YFlebFP7aVrUxWjlc0mHQSwm0pieDPPHHmXQaW8LR.L58xFK5TRIAwNyZS1'
# Libvirt VM images storage
LV_IMG_DIR = '/var/lib/libvirt/images'
# Ubuntu 22.04 download link
# UBUNTU_CLD_IMG = 'https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img'
UBUNTU_CLD_IMG = 'http://192.168.1.8/jammy-server-cloudimg-amd64-disk-kvm.img'
# Debian 12 download link
# DEBIAN_CLD_IMG = 'https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2'
DEBIAN_CLD_IMG = 'http://192.168.1.8/debian-12-generic-amd64.qcow2'
# Fedora 38 download link
# FEDORA_CLD_IMG = 'https://download.fedoraproject.org/pub/fedora/linux/releases/38/Cloud/x86_64/images/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
FEDORA_CLD_IMG = 'http://192.168.1.8/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
# Ubuntu .img File Name
UBUNTU_FNAME_IMG = 'ubuntu2204.img'
# Ubuntu File Name
UBUNTU_FNAME = 'ubuntu2204.qcow2'
# Debian File Name
DEBIAN_FNAME = 'debian-12.qcow2'
# Fedora File Name
FEDORA_FNAME = 'fedora38.qcow2'

# qemu-img convert -f qcow2 -O qcow2 {LV_IMG_DIR}/{UBUNTU_FNAME_IMG} {LV_IMG_DIR}/{UBUNTU_FNAME}

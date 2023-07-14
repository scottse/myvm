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

create_cloudinit_iso() {
  echo "pass"
}

debian_quick() {
  local vm_name=deb_vm_$(date +%y%m%d-%H%M
  local os_disk=$vm_name
  local cloud_init_iso=
virt-install \
  --name $vm_name \
  --memory 2G \
  --vcpus=1
  --disk $os_disk \
  --disk $cloud_init_iso \
  --os-type linux \
  --os-variant $os_variant \
  --virt-type kvm \
  --graphics vnc \
  --network network=default,model=virtio
  --import \
  --noautoconsole

}
debian_custom() {
  echo
}

ubuntu_quick() {
  echo
}

fedora_quick() {
  echo
}

fedora_custom() {
  echo
}
sub_download() {
  echo
  echo "======================================================"
  echo "= The cloud image needs to be downloaded before a VM ="
  echo "= can be created. Please download the cloud image    ="
  echo "= for either Debian, Ubuntu, Fedora or download all  ="
  echo "= of the cloud images from each distro.              ="
  echo "======================================================"
  echo
  local PS3="Please select an option below: "
  local options=("Debian" "Ubuntu" "Fedora" "All" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Debian")
        d_debian_img ;;
      "Ubuntu")
        d_ubuntu_img ;;
      "Fedora")
        d_ubuntu_img ;;
      "All")
        d_debian_img
        d_ubuntu_img
        d_fedora_img
        ;;
      "Main")
       echo "Return to main menu"
       menu
       ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done
}
sub_debian() {
  echo
  echo "========================================================="
  echo "= ="
  echo "= ="
  echo "= ="
  echo "= ="
  echo "========================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        echo "small" ;;
      "Custom")
        echo "medium" ;;
      "Main")
       echo "Return to main menu"
       menu
       ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done
}
sub_ubuntu() {
  echo
  echo "========================================================="
  echo "= Select the VM size from small, medium, and large.     ="
  echo "= Small: 2GB of memory, 1 VCPU, 25GB virtual disk.      ="
  echo "= Medium: 4GB of memory, 2 VCPUs, 50GB Virtual disk.    ="
  echo "= Large: 8GB of memory, 2 vCPUs, 50GB Virtual disk.     ="
  echo "========================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        echo "small" ;;
      "Custom")
        echo "medium" ;;
      "Main")
       echo "Return to main menu"
       menu
       ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done
}
sub_fedora() {
  echo
  echo "========================================================="
  echo "=    ="
  echo "=      ="
  echo "=     ="
  echo "=   ="
  echo "========================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Small")
        echo "small" ;;
      "Medium")
        echo "medium" ;;
      "Main")
       echo "Return to main menu"
       menu
       ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done
}

menu() {
  echo
  echo "=============================================================="
  echo "= The myvm bash script is able to download cloud images from ="
  echo "= Debian, Fedora, and Ubuntu, utializing Cloud-init to prov- ="
  echo "= ide hostname, username, password, etc... to the VM.        ="
  echo "=                                                            ="
  echo "= Please select an option below to get started.              ="
  echo "=============================================================="
  echo
  PS3='Please select an option: '
  options=("Download" "Ubuntu" "Debian" "Fedora" "Help" "Quit")
  select opt in "${options[@]}"; do
    case $opt in
      "Download")
        sub_download ;;
      "Ubuntu")
        sub_ubuntu ;;
      "Debian")
        sub_debian ;;
      "Fedora")
        sub_fedora ;;
      "Help")
        help_func ;;
      "Quit")
        echo "Exiting"
        exit 0
        ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done  
}

menu
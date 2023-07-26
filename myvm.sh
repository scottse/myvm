#!/usr/bin/env bash

# Username and hashed password for VMs
LV_CONN=""
USERNAME='test'
PASSWORD='$6$.IwGrSRYcDlf1WK6$nf/jh8z2OJT30gzL.ey1.uPjnn1YFlebFP7aVrUxWjlc0mHQSwm0pieDPPHHmXQaW8LR.L58xFK5TRIAwNyZS1'
# SSH Public key
SSH_PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiboxxQ3WcuMoDXgokHCJgYbkC15YJiheiZ9nQjH42UhKbrG9os7g5Tv5kWlOxUa8J+HOBX8jpMxN+FcC/xzGca0IpUt2K+b9H9LlDkfL/WUmErGvBH3IN6xTE3ZgrCn6QqZ5pHG4JxT1BRo2KkMvyb71pysnz49kb+aeI/JJRB37wFbEY3IqtaQmRoHHagigiS/+eX9gjX+Sv60lxqrLEZ3MNE/sSiwaMJnLbRoRHpmUGvwjLwLBtQLThpJ/2sUHv3ND/11GbDvNmemVgukEUq9HPs7pN0DQhBLlYQa3LO4/LyZB6gcpCtQ5eh9l78+bbzSVgqro071A3OMxpsclaeXb6dJQ2LxdCDsz9qo//x7FqnIPQON8BR4k2uvaqVXjlXMDhG0kMlQldpqRlOQ2Jm5BrlmMP2zickFdM6jG0ZOIFrfFLpTPVavn3VXEZbcYFd64EGqGw105QzYNrgEB16NjMEZbpbfViklpRrF2ukAuYEjGi5zBY1El8zpNUbXs= scott@gaia.local"
# Disk size for quick VMs
QUICK_DISK_SIZE=10G
# Memory size for quick VMs
QUICK_MEM_SIZE=2048
# Libvirt VM images storage
LV_IMG_DIR='/var/lib/libvirt/images'
# Where the cloud-init config iso is stored.
LV_CLD_INIT_ISO_DIR='/var/lib/libvirt/cloud-init-iso'
# Where the Linux cloud images are stored.
LV_CLD_IMG_DIR="/var/lib/libvirt/cloud-images"
# Where the cloud-init config files are stored.
LV_CLD_DIR='/var/lib/libvirt/cloud-init'
# Ubuntu 22.04 download link
# UBUNTU_CLD_IMG='https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img'
UBUNTU_CLD_IMG='http://192.168.1.8/jammy-server-cloudimg-amd64.img'
# Debian 12 download link
# DEBIAN_CLD_IMG='https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2'
DEBIAN_CLD_IMG='http://192.168.1.8/debian-12-generic-amd64.qcow2'
# Fedora 38 download link
# FEDORA_CLD_IMG='https://download.fedoraproject.org/pub/fedora/linux/releases/38/Cloud/x86_64/images/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
FEDORA_CLD_IMG='http://phobos/Fedora-Cloud-Base-38-1.6.x86_64.qcow2'
# CentOS 9 Stream download link
# CENTOS_CLD_IMG='https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2'
CENTOS_CLD_IMG='http://phobos/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2'
# OpenSuse Leap download link
#OPENSUSE_CLD_IMG="https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.3/images/openSUSE-Leap-15.3.x86_64-NoCloud.qcow2"
OPENSUSE_CLD_IMG="http://192.168.1.8/openSUSE-Leap-15.3.x86_64-NoCloud.qcow2"
# Ubuntu File Name
UBUNTU_FNAME='ubuntu2204-cldimg.qcow2'
# Debian File Name
DEBIAN_FNAME='debian-12-cldimg.qcow2'
# Fedora File Name
FEDORA_FNAME='fedora38-cldimg.qcow2'
# CentOS File Name
CENTOS_FNAME='centos-s9-cldimg.qcow2'
# OpenSUSE File Name
OPENSUSE_FNAME="openSUSE-Leap-15.3-cldimg.qcow2"

d_ubuntu_img() {
    if [ -e $LV_CLD_IMG_DIR/$UBUNTU_FNAME ]; then
      echo "Found $(echo $UBUNTU_FNAME) in the libvirt images directory."
      # Return to main menu.
      menu
    else
      wget -O $LV_CLD_IMG_DIR/$UBUNTU_FNAME $UBUNTU_CLD_IMG
      # qemu-img convert -f qcow2 -O qcow2 $LV_IMG_DIR/$UBUNTU_FNAME_IMG $LV_IMG_DIR/$UBUNTU_FNAME
      echo "Downloading $(echo $UBUNTU_FNAME) into the libvirt images directory."
      # Return to main menu
      menu
    fi
}

d_debian_img() {
    if [ -e $LV_CLD_IMG_DIR/$DEBIAN_FNAME ]; then
      echo "Found $(echo $DEBIAN_FNAME) in the libvirt images directory."
      # Return to main menu.
      menu
    else
      wget -O $LV_CLD_IMG_DIR/$DEBIAN_FNAME $DEBIAN_CLD_IMG
      echo "Downloading $(echo $DEBIAN_FNAME) into the libvirt images directory."
      #Return to main menu.
      menu
    fi
}

d_fedora_img() {
    if [ -e $LV_CLD_IMG_DIR/$FEDORA_FNAME ]; then
      echo "Found $(echo $FEDORA_FNAME) in the libvirt images directory."
      # Return to main menu.
      menu
    else
      wget -O $LV_CLD_IMG_DIR/$FEDORA_FNAME $FEDORA_CLD_IMG
      echo "Downloading $(echo $FEDORA_FNAME) into the libvirt images directory."
      # Return to main menu
      menu
    fi
}

d_centos_img() {
    if [ -e $LV_CLD_IMG_DIR/$CENTOS_FNAME ]; then
      echo "Found $(echo $CENTOS_FNAME) in the libvirt images directory."
      # Return to main menu.
      menu
    else
      wget -O $LV_CLD_IMG_DIR/$CENTOS_FNAME $CENTOS_CLD_IMG
      echo "Downloading $(echo $CENTOS_FNAME) into the libvirt images directory."
      # Return to main menu
      menu
    fi
}

d_opensuse_img() {
    if [ -e $LV_CLD_IMG_DIR/$OPENSUSE_FNAME ]; then
      echo "Found $(echo $OPENSUSE_FNAME) in the libvirt images directory."
      # Return to main menu.
      menu
    else
      wget -O $LV_CLD_IMG_DIR/$OPENSUSE_FNAME $OPENSUSE_CLD_IMG
      echo "Downloading $(echo $OPENSUSE_FNAME) into the libvirt images directory."
      # Return to main menu
      menu
    fi
}

ubuntu_quick() {
  local vm_name=uvm-$(date +%y%m%d-%H%M)
  local os_disk=$vm_name

  # Create cloud-init directory.
  echo "Creating a cloud-init directory for $vm_name."
  mkdir $LV_CLD_DIR/$vm_name

  # Create user-data file.
  cat > $LV_CLD_DIR/$vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
hostname: $vm_name
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$vm_name.iso \
  $LV_CLD_DIR/$vm_name/cloud-init.cfg
  
  # Copy the cloud image and rename it to the VM name.
  echo "Copying $vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$UBUNTU_FNAME $LV_IMG_DIR/$vm_name.qcow2
  
  # Resize cloud image disk.
  echo "Resizing VM disk space."
  qemu-img resize $LV_IMG_DIR/$vm_name.qcow2 $QUICK_DISK_SIZE
  
  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $vm_name \
    --memory $QUICK_MEM_SIZE \
    --vcpus=1 \
    --disk $LV_IMG_DIR/$vm_name.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$vm_name.iso,device=cdrom \
    --os-variant=ubuntu-lts-latest \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole
  
  # Return user back to main menu
  menu
}

ubuntu_custom() {
    # Asking user for specific parameters for the custom VM.
  while :; do
    read -p "VM name? " u_vm_name
    if [ -e $LV_IMG_DIR/$u_vm_name.qcow2 ]; then
      echo "The VM name $u_vm_name already exists. Please choose a new name."
    else
      break
    fi
  done
  read -p "VM disk size (in GB)? " u_vm_disk_size
  read -p "How many vCPUs? " u_vcpus
  read -p "How much memory (in MB)? " u_memory
  
  # Create cloud-init directory.
  echo "Creating a cloud-init directory for $u_vm_name."
  mkdir $LV_CLD_DIR/$u_vm_name

  # Create user-data file.
  cat > $LV_CLD_DIR/$u_vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
hostname: $u_vm_name
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$u_vm_name.iso \
  $LV_CLD_DIR/$u_vm_name/cloud-init.cfg

  # Copy the cloud image and rename it to the VM name.
  echo "Copying $u_vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$UBUNTU_FNAME $LV_IMG_DIR/$u_vm_name.qcow2
  
  # Resize VM disk size.
  echo "Resizing VM disk space to $u_vm_disk_size."
  qemu-img resize $LV_IMG_DIR/$u_vm_name.qcow2 $u_vm_disk_size

  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $u_vm_name \
    --memory $u_memory \
    --vcpus=$u_vcpus \
    --disk $LV_IMG_DIR/$u_vm_name.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$u_vm_name.iso,device=cdrom \
    --os-variant=ubuntu-lts-latest \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole

# Return to main menu.
  menu
}

debian_quick() {
  local vm_name=debvm-$(date +%y%m%d-%H%M)
  local os_disk=$vm_name

  # Create Cloud-init directory.
  echo "Creating a cloud-init directory for $vm_name."
  mkdir $LV_CLD_DIR/$vm_name

  # Create the cloud-init.cfg file.
  echo "Creating the cloud-init iso file."
  cat > $LV_CLD_DIR/$vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
hostname: $vm_name
ssh_pwauth: True
EOF

# Creates the cloud-init.iso file.
  cloud-localds $LV_CLD_INIT_ISO_DIR/$vm_name.iso \
  $LV_CLD_DIR/$vm_name/cloud-init.cfg
  
  # Copy the cloud image and rename it to the VM name.
  echo "Copying $vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$DEBIAN_FNAME $LV_IMG_DIR/$vm_name.qcow2
  
  # Resize cloud image disk.
  echo "Resizing VM disk space to $QUICK_DISK_SIZE."
  qemu-img resize $LV_IMG_DIR/$vm_name.qcow2 $QUICK_DISK_SIZE
  
  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $vm_name \
    --memory $QUICK_MEM_SIZE \
    --vcpus=1 \
    --disk $LV_IMG_DIR/$os_disk.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$vm_name.iso,device=cdrom \
    --os-variant=debian12 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole
  
  # Return to main menu.
  menu
}
debian_custom() {
  # Asking user for specific parameters for the custom VM.
  while :; do
    read -p "VM name? " deb_vm_name
    if [ -e $LV_IMG_DIR/$deb_vm_name.qcow2 ]; then
      echo "The VM name $deb_vm_name already exists. Please choose a new name."
    else
      break
    fi
  done
  read -p "VM disk size (in GB)? " deb_vm_disk_size
  read -p "How many vCPUs? " deb_vcpus
  read -p "How much memory (in MB)? " deb_memory
 
  # Create cloud-init directory.
  echo "Creating a cloud-init directory for $deb_vm_name."
  mkdir $LV_CLD_DIR/$deb_vm_name

  # Create the cloud-init.cfg file.
  echo "Creating the cloud-init iso file."
  cat > $LV_CLD_DIR/$deb_vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
hostname: $deb_vm_name
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  cloud-localds $LV_CLD_INIT_ISO_DIR/$deb_vm_name.iso \
  $LV_CLD_DIR/$deb_vm_name/cloud-init.cfg

  # Copy the cloud image and rename it to the VM name.
  echo "Copying $deb_vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$DEBIAN_FNAME $LV_IMG_DIR/$deb_vm_name.qcow2
  
  # Resize VM disk size.
  echo "Resizing VM disk space to $deb_vm_disk_size."
  qemu-img resize $LV_IMG_DIR/$deb_vm_name.qcow2 $deb_vm_disk_size

  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $deb_vm_name \
    --memory $deb_memory \
    --vcpus=$deb_vcpus \
    --disk $LV_IMG_DIR/$deb_vm_name.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$deb_vm_name.iso,device=cdrom \
    --os-variant=debian12 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole

# Return to main menu.
  menu
}

fedora_quick() {
  local vm_name=fvm-$(date +%y%m%d-%H%M)
  local os_disk=$vm_name
  
  # Create cloud-init directory.
  echo "Creating a new directory for $vm_name."
  mkdir $LV_CLD_DIR/$vm_name
  
  # Create meta-data file.
  cat > $LV_CLD_DIR/$vm_name/meta-data.cfg << EOF
#cloud-config
local-hostname: $vm_name
EOF
  # Create user-data file.
  cat > $LV_CLD_DIR/$vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$vm_name.iso \
  $LV_CLD_DIR/$vm_name/cloud-init.cfg $LV_CLD_DIR/$vm_name/meta-data.cfg
  
  # Copy the cloud image and rename it to the VM name.
  echo "Copying $vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$FEDORA_FNAME $LV_IMG_DIR/$vm_name.qcow2
  
  # Resize cloud image disk.
  echo "Resizing VM disk space."
  qemu-img resize $LV_IMG_DIR/$vm_name.qcow2 $QUICK_DISK_SIZE
  
  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $vm_name \
    --memory $QUICK_MEM_SIZE \
    --vcpus=1 \
    --disk $LV_IMG_DIR/$os_disk.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$vm_name.iso,device=cdrom \
    --os-variant=fedora38 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole

  # Return to main menu.
  menu
}

fedora_custom() {
  # Asking user for specific parameters for the custom VM.
  while :; do
    read -p "VM name? " f_vm_name
    if [ -e $LV_IMG_DIR/$f_vm_name.qcow2 ]; then
      echo "The VM name $f_vm_name already exists. Please choose a new name."
    else
      break
    fi
  done
  read -p "VM disk size (in GB)? " f_vm_disk_size
  read -p "How many vCPUs? " f_vcpus
  read -p "How much memory (in MB)? " f_memory

  # Create cloud-init directory.
  echo "Creating a cloud-init directory for $f_vm_name."
  mkdir $LV_CLD_DIR/$f_vm_name

  # Create meta-data file.
  cat > $LV_CLD_DIR/$f_vm_name/meta-data.cfg << EOF
#cloud-config
local-hostname: $f_vm_name
EOF
  # Create user-data file.
  cat > $LV_CLD_DIR/$f_vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$f_vm_name.iso \
  $LV_CLD_DIR/$f_vm_name/cloud-init.cfg $LV_CLD_DIR/$f_vm_name/meta-data.cfg

  # Copy the cloud image and rename it to the VM name.
  echo "Copying $f_vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$FEDORA_FNAME $LV_IMG_DIR/$f_vm_name.qcow2
  
  # Resize VM disk size.
  echo "Resizing VM disk space to $f_vm_disk_size."
  qemu-img resize $LV_IMG_DIR/$f_vm_name.qcow2 $f_vm_disk_size

  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $f_vm_name \
    --memory $f_memory \
    --vcpus=$f_vcpus \
    --disk $LV_IMG_DIR/$f_vm_name.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$f_vm_name.iso,device=cdrom \
    --os-variant=fedora38 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole

# Return to main menu.
  menu
}

centos_quick() {
  local vm_name=cvm-$(date +%y%m%d-%H%M)
  local os_disk=$vm_name
  
  # Create cloud-init directory.
  echo "Creating a new directory for $vm_name."
  mkdir $LV_CLD_DIR/$vm_name
  
  # Create meta-data file.
  cat > $LV_CLD_DIR/$vm_name/meta-data.cfg << EOF
#cloud-config
local-hostname: $vm_name
EOF
  # Create user-data file
  cat > $LV_CLD_DIR/$vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$vm_name.iso \
  $LV_CLD_DIR/$vm_name/cloud-init.cfg $LV_CLD_DIR/$vm_name/meta-data.cfg 
  
  # Copy the cloud image and rename it to the VM name.
  echo "Copying $vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$CENTOS_FNAME $LV_IMG_DIR/$vm_name.qcow2
  
  # Resize cloud image disk.
  echo "Resizing VM disk space."
  qemu-img resize $LV_IMG_DIR/$vm_name.qcow2 $QUICK_DISK_SIZE
  
  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $vm_name \
    --memory $QUICK_MEM_SIZE \
    --vcpus=1 \
    --disk $LV_IMG_DIR/$os_disk.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$vm_name.iso,device=cdrom \
    --os-variant=centos-stream9 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole
  # Return to main menu.
  menu

}

centos_custom() {
  # Asking user for specific parameters for the custom VM.
  while :; do
    read -p "VM name? " c_vm_name
    if [ -e $LV_IMG_DIR/$c_vm_name.qcow2 ]; then
      echo "The VM name $c_vm_name already exists. Please choose a new name."
    else
      break
    fi
  done
  read -p "VM disk size (in GB)? " c_vm_disk_size
  read -p "How many vCPUs? " c_vcpus
  read -p "How much memory (in MB)? " c_memory

  # Create cloud-init directory.
  echo "Creating a cloud-init directory for $c_vm_name."
  mkdir $LV_CLD_DIR/$c_vm_name

  # Create meta-data file.
  cat > $LV_CLD_DIR/$c_vm_name/meta-data.cfg << EOF
#cloud-config
local-hostname: $c_vm_name
EOF
  # Create user-data file.
  cat > $LV_CLD_DIR/$c_vm_name/cloud-init.cfg << EOF
#cloud-config
system_info:
  default_user:
    name: $USERNAME
    home: /home/$USERNAME

password: $PASSWORD
chpasswd: { expire: False }
ssh_pwauth: True
EOF

  # Creates the cloud-init.iso file.
  echo "Creating the cloud-init iso file."
  cloud-localds $LV_CLD_INIT_ISO_DIR/$c_vm_name.iso \
  $LV_CLD_DIR/$c_vm_name/cloud-init.cfg $LV_CLD_DIR/$c_vm_name/meta-data.cfg

  # Copy the cloud image and rename it to the VM name.
  echo "Copying $c_vm_name.qcow2 from cloud image file."
  cp $LV_CLD_IMG_DIR/$CENTOS_FNAME $LV_IMG_DIR/$c_vm_name.qcow2
  
  # Resize VM disk size.
  echo "Resizing VM disk space to $c_vm_disk_size."
  qemu-img resize $LV_IMG_DIR/$c_vm_name.qcow2 $c_vm_disk_size

  # Run the virt-install command to create the new VM.
  virt-install \
    --connect qemu:///system \
    --name $c_vm_name \
    --memory $c_memory \
    --vcpus=$c_vcpus \
    --disk $LV_IMG_DIR/$c_vm_name.qcow2,device=disk,bus=virtio \
    --disk $LV_CLD_INIT_ISO_DIR/$c_vm_name.iso,device=cdrom \
    --os-variant=centos-stream9 \
    --virt-type kvm \
    --graphics vnc \
    --network network=default,model=virtio \
    --import \
    --noautoconsole

# Return to main menu.
  menu
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
  local options=("Debian" "Ubuntu" "Fedora" "CentOS" "openSUSE" "All" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Debian")
        d_debian_img ;;
      "Ubuntu")
        d_ubuntu_img ;;
      "Fedora")
        d_fedora_img ;;
      "CentOS")
        d_centos_img ;;
      "openSUSE")
        d_opensuse_img ;;
      "All")
        d_debian_img
        d_ubuntu_img
        d_fedora_img
        d_centos_img
        d_opensuse_img
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
  echo "======================================================="
  echo "= The quick option creates a VM with predefined       =" 
  echo "= variables.                                          ="
  echo "=                                                     ="
  echo "= The custom option creates a VM with user specified  ="
  echo "= options.                                            ="
  echo "======================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        debian_quick ;;
      "Custom")
        debian_custom ;;
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
  echo "======================================================="
  echo "= The quick option creates a VM with predefined       =" 
  echo "= variables.                                          ="
  echo "=                                                     ="
  echo "= The custom option creates a VM with user specified  ="
  echo "= options.                                            ="
  echo "======================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        ubuntu_quick ;;
      "Custom")
        ubuntu_custom ;;
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
  echo "======================================================="
  echo "= The quick option creates a VM with predefined       =" 
  echo "= variables.                                          ="
  echo "=                                                     ="
  echo "= The custom option creates a VM with user specified  ="
  echo "= options.                                            ="
  echo "======================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        fedora_quick ;;
      "Custom")
        fedora_custom ;;
      "Main")
       echo "Return to main menu"
       menu
       ;;
      *) echo "Invalid option, please try again." ;;
    esac
  done
}

sub_centos() {
  echo
  echo "======================================================="
  echo "= The quick option creates a VM with predefined       =" 
  echo "= variables.                                          ="
  echo "=                                                     ="
  echo "= The custom option creates a VM with user specified  ="
  echo "= options.                                            ="
  echo "======================================================="
  echo
  local PS3="Please select an option below: "
  local options=("Quick" "Custom" "Main")
  local opt
  select opt in "${options[@]}"; do
    case $opt in
      "Quick")
        centos_quick ;;
      "Custom")
        centos_custom ;;
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
  echo "= Debian, Fedora, and Ubuntu, utilizing Cloud-init to prov- ="
  echo "= ide hostname, username, password, etc... to the VM.        ="
  echo "=                                                            ="
  echo "= Please select an option below to get started.              ="
  echo "=============================================================="
  echo
  PS3='Please select an option: '
  options=("Download" "Ubuntu" "Debian" "Fedora" "CentOS" "Help" "Quit")
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
      "CentOS")
        sub_centos ;;
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

# Checking for virt-install is install or not.
if [ -e /usr/bin/virt-install ]; then
  menu
else
echo "Virt-install appears to be not install. Please install virt-install and try again."
fi
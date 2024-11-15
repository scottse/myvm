# myvm


The myvm script is used for creating a quick VM using cloud-based images 

The setup:
1) Install virt-install and cloud-localds. Please refer to your distro package manager for the specific package name"
2) Create the directories - There are four variables LV_CLD_INIT, LV_CLD_IMG, LV_CLDINIT_ISO and LV_IMG which store cloud-init files, cloud images, isos, and the VM qcow2 files.
   - LV_IMG - The directory Stores the VM qcow2 files.
   - LV_CLD_INIT - This directory stores the cloud-init files.
   - LV_CLD_IMG - This directory stores the download Linux cloud images.
   - LV_CLDINIT_ISO - This directory stores the cloud-init iso made by cloud-localds.
3) Provide the username and password in the USERNAME and PASSWORD variable. Use commands like mkpasswd or openssl to create a hashed password. 
4) Generate a ssh-key pair and put the pubkey inside of the SSH_PUB_KEY variable.
5) Networking - In the VM_NETWORK type in which NIC or network device the VM will use, like default or br0.

Requirements:
The script needs virt-install and cloud-localds packages to be installed.

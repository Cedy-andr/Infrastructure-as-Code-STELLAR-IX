# VM configuration-specific

##################################################################################
# VARIABLES
##################################################################################

# Virtual Machine Settings

vm_name                 = "temp-debian-8"
vm_guest_os_type        = "debian8_64Guest"
vm_firmware             = "bios"
vm_cdrom_type           = "sata"
vm_cpu_sockets          = 2
vm_cpu_cores            = 2
vm_mem_size             = 4096
vm_disk_size            = 30720
thin_provision          = true
vm_disk_controller_type = ["pvscsi"]
vm_network_card         = "vmxnet3"
vm_boot_wait            = "5s"
ssh_username            = "cedric"
ssh_password            = "123456789"

# ISO Objects

iso_file          = "debian-8.11.1-amd64-DVD-1.iso"
iso_checksum      = "a3bd67cd363b609e1340cea06a666cb476b63fc79abf4380c0475dd1b6dc8a31"
iso_checksum_type = "sha256"
iso_url           = "https://cdimage.debian.org/cdimage/archive/8.11.1/amd64/iso-dvd/debian-8.11.1-amd64-DVD-1.iso"


# Scripts

# shell_scripts = ["./scripts/setup_ubuntu2204_withDocker.sh", "./scripts/script_no_dhcp.sh"]
